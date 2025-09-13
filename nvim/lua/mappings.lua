require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Map shift for faster movement
map("n", "<S-j>", "10j", {desc="10-j"})
map("n", "<S-k>", "10k", {desc="10-k"})


-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")

map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

