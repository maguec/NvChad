-- Set specific keybinding for go
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>F", ":GoFmt<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>er', "oif err != nil {<CR>}<Esc>Oreturn err<Esc><CR>", opts)
vim.api.nvim_create_augroup("__neoformat_on_write__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "__neoformat_on_write__",
    pattern = "*.go",
    command = "undojoin | Neoformat",
})
