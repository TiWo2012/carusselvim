return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        require("mini.animate").setup()
        require("mini.comment").setup({
            mappings = {
                comment = "gc",       -- normal mode
                comment_line = "gcc", -- normal mode single line
                textobject = "gc",    -- visual mode
            },
        })
        require("mini.notify").setup()
        require('mini.sessions').setup()
        require('mini.tabline').setup()
        require('mini.move').setup()
    end
}
