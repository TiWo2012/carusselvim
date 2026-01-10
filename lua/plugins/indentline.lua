return {
    url = 'https://github.com/nvimdev/indentmini.nvim',
    event = "BufEnter",
    opts = {
        char = '▏',
        key = '<F5>',
        minlevel = 0,
        exclude = { 'markdown', 'help', 'text', 'rst' },
        exclude_nodetype = { 'string', 'comment' },
    },
}
