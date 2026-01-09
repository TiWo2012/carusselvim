return {
  "jiaoshijie/undotree",
  ---@module 'undotree.collector'
  ---@type UndoTreeCollector.Opts
  opts = {
    -- your options
  },
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
  config = function()
	local undotree = require('undotree')

	undotree.setup({
	  float_diff = false,  -- using float window previews diff, set this `true` will disable layout option
	  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
	  position = "left", -- "right", "bottom"
	  ignore_filetype = {
	    'undotree',
	    'undotreeDiff',
	    'qf',
	  },
	  window = {
	    winblend = 30,
	    border = "rounded", -- The string values are the same as those described in 'winborder'.
	    width = 20
	  },
	  keymaps = {
	    j = "move_next",
	    k = "move_prev",
	    gj = "move2parent",
	    J = "move_change_next",
	    K = "move_change_prev",
	    ['<cr>'] = "action_enter",
	    p = "enter_diffbuf",
	    q = "quit",
	  },
	})

	vim.api.nvim_create_user_command('Undotree', function(opts)
	  local args = opts.fargs
	  local cmd = args[1]

	  if cmd == "toggle" then
	    require("undotree").toggle()
	  elseif cmd == "open" then
	    require("undotree").open()
	  elseif cmd == "close" then
	    require("undotree").close()
	  else
	    vim.notify("Invalid subcommand: " .. (cmd or ""), vim.log.levels.ERROR)
	  end
	end, {
	  nargs = 1,
	  complete = function(_, line)
	    local subcommands = { "toggle", "open", "close" }
	    local input = vim.split(line, "%s+")
	    local prefix = input[#input]

	    return vim.tbl_filter(function(cmd)
	      return vim.startswith(cmd, prefix)
	    end, subcommands)
	  end,
	  desc = "Undotree command with subcommands: toggle, open, close",
	})

	-- set the undo directory and other stuff
	vim.opt.undofile = true
	vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
	vim.opt.undolevels = 10000
	vim.opt.undoreload = 10000

	vim.fn.mkdir("/undo", "p")
  end
}
