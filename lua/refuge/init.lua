local colors = require("refuge.colors")
local config = require("refuge.config")
local utils = require("refuge.utils")
local theme = {}

function theme.setup(values)
    setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, values) })
end

function theme.colorscheme()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "refuge"

    for color, hex in pairs(config.palette_overrides) do
        colors[color] = hex
    end

    local bg = (config.transparent and "none") or colors.bg1
    local groups = {
        Normal = { bg = bg, fg = colors.fg1 },
        Comment = { fg = utils.mix(colors.bg5, colors.fg1, 0.75), italic = true },
        Constant = { fg = colors.red3 },
        Define = { link = "Constant" },
        Macro = { link = "Constant" },
        Boolean = { fg = colors.red3 },
        String = { fg = colors.beige3 },
        Character = { fg = colors.beige3 },
        SpecialChar = { fg = colors.beige3 },
        Number = { fg = utils.mix(colors.red3, colors.fg1, 0.75) },
        Float = { link = "Number" },

        Function = { fg = colors.pink1 },
        Identifier = { link = "Function" },
        Method = { link = "Function" },
        Property = { link = "Function" },
        Field = { link = "Function" },
        Parameter = { link = "Function" },
        Keyword = { fg = colors.red3 },
        Statement = { link = "Keyword" },
        Conditional = { link = "Keyword" },
        Label = { link = "Keyword" },
        PreProc = { link = "Keyword" },
        Operator = { fg = utils.mix(colors.red3, colors.fg1, 0.5) },
        Type = { fg = colors.pink3 },
        Struct = { link = "Type" },
        Class = { link = "Type" },
        Exception = { link = "Type" },
        Delimiter = { fg = utils.mix(colors.pink1, colors.fg1, 0.5) },
        Special = { fg = utils.mix(colors.pink1, colors.fg1, 0.5) },
        SpecialKey = { fg = colors.pink1 },
        Conceal = { fg = colors.pink1 },

        LineNr = { fg = utils.mix(colors.bg5, colors.beige3, 0.5) },
        NonText = { link = "LineNr" },
        CursorLineNr = { fg = colors.beige3 },
        IncSearch = { bg = colors.yellow, fg = colors.bg3 },
        Substitute = { link = "IncSearch" },
        Search = { link = "IncSearch" },
        MatchParen = { bg = colors.yellow, fg = colors.bg3 },
        QuickFixLine = { fg = colors.fg5 },
        QuickFixList = { fg = colors.fg3 },
        Directory = { link = "QuickFixList" },
        StatusLine = { bg = bg, fg = colors.red1 },
        Question = { link = "StatusLine" },
        MoreMsg = { link = "StatusLine" },
        ModeMsg = { link = "StatusLine" },
        Visual = { bg = colors.pink3, fg = colors.bg3 },
        VisualNOS = { link = "Visual" },
        PMenu = { bg = colors.bg3 },
        PMenuSel = { bg = colors.bg5 },
        ExtraWhitespace = { fg = colors.yellow },
        Ignore = { fg = colors.bg3 },
        Todo = { fg = colors.yellow, bold = true },
        Error = { fg = colors.red5 },
        Underlined = { underline = true },
        Bold = { bold = true },
        Italic = { italic = true },

        DiagnosticError = { fg = colors.red3 },
        DiagnosticWarn = { fg = colors.yellow },
        DiagnosticInfo = { fg = colors.beige3 },
        DiagnosticHint = { fg = colors.pink3 },
        DiagnosticOk = { fg = colors.fg1 },

        DiagnosticUnderlineError = { undercurl = true },
        DiagnosticUnderlineWarn = { undercurl = true },
        DiagnosticUnderlineInfo = { undercurl = true },
        DiagnosticUnderlineHint = { undercurl = true },
        DiagnosticUnderlineOk = { undercurl = true },

        ["@text"] = { fg = colors.fg1 },
        ["@texcolors.literal"] = { link = "Property" },
        ["@texcolors.strong"] = { link = "Bold" },
        ["@texcolors.italic"] = { link = "Italic" },
        ["@texcolors.title"] = { link = "Keyword" },
        ["@texcolors.uri"] = { link = "String" },
        ["@texcolors.underline"] = { link = "Underlined" },
        ["@texcolors.todo"] = { link = "Todo" },
        ["@comment"] = { link = "Comment" },
        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { link = "Constant" },
        ["@constancolors.builtin"] = { link = "Keyword" },
        ["@string"] = { link = "String" },
        ["@string.escape"] = { link = "String" },
        ["@string.special"] = { link = "String" },
        ["@string.special.url"] = { link = "String" },
        ["@number"] = { link = "Number" },
        ["@boolean"] = { link = "Boolean" },
        ["@function"] = { link = "Function", italic = true },
        ["@function.call"] = { link = "Function" },
        ["@function.builtin"] = { link = "Function" },
        ["@parameter"] = { link = "Parameter" },
        ["@method"] = { link = "Function" },
        ["@field"] = { link = "Property" },
        ["@property"] = { link = "Property" },
        ["@label"] = { link = "Label" },
        ["@operator"] = { link = "Operator" },
        ["@exception"] = { link = "Exception" },
        ["@variable"] = { fg = colors.fg1, italic = true },
        ["@variable.builtin"] = { link = "Keyword" },
        ["@type"] = { link = "Type" },
        ["@type.definition"] = { link = "Type" },
        ["@type.builtin"] = { link = "Type" },
        ["@type.qualifier"] = { link = "Type" },
        ["@keyword"] = { link = "Keyword" },
        ["@namespace"] = { link = "Type" },
        ["@annotation"] = { link = "Label" },
        ["@attribute"] = { link = "Attribute" },
        ["@error"] = { link = "Error" },
        ["@punctuation.bracket"] = { link = "Special" },
    }

    groups = vim.tbl_extend("force", groups, config.highlight_overrides)
    for group, parameters in pairs(groups) do
        vim.api.nvim_set_hl(0, group, parameters)
    end
end

return theme
