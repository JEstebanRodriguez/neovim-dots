return {
	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				init = function()
					-- Require providers
					require("hover.providers.lsp")
					require("hover.providers.gh")
					require("hover.providers.gh_user")
					require("hover.providers.jira")
					require("hover.providers.dap")
					require("hover.providers.fold_preview")
					require("hover.providers.diagnostic")
					require("hover.providers.man")
					require("hover.providers.dictionary")
				end,
				preview_opts = {
					border = "rounded",
					max_width = 80,
					max_height = 20,
				},
				preview_window = false,
				title = true,
				mouse_providers = {
					"LSP",
				},
				mouse_delay = 1000,
			})

			-- Setup the hover keymap
			vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
			vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
			vim.keymap.set("n", "<C-p>", function()
				require("hover").hover_switch("previous")
			end, { desc = "hover.nvim (previous source)" })
			vim.keymap.set("n", "<C-n>", function()
				require("hover").hover_switch("next")
			end, { desc = "hover.nvim (next source)" })

			-- Mouse support
			vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
			vim.o.mousemoveevent = true
		end,
	},

	-- Pretty documentation popups
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {
			header = {
				"┌─ ",
				" ─┐",
				"│ ",
				" │",
				"│ ",
				" │",
				"└─ ",
				" ─┘",
			},
			-- Detect the border from colorscheme if available
			detect = {
				enable = true,
			},
			styling = {
				border = true,
			},
			-- Disable certain LSP servers if needed
			disable = {
				-- "lua_ls",
			},
		},
	},

	-- Improved signature help
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			floating_window = true,
			floating_window_above_cur_line = true,
			floating_window_off_x = 1,
			floating_window_off_y = 0,
			close_timeout = 4000,
			fix_pos = false,
			hint_enable = true,
			hint_prefix = "🐼 ",
			hint_scheme = "String",
			hi_parameter = "LspSignatureActiveParameter",
			max_height = 12,
			max_width = 80,
			transpancy = nil,
			shadow_blend = 36,
			shadow_guibg = "Black",
			timer_interval = 200,
			toggle_key = nil,
			select_signature_key = nil,
			move_cursor_key = nil,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}
