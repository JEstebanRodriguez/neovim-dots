return {
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({})
			-- vim.cmd("colorscheme vague")
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
