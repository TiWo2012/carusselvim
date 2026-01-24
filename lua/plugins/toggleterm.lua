return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "vertical",
      size = function(term)
        if term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.35)
        end
        return 15
      end,
      float_opts = {
        border = "rounded",
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    local shell = Terminal:new({
      direction = "vertical",
      hidden = true,
      cwd = function()
        return vim.fn.getcwd()
      end,
    })

    local function lazygit_toggle()
      Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
        close_on_exit = true,
        cwd = vim.fn.getcwd(),
        float_opts = {
          border = "rounded",
          width = math.floor(vim.o.columns * 0.9),
          height = math.floor(vim.o.lines * 0.9),
        },
      }):toggle()
    end

    vim.keymap.set("n", "<leader>gg", lazygit_toggle, { desc = "Lazygit (cwd aware)" })

    vim.keymap.set("n", "<leader>to", function()
      shell:toggle()
    end, { desc = "Toggle vertical terminal" })

    vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
  end,
}
