vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- navigation
map('n', '<Leader>h', '<C-w>h', {noremap = true, silent = false})
map('n', '<Leader>l', '<C-w>l', {noremap = true, silent = false})
map('n', '<Leader>j', '<C-w>j', {noremap = true, silent = false})
map('n', '<Leader>k', '<C-w>k', {noremap = true, silent = false})

map('n', '<Leader>v', '<C-w>v', {noremap = true, silent = false})
map('n', '<Leader>s', '<C-w>s', {noremap = true, silent = false})
map('n', '<Leader>q', '<C-w>c', {noremap = true, silent = false})

map('i', 'qj', '<ESC>', {noremap = true, silent = false})

map('n', '<Leader>c', ':Alpha<CR>', {noremap = true, silent = false})
map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader>t', ':terminal<CR>', {noremap = true, silent = true})
map('n', '<leader>f', ':Telescope find_files<CR>', {noremap = true, silent = true})


