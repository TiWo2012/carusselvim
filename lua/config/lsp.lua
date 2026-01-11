-- Mason
require("mason").setup()
local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- Neovim Lua dev
require("neodev").setup()

-- LSP capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Shared on_attach for all servers
local on_attach = function(client, bufnr)
    -- Keymaps
    local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end

    -- Indent settings
    vim.bo[bufnr].tabstop = 4
    vim.bo[bufnr].shiftwidth = 4
    vim.bo[bufnr].expandtab = true
    vim.bo[bufnr].smartindent = true
end

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- LuaSnip
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

require("luasnip.loaders.from_lua").lazy_load({
    paths = vim.fn.stdpath("config") .. "/snippets",
})

luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

-- Setup nvim-cmp
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    },
})

-- Setup autopairs integration
require("nvim-autopairs").setup({})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Mason-LSP setup
mason_lsp.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "rust_analyzer",
        "jsonls",
        "bashls",
        "taplo",
        "marksman",
    },
    handlers = {
        -- default handler
        function(server)
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end,

        -- Lua server override
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    },
                },
            })
        end,
    },
})

-- Diagnostic config
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
})
