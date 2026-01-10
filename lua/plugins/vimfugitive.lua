return {
    "tpope/vim-fugitive",
    config = function()
        -- In your Lua config (after plugin is loaded)
        local map = vim.keymap.set

        -- Open git status quickly
        map("n", "<leader>gs", ":G<CR>", { desc = "Git status" })
        -- Stage current file
        map("n", "<leader>ga", ":G write<CR>", { desc = "Git add current file" })
        -- Git commit
        map("n", "<leader>gc", ":G commit<CR>", { desc = "Git commit" })
        -- Git push
        map("n", "<leader>gp", ":G push<CR>", { desc = "Git push" })

        map("n", "<leader>gl", ":G pull<CR>", { desc = "Git pull" })
        -- Git blame for current file
        map("n", "<leader>gb", ":G blame<CR>", { desc = "Git blame" })
        map("n", "<leader>gd", ":G diffsplit<CR>", { desc = "Git diff current file" })

        vim.api.nvim_create_autocmd("User", {
            pattern = "FugitiveUpdated",
            callback = function()
                vim.cmd("edit")
            end,
        })
    end
}
