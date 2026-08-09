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
			workspace_swipe_distance = 180,
			workspace_swipe_cancel_ratio = 0.1,
			workspace_swipe_direction_lock = false,
		},
	})

	hl.gesture({
		fingers = 3,
		direction = "horizontal",
		action = "workspace",
	})

	hl.gesture({
		fingers = 3,
		direction = "up",
		action = "special",
		workspace_name = "scratchpad",
	})

	hl.gesture({
		fingers = 3,
		direction = "down",
		action = "special",
		workspace_name = "scratchpad",
	})
end
