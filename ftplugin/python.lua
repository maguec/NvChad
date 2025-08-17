-- python specific 
vim.keymap.set("n", "<leader>F", ":!black %<CR>", {})
vim.cmd("setlocal tabstop=4 shiftwidth=4")
vim.api.nvim_create_augroup("__neoformat_on_write__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "__neoformat_on_write__",
    pattern = "*.py",
    command = "undojoin | Neoformat",
})
