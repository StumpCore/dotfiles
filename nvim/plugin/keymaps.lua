local wk = require("which-key")

wk.add({
	{ "<leader>w", proxy = "<c-w>", group = "Windows" },
	{ "<leader>c", proxy = "<c-x>", group = "Change" },
	{ "<leader>y", group = "Surround" },
	{ "<leader>yi", group = "Surround Insert" },
	{ "<leader>yd", group = "Surround Delete" },
	{ "<leader>yc", group = "Surround Change" },
	{ "<leader>g", proxy = "g", group = "Go-To" },
	{ "<leader>f", group = "File Search" },
	{ "<leader>r", group = "Recording" },
	{ "<leader>fg", desc = "Find Multi Grep" },
	{ "<leader><leader>", group = "Reset" },
	{ "<leader>b", group = "Debug" },
	{ "s", group = "Leap" },
})

-- Setting Key-Maps Defaults
-- Navigation within Neovim
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Go to top window" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Go to bottom window" })

-- Navigate buffers
vim.keymap.set("n", "<S-h>", "[b", { desc = "Move to left buffer" })
vim.keymap.set("n", "<S-l>", "]b", { desc = "Move to right buffer" })

-- Navigate a Tab
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Navigate to the next diagnostic
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- Additional Movements
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)", { desc = "Leap Plugin" })
vim.keymap.set("n", "S", "<Plug>(leap-from-window)", { desc = "Leap Plugin (Window)" })

-- Reloading Nvim Configuration
vim.keymap.set("n", "<space><space>s", "<cmd>source %<CR>", { desc = "Reload Nvim Config" })
vim.keymap.set("n", "<space><space>S", ":.lua<CR>", { desc = "Reload Nvim Config Line (Only in Nvim Config)" })
vim.keymap.set("v", "<space><space>T", ":lua<CR>", { desc = "Reload Multiple Nvim Config Lines (Only in Nvim Config)" })

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

-- Surround 
vim.keymap.set("n", "<space>yip", "ysiw)" , {remap=true, desc = "Insert ()" })
vim.keymap.set("n", "<space>yib", "ysiw]" , {remap=true, desc = "Insert []" })
vim.keymap.set("n", "<space>yic", "ysiw}" , {remap=true, desc = "Insert {}" })
vim.keymap.set("n", "<space>yik", "ysiw>" , {remap=true, desc = "Insert <>" })
vim.keymap.set("n", "<space>yid", 'ysiw"' , {remap=true, desc = 'Insert ""' })

vim.keymap.set("n", "<space>ydp", "ds)" , {remap=true, desc = "Delete ()" })
vim.keymap.set("n", "<space>ydb", "ds]" , {remap=true, desc = "Delete []" })
vim.keymap.set("n", "<space>ydc", "ds}" , {remap=true, desc = "Delete {}" })
vim.keymap.set("n", "<space>ydk", "ds>" , {remap=true, desc = "Delete <>" })
vim.keymap.set("n", "<space>ydd", 'ds"' , {remap=true, desc = 'Delete ""' })

vim.keymap.set("n", "<space>ycp", "cs)" , {remap=true, desc = "Change ()" })
vim.keymap.set("n", "<space>ycb", "cs]" , {remap=true, desc = "Change []" })
vim.keymap.set("n", "<space>ycc", "cs}" , {remap=true, desc = "Change {}" })
vim.keymap.set("n", "<space>yck", "cs>" , {remap=true, desc = "Change <>" })
vim.keymap.set("n", "<space>ycd", 'cs"' , {remap=true, desc = 'Change ""' })

vim.keymap.set("v", "<space>yp", "<S-S>)" , {remap=true, desc = "Visual Surround ()" })
vim.keymap.set("v", "<space>yb", "<S-S>]" , {remap=true, desc = "Visual Surround []" })
vim.keymap.set("v", "<space>yc", "<S-S>}" , {remap=true, desc = "Visual Surround {}" })
vim.keymap.set("v", "<space>yk", "<S-S>>" , {remap=true, desc = "Visual Surround <>" })
vim.keymap.set("v", "<space>yd", '<S-S>"' , {remap=true, desc = 'Visual Surround ""' })

-- File Navigation
vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags, { desc = "Treesitter Help" })
vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files, { desc = "Find Files" })
vim.keymap.set("n", "<space>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
vim.keymap.set("n", "<space>fe", require("oil").open_float, { desc = "Open Floating File" })
vim.keymap.set("n", "<space>fn", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Find Files (Nvim Config)" })
vim.keymap.set("n", "<space>fp", function()
	require("telescope.builtin").find_files({
		cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
	})
end, { desc = "Find Files lazy setup" })

-- Recording Macro
-- 1. Define the keymap for recording the macro (e.g., <Leader>rm)
vim.keymap.set("n", "<Leader>rr", function()
	vim.cmd.normal("qq")
end, {
	noremap = true,
	silent = true,
	desc = "▶ Record Macro (Register 'q')",
})

-- 2. Define the keymap for playing the macro (e.g., <Leader>pm)
vim.keymap.set("n", "<Leader>rf", "@q", {
	noremap = true,
	silent = true,
	desc = "▶ Play Macro (Register 'q')",
})

-- Moving Faster around the files
vim.keymap.set("n", "<S-j>", "10j")
vim.keymap.set("n", "<S-k>", "10k")

-- Keep highlighted section after indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Debugger Keybinds
vim.keymap.set("n", "<space>bb", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<space>bd", require("dap").repl.open, { desc = "Open Repl" })
vim.keymap.set("n", "<space>bD", require("dap").repl.close, { desc = "Open Repl" })
vim.keymap.set("n", "<space>bc", require("dap").clear_breakpoints, { desc = "Clear all Breakpoints" })
vim.keymap.set("n", "<space>bj", require("dap").run_to_cursor, { desc = "Start/Continue Debugging to Cursor" })
vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F10>", require("dap").step_over, { desc = "Step-Over" })
vim.keymap.set("n", "<F11>", require("dap").step_into, { desc = "Step-Into" })
vim.keymap.set("n", "<F12>", require("dap").step_out, { desc = "Step-Out" })
