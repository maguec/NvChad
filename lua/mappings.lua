require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fmt", function()
  return vim.fn["neoformat#format"]()
end, { desc = "Neoformat" })

vim.cmd "command WQ wq"
vim.cmd "command Wq wq"
vim.cmd "command W w"

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
