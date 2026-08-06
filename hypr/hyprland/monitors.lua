return function(shared)
    local outputs = {
        internal = {
            name = "eDP-1",
            mode = "1920x1080@60",
            position = "0x0",
            scale = 1,
        },
        external_candidates = {
            "DP-1",
            "DP-2",
            "DP-3",
            "DP-4",
            "USB-C-1",
            "USB-C-2",
            "HDMI-A-1",
            "HDMI-A-2",
        },
        external_mode = "1920x1080@75",
        external_position = "1920x0",
        external_scale = 1,
    }

    local function read_lid_state()
        local state_file = io.open("/proc/acpi/button/lid/LID/state", "r")
        if not state_file then
            return false
        end

        local state = state_file:read("*a")
        state_file:close()
        return state and state:match("closed") ~= nil
    end

    local lid_closed = read_lid_state()

    local function output_is_active(name)
        return hl.get_monitor(name) ~= nil
    end

    local function resolve_external_output()
        for _, name in ipairs(outputs.external_candidates) do
            if output_is_active(name) then
                return name
            end
        end

        return nil
    end

    local function configure_output(output, position)
        hl.monitor({
            output = output.name,
            mode = output.mode,
            position = position or output.position,
            scale = output.scale,
            disabled = false,
        })
    end

    local function disable_output(name)
        hl.monitor({
            output = name,
            disabled = true,
        })
    end

    local function move_workspace_range(first, last, monitor_name)
        for workspace_id = first, last do
            local workspace = hl.get_workspace(tostring(workspace_id))
            if workspace and (not workspace.monitor or workspace.monitor.name ~= monitor_name) then
                hl.dispatch(hl.dsp.workspace.move({
                    workspace = workspace_id,
                    monitor = monitor_name,
                }))
            end
        end
    end

    local function bind_workspace_range(first, last, monitor_name, default_workspace)
        for workspace_id = first, last do
            hl.workspace_rule({
                workspace = tostring(workspace_id),
                monitor = monitor_name,
                default = workspace_id == default_workspace,
            })
        end
    end

    local function restart_layer_clients()
        hl.exec_cmd("pkill -x waybar 2>/dev/null || true; pkill -x hyprpaper 2>/dev/null || true; waybar >/dev/null 2>&1 & hyprpaper >/dev/null 2>&1 &")
    end

    local function apply_laptop_profile()
        shared.monitor1 = outputs.internal.name
        shared.monitor2 = nil

        configure_output(outputs.internal)
        bind_workspace_range(1, 10, outputs.internal.name, 1)
        move_workspace_range(1, 10, outputs.internal.name)
        restart_layer_clients()
    end

    local function apply_dual_profile(external_name)
        shared.monitor1 = outputs.internal.name
        shared.monitor2 = external_name

        configure_output({
            name = external_name,
            mode = outputs.external_mode,
            position = outputs.external_position,
            scale = outputs.external_scale,
        })
        configure_output(outputs.internal)
        bind_workspace_range(1, 5, external_name, 1)
        bind_workspace_range(6, 10, outputs.internal.name, 6)
        move_workspace_range(1, 5, external_name)
        move_workspace_range(6, 10, outputs.internal.name)
        restart_layer_clients()
    end

    local function apply_docked_profile(external_name)
        shared.monitor1 = outputs.internal.name
        shared.monitor2 = external_name

        move_workspace_range(1, 10, external_name)
        disable_output(outputs.internal.name)
        configure_output({
            name = external_name,
            mode = outputs.external_mode,
            position = "0x0",
            scale = outputs.external_scale,
        }, "0x0")
        bind_workspace_range(1, 10, external_name, 1)
        restart_layer_clients()
    end

    local function reconcile_outputs()
        local external_name = resolve_external_output()

        if lid_closed and external_name then
            apply_docked_profile(external_name)
        elseif external_name then
            apply_dual_profile(external_name)
        else
            apply_laptop_profile()
        end
    end

    configure_output(outputs.internal)
    bind_workspace_range(1, 10, outputs.internal.name, 1)
    reconcile_outputs()

    hl.bind("switch:on:Lid Switch", function()
        lid_closed = true
        reconcile_outputs()
    end, { locked = true })

    hl.bind("switch:off:Lid Switch", function()
        lid_closed = false
        reconcile_outputs()
    end, { locked = true })

    hl.on("monitor.added", reconcile_outputs)
    hl.on("monitor.removed", reconcile_outputs)
end