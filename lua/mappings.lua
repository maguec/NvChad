require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fmt", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "lsp format" })

vim.cmd "command WQ wq"
vim.cmd "command Wq wq"
vim.cmd "command W w"


-- custom
local myfunctions = require "custom.myfunctions"
vim.keymap.set('n', '<leader>tt', myfunctions.togglenums, {})

local datedfile = require "custom.datedfile"
vim.keymap.set('n', '<leader>df', datedfile.create_dated_file, {})

vim.keymap.set('n', '<C-]>', '<cmd>bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
vim.keymap.set('n', '<C-[>', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })

-- Disable Tabby's default <Tab> mapping
vim.g.tabby_no_default_keymaps = 1
vim.g.tabby_inline_completion_keybinding_accept = "<C-g>"
vim.g.tabby_inline_completion_keybinding_trigger_or_dismiss = "<C-u>"

