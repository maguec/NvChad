require "nvchad.options"

local o = vim.o

-- Darkness is my friend
o.background = "dark"

-- Better editor UI
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.signcolumn = "yes:2"
o.cursorline = true
o.mouse = ""

-- Better for Neorg setup
o.conceallevel = 3

-- neovide only settings
if vim.g.neovide then
  o.guifont = "DroidSansM Nerd Font Mono:h14"
  vim.o.mouse = "a"
  vim.g.neovide_input_use_logo = 1
  vim.api.nvim_set_keymap("n", "<S-Insert>", "~", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("i", "<S-Insert>", "~", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Insert>", "`", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("i", "<Insert>", "`", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Home>", '"+p', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("i", "<Home>", '"+p', { noremap = true, silent = true })
end

-- My custom autocnfig
vim.api.nvim_create_augroup("custom_buffers", { clear = true })

-- configs/autocmd.lua
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "custom_buffers",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank { timeout = 200 }
	end,
})
