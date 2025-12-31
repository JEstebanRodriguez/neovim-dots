vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.autoformat = true
vim.g.snacks_animate = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cursorline = true
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldtext = ""
vim.opt.formatexpr = "v:lua.format.formatexpr()"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smoothscroll = true
vim.opt.wrap = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "130"
vim.opt.shortmess:append("c")
vim.opt.mouse = "a"
vim.opt.list = true
vim.opt.autoread = true
-- vim.opt.lazyredraw = true
vim.opt.showmode = false

-- File Handling
vim.opt.hidden = true
vim.opt.confirm = true

-- Editing Experience
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.pumheight = 15

-- Diagnostic signs with icons
local signs = {
	{ name = "DiagnosticSignError", text = " " },
	{ name = "DiagnosticSignWarn", text = " " },
	{ name = "DiagnosticSignHint", text = "󱧡 " },
	{ name = "DiagnosticSignInfo", text = "󰗶 " },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
