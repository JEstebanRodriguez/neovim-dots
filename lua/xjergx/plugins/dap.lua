return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "netcoredbg" },
				automatic_installation = true,
			})
		end,
	},
	{
		"miroshQa/debugmaster.nvim",
		-- osv is needed if you want to debug neovim lua code. Also can be used
		-- as a way to quickly test-drive the plugin without configuring debug adapters
		dependencies = { "mfussenegger/nvim-dap", "jbyuki/one-small-step-for-vimkind" },
		config = function()
			local dm = require("debugmaster")
			-- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
			-- Alternative keybindings to "<leader>d" could be: "<leader>m", "<leader>;"
			vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true })
			-- If you want to disable debug mode in addition to leader+d using the Escape key:
			-- vim.keymap.set("n", "<Esc>", dm.mode.disable)
			-- This might be unwanted if you already use Esc for ":noh"
			vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

			dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
			local dap = require("dap")
			dap.adapters.coreclr = {
				type = "executable",
				command = "netcoredbg",
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "dotnet Launch web",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
					env = { ASPNETCORE_ENVIRONMENT = "Development" },
				},
			}

			-- Configure your debug adapters here
			-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		end,
	},
	-- {
	-- 	"igorlfs/nvim-dap-view",
	-- 	dependencies = { "mfussenegger/nvim-dap" },
	-- 	opts = {
	-- 		layouts = {
	-- 			{
	-- 				elements = {
	-- 					{ id = "scopes", size = 0.33 },
	-- 					{ id = "breakpoints", size = 0.17 },
	-- 					{ id = "stacks", size = 0.25 },
	-- 					{ id = "watches", size = 0.25 },
	-- 				},
	-- 				position = "left",
	-- 				size = 40,
	-- 			},
	-- 			{
	-- 				elements = {
	-- 					{ id = "repl", size = 0.5 },
	-- 					{ id = "console", size = 0.5 },
	-- 				},
	-- 				position = "bottom",
	-- 				size = 10,
	-- 			},
	-- 		},
	-- 		controls = {
	-- 			enabled = true,
	-- 			element = "repl",
	-- 		},
	-- 		element_mappings = {},
	-- 		expand_lines = true,
	-- 		persistent_breakpoints = true,
	-- 		show_line_numbers = true,
	-- 	},
	-- },
}
