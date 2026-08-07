return function(shared)
	local mainMod = shared.mainMod
	local terminal = shared.terminal
	local fileManager = shared.fileManager
	local menu = shared.menu

	local function bind(keys, dispatcher, flags)
		hl.bind(keys, dispatcher, flags)
	end

	local function exec(keys, command, flags)
		bind(keys, hl.dsp.exec_cmd(command), flags)
	end

	exec(mainMod .. " + " .. "SHIFT" .. " + " .. "R", "hyprctl switchxkblayout current next")
	exec(mainMod .. " + " .. "S", "hyprshot -m region --freeze")
	exec("PRINT", "hyprshot -m output")
	exec("SHIFT + PRINT", "hyprshot -m region")
	exec(mainMod .. " + " .. "SHIFT" .. " + " .. "V", "cliphist list| rofi -dmenu| cliphist decode| wl-copy")
	exec(mainMod .. " + " .. "SHIFT" .. " + " .. "W", "~/.config/rofi/rofi-wifi-menu.sh")

	exec(mainMod .. " + " .. "Return", terminal)
	bind(mainMod .. " + " .. "Q", hl.dsp.window.close())
	exec(mainMod .. " + " .. "M", "~/.config/rofi/rofi-power-menu.sh")
	exec(mainMod .. " + " .. "E", fileManager)
	bind(mainMod .. " + " .. "V", hl.dsp.window.float())
	exec(mainMod .. " + " .. "D", menu)
	exec(mainMod .. " + " .. "C", "code")
	exec(mainMod .. " + " .. "o", "obsidian")
	exec(mainMod .. " + " .. "B", "firefox")
	exec(mainMod .. " + " .. "N", "rnote")
	exec(mainMod .. " + " .. "X", "hyprlock")
	exec(mainMod .. " + " .. "SHIFT" .. " + " .. "D", "vesktop")

	for workspace = 1, 10 do
		local key = workspace % 10
		bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
		bind(mainMod .. " + " .. "SHIFT" .. " + " .. key, hl.dsp.window.move({ workspace = workspace }))
	end

	bind(mainMod .. " + " .. "Space", function()
		hl.dispatch(hl.dsp.workspace.toggle_special("scratchpad"))
	end)
	bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.window.move({ workspace = "special:scratchpad" }))

	bind(mainMod .. " + " .. "Tab", hl.dsp.focus({ workspace = "r+1" }))
	bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Tab", hl.dsp.focus({ workspace = "r-1" }))

	bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
	bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

	bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())

	bind("ALT + Tab", function()
		hl.dispatch(hl.dsp.window.cycle_next())
		hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
	end)

	exec("XF86AudioRaiseVolume", "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+")
	exec("XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
	exec("XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
	exec("XF86AudioMicMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", { locked = true })
	exec(mainMod .. " + " .. "F4", "setsid sh ~/.local/bin/toggle-mic.sh >/dev/null 2>&1 &", { locked = true })
	exec("F4", "setsid sh ~/.local/bin/toggle-mic.sh >/dev/null 2>&1 &")
	exec("XF86MonBrightnessUp", "brightnessctl set 5%+")
	exec("XF86MonBrightnessDown", "brightnessctl set 5%-")

	bind(mainMod .. " + " .. "H", hl.dsp.window.move({ direction = "l" }))
	bind(mainMod .. " + " .. "L", hl.dsp.window.move({ direction = "r" }))
	bind(mainMod .. " + " .. "K", hl.dsp.window.move({ direction = "u" }))
	bind(mainMod .. " + " .. "J", hl.dsp.window.move({ direction = "d" }))
end
