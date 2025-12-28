vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
require("config.dapui")

-- Changing the base options
local diag = vim.diagnostic
local set = vim.opt
set.updatetime=250
set.ignorecase=true
set.smartcase=true
set.undofile=true
set.clipboard = "unnamedplus"
set.swapfile = false
set.showbreak = "> "
set.showmatch=true
set.shiftround = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.number = true
set.smarttab = true
set.smartindent=true
set.relativenumber = true
set.autoindent = true
set.breakindent = true
set.cursorline = true
set.expandtab = true
set.preserveindent = true
set.scrolloff = 10

-- LSP Diagnostics Options Setup
diag.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = "󰋼 ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	virtual_lines = false,
	virtual_text = false,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- High igh when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- NVIM Terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- Auto Format on save
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- Indent lines
local highlight = {
	"CursorColumn",
	"Whitespace",
}
require("ibl").setup({
	indent = { highlight = highlight, char = "" },
	whitespace = {
		highlight = highlight,
		remove_blankline_trail = false,
	},
	scope = { enabled = false },
})

