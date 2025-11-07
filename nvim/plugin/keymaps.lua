local wk = require("which-key")

wk.add({
	{ "<leader>w",        proxy = "<c-w>",         group = "Windows" },
	{ "<leader>c",        proxy = "<c-x>",         group = "Change" },
	{ "<leader>g",        proxy = "g",             group = "Go-To" },
	{ "<leader>f",        group = "File Search" },
	{ "<leader>r",        group = "Recording" },
	{ "<leader>fg",       desc = "Find Multi Grep" },
	{ "<leader><leader>", group = "Reset" },
	{ "<leader>b",        group = "Buffer" },
	{ "s",                group = "Leap" },
})

-- Setting Key-Maps Defaults
-- Navigation within Neovim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Go to top window" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Go to bottom window" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', { desc = "Leap Plugin" })
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)', { desc = "Leap Plugin (Window)" })

-- Reloading Nvim Configuration
vim.keymap.set("n", "<space><space>s", "<cmd>source %<CR>", { desc = "Reload Nvim Config" })
vim.keymap.set("n", "<space><space>S", ":.lua<CR>", { desc = "Reload Nvim Config Line (Only in Nvim Config)" })
vim.keymap.set("v", "<space><space>T", ":lua<CR>", { desc = "Reload Multiple Nvim Config Lines (Only in Nvim Config)" })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)

-- Go-To Definitions
vim.keymap.set("n", "<space>gd", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "<space>gD", vim.lsp.buf.declaration, { desc = "Declaration" })
vim.keymap.set("n", "<space>gE", vim.lsp.buf.type_definition, { desc = "Type-Definition" })

-- File Navigation
vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, { desc = "Treesitter Help" })
vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files, { desc = "Find Files" })
vim.keymap.set("n", "<space>fb", require('telescope.builtin').buffers, { desc = "Buffers" })
vim.keymap.set("n", "<space>fe", require('oil').open_float, { desc = "Open Floating File" })
vim.keymap.set("n", "<space>fn", function()
	require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath("config")
	}
end, { desc = "Find Files (Nvim Config)" })
vim.keymap.set("n", "<space>fp", function()
	require('telescope.builtin').find_files {
		cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
	}
end, { desc = "Find Files lazy setup" })

-- Recording Macro
-- 1. Define the keymap for recording the macro (e.g., <Leader>rm)
vim.keymap.set('n', '<Leader>rr', function()
	vim.cmd.normal('qq')
end, {
	noremap = true,
	silent = true,
	desc = "▶ Record Macro (Register 'q')"
})

-- 2. Define the keymap for playing the macro (e.g., <Leader>pm)
vim.keymap.set('n', '<Leader>rf', '@q', {
	noremap = true,
	silent = true,
	desc = "▶ Play Macro (Register 'q')"
})
