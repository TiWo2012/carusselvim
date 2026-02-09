vim.cmd.colorscheme "catppuccin"

vim.opt.clipboard = "unnamedplus"
vim.opt.number = false
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
})

vim.opt.tabstop = 4      -- a tab is 4 spaces
vim.opt.shiftwidth = 4   -- autoindent uses 4 spaces
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true

vim.opt.scrolloff = 8

-- always show gutter
vim.opt.signcolumn = "yes"

-- set some neovide specific stuff
vim.o.guifont = "Hack Nerd Font:h11"

vim.g.neovide_opacity = 0.80
vim.g.neovide_background_color = "#0f1117"

vim.g.neovide_scale_factor = 1.0

-- Enable font ligatures for Neovide
vim.g.neovide_enable_ligatures = true

vim.keymap.set("n", "<C-+>", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end)

vim.keymap.set("n", "<C-->", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end)

vim.keymap.set("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end)
