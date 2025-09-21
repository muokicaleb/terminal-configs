-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
config.colors = {
  foreground = "#CBE0F0",
  background = "#081e2b",
  cursor_bg = "#47FF9C",
  cursor_border = "#47FF9C",
  cursor_fg = "#011423",
  selection_bg = "#033259",
  selection_fg = "#CBE0F0",
  ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
  brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 10
config.enable_scroll_bar = true
config.scrollback_lines = 3500

-- Key bindings
config.keys = {
  -- Word movement
  {
    key = "LeftArrow",
    mods = "OPT",
    action = wezterm.action { SendString = "\x1bb" },
  },
  {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action { SendString = "\x1bf" },
  },

  -- Home/End keys
  {
    key = "Home",
    action = wezterm.action { SendString = "\x1b[H" },
  },
  {
    key = "End",
    action = wezterm.action { SendString = "\x1b[F" },
  },

  -- Pane splitting
  {
    key = "d",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "d",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },

  -- Pane navigation
  {
    key = "LeftArrow",
    mods = "CMD|OPT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "RightArrow",
    mods = "CMD|OPT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "UpArrow",
    mods = "CMD|OPT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "DownArrow",
    mods = "CMD|OPT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
}

-- and finally, return the configuration to wezterm
return config
