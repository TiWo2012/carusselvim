return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
                header = {
                    '',
                    '',
                    ' ███╗   ██╗███████╗ ██████╗ ██████╗ ██╗   ██╗ █████╗ ██████╗ ',
                    ' ████╗  ██║██╔════╝██╔════╝ ██╔══██╗██║   ██║██╔══██╗██╔══██╗',
                    ' ██╔██╗ ██║█████╗  ██║  ███╗██║  ██║██║   ██║███████║██║  ██║',
                    ' ██║╚██╗██║██╔══╝  ██║   ██║██║  ██║╚██╗ ██║██╔══██║██║  ██║',
                    ' ██║ ╚████║███████╗╚██████╔╝██████╔╝ ╚████╔╝ ██║  ██║██████╔╝',
                    ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝   ╚═══╝  ╚═╝  ╚═╝╚═════╝  ',
                    '',
                    '',
                },
                center = {
                    { icon = '  ', desc = 'New File          ', action = 'ene | startinsert', key = 'n' },
                    { icon = '  ', desc = 'Recent Files      ', action = 'Telescope oldfiles', key = 'r' },
                    { icon = '  ', desc = 'Find File         ', action = 'Telescope find_files', key = 'f' },
                    { icon = '  ', desc = 'Grep              ', action = 'Telescope live_grep', key = 'g' },
                    { icon = '  ', desc = 'Projects          ', action = 'Telescope projects', key = 'p' },
                    { icon = '  ', desc = 'Keymaps           ', action = 'Telescope keymaps', key = 'k' },
                    { icon = '  ', desc = 'File Explorer     ', action = 'NvimTreeToggle', key = 'e' },
                    { icon = '  ', desc = 'Quit              ', action = 'qa', key = 'q' },
                },
                footer = { 'vim -- carrusel edition' },
            }
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
