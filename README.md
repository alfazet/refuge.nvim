# Refuge

A color scheme to illuminate your editor. Does not require frequent replacement to keep glowing.

<p align="center">
  <img src="https://github.com/alfazet/refuge.nvim/blob/main/images/example.png">
</p>

## Installation

Example setup with `lazy.nvim`:
```lua
return {
    "alfazet/refuge.nvim",
    config = function()
        local theme = require("refuge/init")
        theme.setup({
            -- default: true
            transparent = true,
            -- optional, if you want to override any of the colors
            palette_overrides = { fg1 = "#00ff00" },
            -- optional, if you want to override any of the highlight groups
            highlight_overrides = { Boolean = { fg = "#0000ff" } },
        })
        theme.colorscheme()
    end,
}
```
