return function()
	hl.config({
		general = {
			gaps_in = 0,
			gaps_out = 0,
			border_size = 2,
			["col.active_border"] = "rgb(89b482)",
			["col.inactive_border"] = "rgb(d3c6aa)",
			layout = "dwindle",
			allow_tearing = false,
		},
		decoration = {
			rounding = 0,
			blur = {
				enabled = false,
				size = 3,
				passes = 3,
				new_optimizations = true,
				ignore_opacity = true,
				noise = 0,
			},
		},
		animations = {
			enabled = false,
			animation = {
				"windowsIn, 1, 1, outQuint, slide bottom",
				"windowsOut, 1, 1, outQuint, slide bottom",
				"workspaces, 0",
				"fade, 0",
			},
		},
		master = {
			new_status = "master",
		},
		gestures = {},
		misc = {
			force_default_wallpaper = -1,
			middle_click_paste = false,
		},
	})

	hl.curve("outQuint", { type = "bezier", points = { { 0.22, 1.00 }, { 0.36, 1.00 } } })
	hl.curve("inOutCubic", { type = "bezier", points = { { 0.65, 0.00 }, { 0.35, 1.00 } } })
end
