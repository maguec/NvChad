local M = {}
M.togglenums = function()
--      if vim.wo.relativenumber == 0
if (vim.wo.number == false and vim.wo.relativenumber == false) then
     vim.wo.number = true
     vim.wo.relativenumber = true
     vim.wo.signcolumn = "yes:2"
elseif( vim.wo.number == true and vim.wo.relativenumber == true) then
     vim.wo.number = false
     vim.wo.relativenumber = false
     vim.wo.signcolumn = "no"
else
     vim.api.nvim_command('echo "something is broke yo!"')
end
end
return M

-- vim.keymap.set('n', '<leader>tt', M.togglenums, {})
