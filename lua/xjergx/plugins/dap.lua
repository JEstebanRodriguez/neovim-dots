return {
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	lazy = true,
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"jay-babu/mason-nvim-dap.nvim",
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<leader>db",
	-- 			function()
	-- 				require("dap").toggle_breakpoint()
	-- 			end,
	-- 			desc = "Toggle Breakpoint",
	-- 		},
	-- 		{
	-- 			"<leader>dB",
	-- 			function()
	-- 				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	-- 			end,
	-- 			desc = "Set Conditional Breakpoint",
	-- 		},
	-- 		{
	-- 			"<leader>dc",
	-- 			function()
	-- 				require("dap").continue()
	-- 			end,
	-- 			desc = "Continue Execution",
	-- 		},
	-- 		{
	-- 			"<leader>di",
	-- 			function()
	-- 				require("dap").step_into()
	-- 			end,
	-- 			desc = "Step Into",
	-- 		},
	-- 		{
	-- 			"<F6>",
	-- 			function()
	-- 				require("dap").step_over()
	-- 			end,
	-- 			desc = "Step Over",
	-- 		},
	-- 		{
	-- 			"<F7>",
	-- 			function()
	-- 				require("dap").step_out()
	-- 			end,
	-- 			desc = "Step Out",
	-- 		},
	-- 		{
	-- 			"<leader>dt",
	-- 			function()
	-- 				require("dap").terminate()
	-- 			end,
	-- 			desc = "Terminate Debugger",
	-- 		},
	-- 		{
	-- 			"<leader>dr",
	-- 			function()
	-- 				require("dap").repl.open()
	-- 			end,
	-- 			desc = "Open REPL",
	-- 		},
	-- 		{
	-- 			"<F8>",
	-- 			function()
	-- 				require("dap.ui.widgets").hover()
	-- 			end,
	-- 			desc = "Hover Inspection",
	-- 		},
	-- 		{
	-- 			"<leader>dv",
	-- 			function()
	-- 				require("dap-view").toggle()
	-- 			end,
	-- 			desc = "Toggle Debugger View",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		local dap = require("dap")
	--
	-- 		dap.adapters.coreclr = {
	-- 			type = "executable",
	-- 			command = "netcoredbg",
	-- 			args = { "--interpreter=vscode" },
	-- 		}
	--
	-- 		dap.configurations.cs = {
	-- 			{
	-- 				type = "coreclr",
	-- 				name = "dotnet Launch web",
	-- 				request = "launch",
	-- 				program = function()
	-- 					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
	-- 				end,
	-- 				env = { ASPNETCORE_ENVIRONMENT = "Development" },
	-- 			},
	-- 		}
	--
	-- 		-- Configure diagnostic signs
	-- 		local signs = {
	-- 			DapBreakpoint = "🔴",
	-- 			DapBreakpointCondition = "🟠",
	-- 			DapLogPoint = "📍",
	-- 			DapStopped = "⟹",
	-- 		}
	--
	-- 		for sign, icon in pairs(signs) do
	-- 			vim.fn.sign_define(sign, { text = icon, texthl = "DapUIModifiedBreakpoint", numhl = "" })
	-- 		end
	--
	-- 		-- Auto-open debugger UI when session starts
	-- 		-- dap.listeners.before.event_initialized["dap_view"] = function()
	-- 		-- 	require("dap-view").open()
	-- 		-- end
	-- 		--
	-- 		-- -- Auto-close UI when session ends
	-- 		-- dap.listeners.before.event_terminated["dap_view"] = function()
	-- 		-- 	require("dap-view").close()
	-- 		-- end
	-- 		-- dap.listeners.before.event_exited["dap_view"] = function()
	-- 		-- 	require("dap-view").close()
	-- 		-- end
	-- 	end,
	-- },
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
