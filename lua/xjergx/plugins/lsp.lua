return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	init = function()
		-- Configure lua_ls for Neovim Lua development
		-- Optimized for Neovim 0.11+
		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim" },
						disable = { "missing-fields" },
					},
					workspace = {
						library = {
							vim.fn.expand("$VIMRUNTIME/lua"),
							vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
							"${3rd}/luv/library",
							"${3rd}/busted/library",
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		-- Configure TypeScript server with Vue plugin integration
		-- This setup uses TypeScript Language Server with Vue plugin instead of separate Volar
		local vue_language_server_path = vim.fn.stdpath("data") .. "/mason/packages/@vue/language-server"
		local vue_plugin = {
			name = "@vue/typescript-plugin",
			location = vue_language_server_path,
			languages = { "vue" },
			configNamespace = "typescript",
		}

		vim.lsp.config("ts_ls", {
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"vue", -- Vue 3 single-file components
			},
			root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
			init_options = {
				plugins = {
					vue_plugin,
				},
			},
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionReturnTypeHints = true,
					},
				},
			},
		})

		-- Configure C# server (omnisharp)
		vim.lsp.config("omnisharp", {
			filetypes = { "csharp", "cs" },
			root_markers = { "*.csproj", "*.sln", ".git" },
			settings = {
				RoslynExtensionsOptions = {
					enableRoslynAnalyzers = true,
					inlayHintsOptions = {
						enableForParameters = true,
						forLiteralParameters = true,
						forObjectCreationParameters = true,
						forIndexerParameters = true,
						forOtherParameters = true,
					},
				},
			},
		})

		-- Configure JSON server
		vim.lsp.config("jsonls", {
			filetypes = { "json", "jsonc" },
			root_markers = { "package.json", ".git" },
			settings = {
				json = {
					schemas = {
						{
							fileMatch = { "package.json" },
							url = "https://json.schemastore.org/package.json",
						},
						{
							fileMatch = { "tsconfig.json", "tsconfig.*.json" },
							url = "https://json.schemastore.org/tsconfig.json",
						},
					},
					validate = { enable = true },
				},
			},
		})

		-- Configure diagnostic signs
		local signs = {
			Error = "󰅚",
			Warn = "󰀪",
			Info = "󰋽",
			Hint = "󰌶",
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Configure diagnostic display
		vim.diagnostic.config({
			signs = true,
			underline = true,
			virtual_text = false,
			float = {
				border = "rounded",
				source = "always",
			},
			severity_sort = true,
		})

		-- Enable language servers (Vue support now integrated in ts_ls)
		vim.lsp.enable({ "lua_ls", "ts_ls", "jsonls", "omnisharp" })

		-- Set up LSP keybindings when server attaches to a buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				if not client then
					return
				end

				local opts = function(desc)
					return { noremap = true, silent = true, buffer = bufnr, desc = desc }
				end

				-- Navigation
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to Definition"))
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to Declaration"))
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to Implementation"))
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Show References"))
				vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts("Go to Type Definition"))

				-- Hovering
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover Documentation"))
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts("Signature Help"))

				-- Code Actions & Refactoring
				vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts("Code Actions"))
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts("Rename Symbol"))
				vim.keymap.set("n", "<leader>lf", function()
					vim.lsp.buf.format({ async = true })
				end, opts("Format Buffer"))

				-- Diagnostics
				vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts("Show Diagnostics"))
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Previous Diagnostic"))
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next Diagnostic"))
			end,
		})
	end,
}
