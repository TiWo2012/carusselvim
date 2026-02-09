return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            
            -- Setup null-ls with common formatters and linters
            null_ls.setup({
                sources = {
                    -- Formatters
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.rustfmt,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.shfmt,
                    null_ls.builtins.formatting.gofmt,
                    
                    -- Linters
                    null_ls.builtins.diagnostics.eslint,
                    null_ls.builtins.diagnostics.flake8,
                    null_ls.builtins.diagnostics.ruff,
                    null_ls.builtins.diagnostics.shellcheck,
                    null_ls.builtins.diagnostics.golangci_lint,
                    null_ls.builtins.diagnostics.hadolint,
                },
                on_attach = function(client, bufnr)
                    -- Don't attach to null-ls sources if the LSP server is already attached
                    if client.name ~= "null-ls" then
                        return
                    end
                    
                    -- Set up keymaps for null-ls
                    vim.keymap.set("n", "<leader>gf", function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end, { buffer = bufnr, desc = "Format file with null-ls" })
                end,
            })
        end,
    },
}