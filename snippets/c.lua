local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local t = ls.text_node

local function fileName()
  return vim.fn.expand("%:t:r"):upper():gsub("[^A-Z0-9_]", "_")
end

return {
  s("guard", {
    f(function()
      local n = fileName()
      return {
        "#ifndef __" .. n .. "_H__",
        "#define __" .. n .. "_H__",
        "",
      }
    end, {}),
    i(1),
    t({ "", "" }),
    f(function()
      local n = fileName()
      return "#endif // __" .. n .. "_H__"
    end, {}),
  }),
}
