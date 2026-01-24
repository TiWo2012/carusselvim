local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

local function header_guard()
  local filename = vim.fn.expand("%:t:r")
  filename = filename:gsub("[^%w]", "_")
  return string.upper(filename) .. "_H__"
end

return {
  s("hguard", {
    "#ifndef __", f(header_guard), "\n",
    "#define __", f(header_guard), "\n\n",
    i(0),
    "\n\n#endif // __", f(header_guard),
  }),
}

