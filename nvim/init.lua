require("config.lazy")

-- Changing the base options
local set = vim.opt
set.clipboard = "unnamedplus"
set.shiftwidth = 4
set.tabstop = 4
set.number = true
set.relativenumber = true


-- Highligh when yanking (copying) text
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
