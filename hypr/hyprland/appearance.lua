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

    -- Easing curves used by animations when animation rules reference them.
    -- outQuint starts fast and slows near the end; inOutCubic eases in and out smoothly.
    hl.curve("outQuint", { type = "bezier", points = { { 0.22, 1.00 }, { 0.36, 1.00 } } })
    hl.curve("inOutCubic", { type = "bezier", points = { { 0.65, 0.00 }, { 0.35, 1.00 } } })
end