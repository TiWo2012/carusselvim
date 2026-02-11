-- vim.keymap.set("n", "<c-h>", "<c-w>h")
-- vim.keymap.set("n", "<c-j>", "<c-w>j")
-- vim.keymap.set("n", "<c-k>", "<c-w>k")
-- vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<leader>ut", require("undotree").toggle)

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.keymap.set("n", "<leader>w", ":lua vim.cmd('write')<CR>")
