local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

-- Get current filename without extension
local filename = function()
    return vim.fn.expand("%:t:r")
end

return {
    -- Full Java class snippet
    s("class", {
        t("public class "),
        f(filename, {}),          -- auto file/class name
        t({" {", "    "}),
        i(0),                      -- main insert position
        t({"", "}"})
    }),

    -- Java enum snippet
    s("enum", {
        t("public enum "),
        f(filename, {}),
        t({" {", "    "}),
        i(1, "VALUE1, VALUE2, VALUE3"), -- default enum entries
        t({"", "}"})
    }),

    -- Full Java program template
    s("main", {
        t("public class "),
        f(filename, {}),
        t({" {", "    public static void main(String[] args) {", "        "}),
        i(0, 'System.out.println("Hello World");'),
        t({"", "    }", "}"})
    }),
}
