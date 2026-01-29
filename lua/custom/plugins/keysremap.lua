-- Move current line or selection down
vim.keymap.set('n', '<M-J>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-J>', ':m .+1<CR>==')
vim.keymap.set('v', '<M-J>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-J>', ":m '>+1<CR>gv=gv")

-- Move current line or selection up
vim.keymap.set('n', '<M-K>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('n', '<A-K>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<M-K>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<A-K>', ":m '<-2<CR>gv=gv")

return {}
