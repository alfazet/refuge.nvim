local config = {
    defaults = {
        transparent = true,
        highlight_overrides = {},
        palette_overrides = {},
    },
}
setmetatable(config, { __index = config.defaults })

return config
