local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font({
	family = "Hack Nerd Font",
	weight = "Regular",
})
config.font_size = 20
config.window_background_opacity = 0.8
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 5,
	right = 5,
	top = 0,
	bottom = 0,
}
return config
