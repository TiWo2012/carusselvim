return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",     -- required for UI components
    },
    opts = {
        -- enable all message routes
        messages = {
            enabled = true,
            view = "notify",     -- animated notification style
        },

        -- command line UI
        cmdline = {
            enabled = true,     -- enable animated command line
            view = "cmdline_popup",
            opts = {
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    width = 60,
                },
            },
        },

        -- popup menu (like completion)
        popupmenu = {
            enabled = true,
            backend = "nui",     -- animated menu
        },

        -- enable LSP progress with animated spinner
        lsp = {
            progress = {
                enabled = true,
                spinner = "dots",     -- can also be "moon", "line", etc
            },
        },

        -- animations for notifications/messages
        routes = {
            {
                filter = { event = "msg_show" },
                view = "notify",
                opts = { skip = false },
            },
        },

        -- nice defaults for animations
        presets = {
            long_message_to_split = true,
            bottom_search = true,
            command_palette = true,
            inc_rename = true,
            lsp_doc_border = true,
        },
    },
    config = function(_, opts)
        require("noice").setup(opts)
    end,
}
