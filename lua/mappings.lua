require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.cmd("command WQ wq")
vim.cmd("command Wq wq")
vim.cmd("command W w")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
