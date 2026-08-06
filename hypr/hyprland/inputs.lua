return function()
    hl.config({
        input = {
            kb_layout = "us",
            kb_variant = "",
            follow_mouse = 1,
            touchpad = {
                natural_scroll = false,
                middle_button_emulation = false,
            },
            accel_profile = "flat",
            sensitivity = 0,
        },
        gestures = {
            workspace_swipe_distance = 250,
            workspace_swipe_cancel_ratio = 0.4,
            workspace_swipe_direction_lock = true,
        },
    })

    hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace",
    })
end