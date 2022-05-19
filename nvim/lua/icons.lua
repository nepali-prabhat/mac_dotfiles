local _icons = {
    bar = {
        thick = "┃",
        thin = "│"
    },
    diag = {
        error = "",
        warn = "",
        hint = "ﯦ",
        info = "",
        pass = "",
        virtual = ""
    },
    diff = {
        add = "",
        mod = "",
        del = ""
    },
    file = {
        mod = "",
        lock = ""
    },
    git = {
        branch = ""
    },
    lang = {
        Class = "",
        Color = "",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "𝒙",
        File = "",
        Folder = "ﱮ",
        Function = "",
        Interface = "",
        Keyword = "",
        Method = "",
        Module = "",
        Operator = "+",
        Property = "",
        Reference = "漏",
        Snippet = "…",
        Struct = "⚎",
        Text = "",
        TypeParameter = "",
        Unit = "塞",
        Value = "",
        Variable = "𝒙",
    }
}

local icons = vim.tbl_extend("force", {}, _icons)
for name, section in pairs(_icons) do
    for k, v in pairs(section) do
        icons[name]["_" .. k] = " " .. v -- leading space
        icons[name][k .. "_"] = v .. " " -- trailing space
        icons[name]["_" .. k .. "_"] = " " .. v .. " " -- both
    end
end

return icons

