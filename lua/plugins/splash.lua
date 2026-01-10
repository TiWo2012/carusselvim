return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {w }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
