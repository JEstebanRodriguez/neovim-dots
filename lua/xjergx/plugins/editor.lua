return {
	{
		"rmagatti/goto-preview",
		dependencies = { "rmagatti/logger.nvim" },
		event = "BufEnter",
		config = function()
			require("goto-preview").setup({
				default_mappings = true,
			})
		end,
	},
	{
		"crnvl96/lazydocker.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>ld",
				function()
					require("lazydocker").open()
				end,
				desc = "Open Lazydocker",
			},
		},
	},

	-- Alternative: Manual Lazydocker and LazySQL with neoterm
	{
		"kassio/neoterm",
		keys = {
			{
				"<leader>lD",
				function()
					vim.cmd("Topen")
					local project_root = vim.fn.getcwd()
					vim.cmd("T cd " .. project_root .. " && lazydocker")
				end,
				desc = "Lazydocker (neoterm)",
			},
			{
				"<leader>lt",
				function()
					vim.cmd("tabnew")
					vim.cmd("Topen")
					local project_root = vim.fn.getcwd()
					vim.cmd("T cd " .. project_root .. " && lazydocker")
				end,
				desc = "Lazydocker (tab)",
			},
			-- LazySQL configurations
			{
				"<leader>lQ",
				function()
					vim.cmd("Topen")
					local project_root = vim.fn.getcwd()
					vim.cmd("T cd " .. project_root .. " && lazysql")
				end,
				desc = "LazySQL (neoterm)",
			},
			{
				"<leader>ls",
				function()
					vim.cmd("tabnew")
					vim.cmd("Topen")
					local project_root = vim.fn.getcwd()
					vim.cmd("T cd " .. project_root .. " && lazysql")
				end,
				desc = "LazySQL (tab)",
			},
		},
	},

	{
		"kassio/neoterm",
		config = function()
			-- Configure neoterm for floating terminals
			vim.g.neoterm_default_mod = "vert botright"
			vim.g.neoterm_size = 80
			vim.g.neoterm_autoscroll = 1
			vim.g.neoterm_automap_keys = ",tt"

			-- Store floating terminal state
			local float_term = {
				buf = nil,
				win = nil,
			}

			local claude_term = {
				buf = nil,
				win = nil,
			}

			-- Create floating window for neoterm
			local function create_floating_term()
				local width = math.floor(vim.o.columns * 0.7)
				local height = math.floor(vim.o.lines * 0.7)
				local row = math.floor((vim.o.lines - height) / 3)
				local col = math.floor((vim.o.columns - width) / 2)

				local buf = vim.api.nvim_create_buf(false, true)
				local win = vim.api.nvim_open_win(buf, true, {
					relative = "editor",
					width = width,
					height = height,
					row = row,
					col = col,
					style = "minimal",
					border = "rounded",
				})

				-- Set up key mapping to close with Esc in terminal mode
				vim.api.nvim_buf_set_keymap(
					buf,
					"t",
					"<Esc>",
					"<C-\\><C-n>:close<CR>",
					{ noremap = true, silent = true }
				)

				return buf, win
			end

			-- Function to toggle floating terminal
			function _NEOTERM_TOGGLE()
				-- Check if window exists and is valid
				if float_term.win and vim.api.nvim_win_is_valid(float_term.win) then
					vim.api.nvim_win_close(float_term.win, true)
					float_term.win = nil
					return
				end

				-- Check if we have an existing terminal buffer
				if float_term.buf and vim.api.nvim_buf_is_valid(float_term.buf) then
					-- Reuse existing terminal buffer
					local width = math.floor(vim.o.columns * 0.9)
					local height = math.floor(vim.o.lines * 0.9)
					local row = math.floor((vim.o.lines - height) / 2)
					local col = math.floor((vim.o.columns - width) / 2)

					float_term.win = vim.api.nvim_open_win(float_term.buf, true, {
						relative = "editor",
						width = width,
						height = height,
						row = row,
						col = col,
						style = "minimal",
						border = "rounded",
					})
				else
					-- Create new floating terminal
					float_term.buf, float_term.win = create_floating_term()
					vim.cmd("terminal")

					-- Change to project root directory after opening
					local project_root = vim.fn.getcwd()
					vim.api.nvim_chan_send(vim.bo.channel, "cd " .. project_root .. "\r")
				end

				vim.cmd("startinsert")
			end

			-- Function to toggle Claude floating terminal
			function _CLAUDE_TOGGLE()
				-- Check if window exists and is valid
				if claude_term.win and vim.api.nvim_win_is_valid(claude_term.win) then
					vim.api.nvim_win_close(claude_term.win, true)
					claude_term.win = nil
					return
				end

				-- Check if we have an existing Claude terminal buffer
				if claude_term.buf and vim.api.nvim_buf_is_valid(claude_term.buf) then
					-- Reuse existing Claude terminal buffer
					local width = math.floor(vim.o.columns * 0.9)
					local height = math.floor(vim.o.lines * 0.9)
					local row = math.floor((vim.o.lines - height) / 2)
					local col = math.floor((vim.o.columns - width) / 2)

					claude_term.win = vim.api.nvim_open_win(claude_term.buf, true, {
						relative = "editor",
						width = width,
						height = height,
						row = row,
						col = col,
						style = "minimal",
						border = "rounded",
					})
				else
					-- Create new floating terminal for Claude
					claude_term.buf, claude_term.win = create_floating_term()
					vim.cmd("terminal")

					-- Change to project directory and run claude
					local project_root = vim.fn.getcwd()
					vim.api.nvim_chan_send(vim.bo.channel, "cd " .. project_root .. " && claude\r")
				end

				vim.cmd("startinsert")
			end
		end,
		keys = {
			{ "<C-\\>", "<cmd>lua _NEOTERM_TOGGLE()<CR>", desc = "Toggle Terminal", mode = { "n", "t" } },
			{ "<leader>tf", "<cmd>lua _NEOTERM_TOGGLE()<CR>", desc = "Toggle Terminal" },
			{ "<leader>tc", "<cmd>lua _CLAUDE_TOGGLE()<CR>", desc = "Toggle Claude Terminal" },
			{ "<leader>to", "<cmd>Topen<CR>", desc = "Open Terminal" },
			{ "<leader>tk", "<cmd>Tkill<CR>", desc = "Kill Terminal" },
			{ "<leader>tn", "<cmd>Tnew<CR>", desc = "New Terminal" },
		},
	},

	-- Snacks integration for Lazydocker and LazySQL
	{
		"folke/snacks.nvim",
		opts = function(_, opts)
			-- Extend Snacks terminal configurations
			opts.terminal = opts.terminal or {}
			opts.terminal.lazydocker = {
				cmd = "lazydocker",
				cwd = vim.fn.getcwd,
			}
			opts.terminal.lazysql = {
				cmd = "lazysql",
				cwd = vim.fn.getcwd,
			}
			return opts
		end,
		keys = {
			{
				"<leader>LS",
				function()
					Snacks.terminal("lazydocker", {
						cwd = vim.fn.getcwd(),
						win = {
							position = "float",
							backdrop = 60,
							width = 0.9,
							height = 0.9,
						},
					})
				end,
				desc = "Lazydocker (Snacks)",
			},
			{
				"<leader>lq",
				function()
					Snacks.terminal("lazysql", {
						cwd = vim.fn.getcwd(),
						win = {
							position = "float",
							backdrop = 60,
							width = 0.9,
							height = 0.9,
						},
					})
				end,
				desc = "LazySQL (Snacks)",
			},
		},
	},
}
