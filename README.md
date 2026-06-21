# Refuge

A colorscheme full of red and pink glow inspired by the game [OneShot](https://store.steampowered.com/app/420530/OneShot).

<p align="center">
  <img src="https://files.alfazet.xyz/public/refuge_theme_example.png">
</p>

## Installation

Example setup with `vim.pack`:
```lua
vim.pack.add({
    "https://codeberg.org/alfazet/refuge.nvim",
})

local theme = require("refuge/init")
theme.setup({
    -- optional, true by default
    transparent = true,
    -- optional, if you want to override any of the colors
    palette_overrides = { fg1 = "#00ff00" },
    -- optional, if you want to override any of the highlight groups
    highlight_overrides = { Boolean = { fg = "#0000ff" } },
})
```
