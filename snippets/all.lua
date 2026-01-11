local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

return {
  s("date", {
    f(function()
      return os.date("%Y-%m-%d")
    end),
  }),
  s("header", {
    t({
      "// File: ",
    }),
    f(function()
      return vim.fn.expand("%:t")
    end),
    t({
      "",
      "// Created: ",
    }),
    f(function()
      return os.date("%Y-%m-%d")
    end),
    t({
      "",
      "",
    }),
  }),
}
