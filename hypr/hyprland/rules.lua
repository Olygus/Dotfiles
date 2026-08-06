return function()
    hl.window_rule({
        name = "suppress_event_maxim",
        match = {
            class = ".*",
        },
        suppress_event = "maximize",
    })

    hl.window_rule({
        name = "loupe-dialog",
        match = {
            class = "^(loupe)$",
        },
        float = true,
        size = "960 540",
        center = true,
    })
    hl.window_rule({
        name = "vlc-float",
        match = {
            class = "^(vlc)$",
        },
        float = true,
    })

    hl.window_rule({
        name = "steam-friends-size",
        match = {
            class = "steam",
            title = "Friends List",
        },
        size = "30% 100%",
    })
    hl.window_rule({
        name = "steam-main-size",
        match = {
            class = "steam",
            title = "Steam",
        },
        size = "70% 100%",
    })

    hl.layer_rule({
        match = { namespace = "^(hyprpicker)$" },
        no_anim = true,
    })

    hl.layer_rule({
        match = { namespace = "^(selection)$" },
        no_anim = true,
    })

    hl.window_rule({
        match = { class = "^(obsidian)$" },
        opacity = 0.8,
    })

    hl.window_rule({
        match = { class = "^(Spotify)$" },
        opacity = 0.75,
    })

    hl.window_rule({
        match = { class = "^(vesktop)$" },
        opacity = 0.83,
    })

--    hl.window_rule({
--        match = { class = "^(org\.pwmt\.zathura)$" },
--        opacity = 0.90,
--    })

    hl.window_rule({
        match = { class = "^(pcmanfm-qt)$" },
        opacity = 0.80,
    })

    hl.window_rule({
        match = { class = "^(Code)$" },
        opacity = 0.90,
    })
end