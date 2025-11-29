local wezterm = require("wezterm")

local config = wezterm.config_builder()
local action = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.color_scheme = "Tokyo Night Moon"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.window_frame = {
	font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
}

config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

config.use_dead_keys = false
config.scrollback_lines = 10000

-- config.swap_backspace_and_delete = false
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

config.keys = {
	{ mods = "OPT", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = action.SendKey({ mods = "CTRL", key = "u" }) },
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action({ ClearScrollback = "ScrollbackAndViewport" }),
	},
	{
		key = "k",
		mods = "CMD|SHIFT",
		action = action.ClearScrollback("ScrollbackOnly"),
	},
}

return config
