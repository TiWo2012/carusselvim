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
        vim.opt.number = false
        vim.opt.relativenumber = true
    end,
})

vim.opt.tabstop = 2      -- a tab is 4 spaces
vim.opt.shiftwidth = 2   -- autoindent uses 4 spaces
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true

-- always show gutter
vim.opt.signcolumn = "yes"
