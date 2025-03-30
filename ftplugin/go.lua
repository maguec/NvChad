-- Set specific keybinding for go
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>F", ":GoFmt<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>er', "oif err != nil {<CR>}<Esc>Oreturn err<Esc><CR>", opts)
