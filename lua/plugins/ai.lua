return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true, -- show suggestion panel
        auto_refresh = true,
      },
      suggestion = {
        enabled = true,      -- inline ghost text
        auto_trigger = true, -- show automatically
        keymap = {
          accept = "<C-\\>", -- accept suggestion
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-/>",
        },
      },
      filetypes = {
        java = true, -- enable for Java
        python = true,
        lua = true,
        ["*"] = true, -- all other filetypes
      },
    })
  end,
}
