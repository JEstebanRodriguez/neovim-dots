return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			preview_config = {
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		},
		keys = {
			{
				"]c",
				function()
					require("gitsigns").nav_hunk("next")
				end,
				desc = "Next Hunk",
			},
			{
				"[c",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
				desc = "Prev Hunk",
			},
			{
				"<leader>hs",
				function()
					require("gitsigns").stage_hunk()
				end,
				desc = "Stage Hunk",
			},
			{
				"<leader>hr",
				function()
					require("gitsigns").reset_hunk()
				end,
				desc = "Reset Hunk",
			},
			{
				"<leader>hS",
				function()
					require("gitsigns").stage_buffer()
				end,
				desc = "Stage Buffer",
			},
			{
				"<leader>hu",
				function()
					require("gitsigns").undo_stage_hunk()
				end,
				desc = "Undo Stage Hunk",
			},
			{
				"<leader>hR",
				function()
					require("gitsigns").reset_buffer()
				end,
				desc = "Reset Buffer",
			},
			{
				"<leader>hp",
				function()
					require("gitsigns").preview_hunk()
				end,
				desc = "Preview Hunk",
			},
			{
				"<leader>hb",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				desc = "Blame Line",
			},
			{
				"<leader>hd",
				function()
					require("gitsigns").diffthis()
				end,
				desc = "Diff This",
			},
			{
				"<leader>hD",
				function()
					require("gitsigns").diffthis("~")
				end,
				desc = "Diff This ~",
			},
			{
				"<leader>td",
				function()
					require("gitsigns").toggle_deleted()
				end,
				desc = "Toggle Deleted",
			},
			{
				"<leader>hs",
				function()
					require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				mode = "v",
				desc = "Stage Hunk",
			},
			{
				"<leader>hr",
				function()
					require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				mode = "v",
				desc = "Reset Hunk",
			},
		},
	},
    {
        "sindrets/diffview.nvim"
    }
}
