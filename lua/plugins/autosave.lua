return {
	"Pocco81/auto-save.nvim",
	enable = false,
	config = function()
		require("auto-save").setup({
			-- your config goes here
			-- or just leave it empty :)
			vim.keymap.set("n", "<leader>st", "<cmd>ASToggle<CR>"),
		})
	end,
}
