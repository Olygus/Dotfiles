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
		center = true,
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
	hl.window_rule({
		name = "system-config-printer-float",
		match = {
			class = "^(system-config-printer)$",
		},
		float = true,
	})
	hl.window_rule({
		name = "simple-scan-float",
		match = {
			class = "org.gnome.SimpleScan",
		},
		float = true,
		center = true,
	})

	hl.window_rule({
		name = "thunar-float",
		match = {
			class = "^(thunar)$",
		},
		float = true,
		size = "960 600",
		center = true,
	})

	hl.window_rule({
		name = "blueman-float",
		match = {
			class = "^(blueman-manager)$",
		},
		float = true,
		size = "700 500",
		center = true,
	})

	hl.window_rule({
		name = "volume-control-float",
		match = {
			class = "org.pulseaudio.pavucontrol",
		},
		float = true,
		size = "750 600",
		center = true,
	})
	hl.window_rule({
		name = "obsidian-settings-float",
		match = { class = ".*obsidian.*", title = ".*Settings.*" },
		float = true,
		size = "950 650",
		center = true,
	})

	hl.window_rule({
		name = "obsidian-recovery-float",
		match = { class = ".*obsidian.*", title = ".*Recovery.*" },
		float = true,
		size = "950 650",
		center = true,
	})

	hl.window_rule({
		name = "obsidian-plugins-float",
		match = { class = ".*obsidian.*", title = ".*Plugins.*" },
		float = true,
		size = "950 650",
		center = true,
	})

	hl.window_rule({
		name = "steam-main-size",
		match = { class = ".*steam.*", title = ".*Steam.*" },
		size = "70% 100%",
	})

	hl.window_rule({
		name = "steam-friends-size",
		match = { class = ".*steam.*", title = ".*Friends.*" },
		float = true,
		size = "30% 100%",
	})

	hl.window_rule({
		name = "steam-settings-float",
		match = { class = ".*steam.*", title = ".*Settings.*" },
		float = true,
		size = "900 650",
		center = true,
	})

	hl.window_rule({
		name = "steam-updater-float",
		match = { class = ".*steam.*", title = ".*Updater.*" },
		float = true,
		size = "900 650",
		center = true,
	})

	hl.window_rule({
		name = "steam-screenshot-float",
		match = { class = ".*steam.*", title = ".*Screenshot.*" },
		float = true,
		size = "900 650",
		center = true,
	})

	hl.window_rule({
		name = "steam-chat-float",
		match = { class = ".*steam.*", title = ".*Chat.*" },
		float = true,
		size = "900 650",
		center = true,
	})

	hl.window_rule({
		name = "steam-nonsteam-float",
		match = { class = ".*steam.*", title = ".*Add Non%-Steam.*" },
		float = true,
		size = "900 650",
		center = true,
	})
end
