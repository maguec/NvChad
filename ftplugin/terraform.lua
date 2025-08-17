-- terraform specific 
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
vim.keymap.set("n", "<leader>F", ":TerraformFmt<CR>", {})
vim.keymap.set("n", "<leader>ti", ":!terraform init<CR>", {})
vim.keymap.set("n", "<leader>tv", ":!terraform validate<CR>", {})
vim.keymap.set("n", "<leader>tp", ":!terraform plan<CR>", {})
vim.keymap.set("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", {})
vim.api.nvim_create_augroup("__neoformat_on_write__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "__neoformat_on_write__",
    pattern = "*.tf",
    command = "undojoin | Neoformat",
})
