local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font_with_fallback({
    { family = "Hack Nerd Font Mono", weight = "Regular" },
    { family = "Fira Code",           weight = "Regular" },
    { family = "Courier",             weight = "Regular" },
})
config.font_size = 22

config.color_scheme = 'Aci (Gogh)'
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.default_prog = { "/opt/homebrew/bin/bash", "-l" } -- or "zsh", "fish", etc.

config.keys = {
    -- Make CMD/CTRL+Enter send to tmux
    { key = "Enter", mods = "CMD", action = wezterm.action.SendString "\x0d" },
}

config.window_padding = {
    left = 4,
    right = 4,
    top = 2,
    bottom = 2,
}
-- {
--     "dpi": 72,
--     "is_full_screen": false,
--     "pixel_height": 2102,
--     "pixel_width": 2518,
-- }
config.initial_rows = 87
config.initial_cols = 200

config.window_background_gradient = {
    -- preset = "Cividis",
    colors = {
        "#0d113d",
        "#D84315"
    },
    -- orientation = "Horizontal",
    -- orientation = { Linear = { angle = -45.0 } },
    orientation = {
        Radial = {
            cx = 0.50,
            cy = 0.50,
            radius = 3.75,
        }
    }
}

-- Optional: switch tabs with Option+number
config.key_map_preference = "Mapped" -- better for tmux
config.use_ime = false

return config
