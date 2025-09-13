require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "K", "10k")
map("n", "J", "10j")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
