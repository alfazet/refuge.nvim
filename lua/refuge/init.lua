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

    local bg = (config.transparent and "none") or colors.bg_a
    local fg = colors.fg_c
    local groups = {
        Normal = { bg = bg, fg = fg },
        Comment = { fg = utils.mix(colors.fg_b, colors.bg_b, 0.5), italic = true },

        String = { fg = colors.sec_a },
        Character = { link = "String" },
        SpecialChar = { link = "String" },

        Constant = { fg = colors.sec_b },
        Define = { link = "Constant" },
        Macro = { link = "Constant" },
        Boolean = { link = "Constant" },

        Number = { fg = colors.sec_c },
        Operator = { fg = colors.fg_b },
        Float = { link = "Number" },

        Keyword = { fg = colors.pri_a },
        Statement = { link = "Keyword" },
        Conditional = { link = "Keyword" },
        Label = { link = "Keyword" },
        PreProc = { link = "Keyword" },

        Function = { fg = colors.pri_b },
        Identifier = { link = "Function" },
        Method = { link = "Function" },
        Property = { link = "Function" },
        Field = { link = "Function" },
        Parameter = { link = "Function" },

        Type = { fg = colors.pri_c },
        Struct = { link = "Type" },
        Class = { link = "Type" },
        Exception = { link = "Type" },

        Delimiter = { fg = colors.fg_a },
        Special = { link = "Delimiter" },
        SpecialKey = { link = "Delimiter" },
        Conceal = { link = "Delimiter" },

        LineNr = { fg = utils.mix(colors.fg_a, colors.bg_c, 0.5) },
        CursorLineNr = { fg = colors.fg_a },
        NonText = { link = "LineNr" },

        IncSearch = { bg = colors.att_c, fg = colors.bg_a },
        Substitute = { link = "IncSearch" },
        Search = { link = "IncSearch" },
        MatchParen = { link = "IncSearch" },

        QuickFixList = { fg = fg },
        QuickFixLine = { fg = colors.fg_a },
        Directory = { link = "QuickFixList" },

        StatusLine = { bg = bg, fg = colors.pri_c },
        Question = { link = "StatusLine" },
        MoreMsg = { link = "StatusLine" },
        ModeMsg = { link = "StatusLine" },

        Visual = { bg = colors.fg_a, fg = colors.bg_a },
        VisualNOS = { link = "Visual" },

        PMenu = { bg = colors.bg_a },
        PMenuSel = { bg = colors.bg_b },
        PMenuBorder = { fg = colors.bg_c },
        Ignore = { fg = colors.bg_c },

        Error = { fg = colors.att_a },
        ExtraWhitespace = { link = "Error" },
        Todo = { link = "Error" },

        Added = { fg = colors.fg_a },
        Removed = { fg = colors.pri_a },
        Changed = { fg = colors.ter_a },

        DiffAdd = { fg = colors.fg_a },
        DiffDelete = { fg = colors.pri_a },
        DiffChange = { fg = colors.ter_a },
        DiffText = { fg = colors.sec_a },

        Underlined = { underline = true },
        Bold = { bold = true },
        Italic = { italic = true },

        DiagnosticError = { fg = colors.att_a },
        DiagnosticWarn = { fg = colors.att_c },
        DiagnosticInfo = { fg = colors.ter_a },
        DiagnosticHint = { fg = colors.ter_c },
        DiagnosticOk = { fg = fg },

        DiagnosticUnderlineError = { undercurl = true },
        DiagnosticUnderlineWarn = { undercurl = true },
        DiagnosticUnderlineInfo = { undercurl = true },
        DiagnosticUnderlineHint = { undercurl = true },
        DiagnosticUnderlineOk = { undercurl = true },

        ["@text"] = { fg = fg },
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
