vim.cmd.colorscheme("catppuccin")

vim.opt.clipboard = "unnamedplus"
vim.opt.number = false
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = true
  end,
})

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
