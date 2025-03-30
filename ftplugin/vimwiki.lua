-- Turn off the line numbers and signcolumn for wiki entries - so much better
vim.wo.number = false
vim.wo.relativenumber = false
vim.wo.signcolumn = "no"
vim.cmd([[autocmd BufUnload * execute ':silent !git add % && git commit -m %']])
