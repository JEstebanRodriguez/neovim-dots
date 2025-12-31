local keymap = vim.keymap.set
local options = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

keymap("n", "-", "<CMD>Oil<CR>", { silent = true, noremap = true })
keymap({ "n", "i" }, "<C-s>", "<CMD>w<CR><ESC>", { desc = "Save file", silent = true, noremap = true })
keymap("n", "<C-a>", "ggVG", options("Select all"))

keymap("n", "<leader>bq", '<Esc>:%bdelete|edit #|normal`"<Return>', options("Delete other buffers but the current one"))
keymap({ "n", "v" }, "<Tab>", ">gv", options("Indent Right"))
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", options("Clear search highlights"))
keymap("i", "<A-j>", "<Nop>", { noremap = true, silent = true })
keymap("i", "<A-k>", "<Nop>", { noremap = true, silent = true })
keymap("n", "<A-k>", ":m .-2<CR>==", options("Move line up"))
keymap("n", "<A-j>", ":m .+1<CR>==", options("Move line down"))
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", options("Move selection up"))
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", options("Move selection down"))
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
keymap({ "n", "v", "i" }, "<C-s>", "<CMD>:lua SaveFile()<CR><ESC>", options("Save File"))

function SaveFile()
	if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
		vim.notify("No file to save", vim.log.levels.WARN)
		return
	end

	local filename = vim.fn.expand("%:t")
	local success, err = pcall(function()
		vim.cmd("silent! write")
	end)

	if success then
		vim.notify(filename .. " Saved!")
	else
		vim.notify("Error: " .. err, vim.log.levels.ERROR)
	end
end
