return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				-- List of servers to auto-install
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"jsonls",
					"omnisharp",
				},
				-- Auto-launch servers after installation
				automatic_installation = true,
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "netcoredbg" },
				automatic_installation = true,
			})
		end,
	},
}
