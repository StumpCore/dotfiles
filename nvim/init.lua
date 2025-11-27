require("config.lazy")

-- Changing the base options
local diag = vim.diagnostic
local set = vim.opt
set.clipboard = "unnamedplus"
set.swapfile=false
set.showbreak="> "
set.shiftround=true
set.shiftwidth = 4
set.tabstop = 4
set.number = true
set.smarttab=true
set.relativenumber = true
set.autoindent =true
set.breakindent=true
set.cursorline=true
set.expandtab=true
set.preserveindent=true
set.scrolloff=10


diag.config({
	virtual_lines = true,
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})


-- High igh when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- NVIM Terminal
vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end
})



