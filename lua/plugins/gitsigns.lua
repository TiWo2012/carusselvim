return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.opt.signcolumn = "yes"

        -- LSP: color line numbers only
        local signs = { Error = "Red", Warn = "Yellow", Hint = "Blue", Info = "Green" }
        for type, color in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.cmd(string.format("highlight %s guifg=%s guibg=NONE", hl, color))
            vim.fn.sign_define(hl, { text = "", texthl = hl, numhl = hl })
        end

        -- Gitsigns
        require("gitsigns").setup({
            signs = {
                add = { text = "│" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            signcolumn = true,
        })

        local gs = package.loaded.gitsigns
        local map = vim.keymap.set

        map("n", "<leader>ghs", gs.stage_hunk, { desc = "Git stage hunk" })
        map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Git undo stage hunk" })
        map("n", "<leader>ghr", gs.reset_hunk, { desc = "Git reset hunk" })
        map("n", "<leader>ghp", gs.preview_hunk, { desc = "Git preview hunk" })
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, { desc = "Git blame line" })
        map("n", "<leader>ghB", gs.toggle_current_line_blame, { desc = "Toggle blame virtual text" })
        map("n", "<leader>ghd", gs.diffthis, { desc = "Git diff this file" })
        map("n", "<leader>ghD", gs.toggle_deleted, { desc = "Toggle deleted signs" })
    end,
}
