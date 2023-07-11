vim.keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR>', {noremap=true, silent=true})
vim.keymap.set('n', 'sv', ':vs<CR>', {noremap=true, silent=true})
vim.keymap.set('n', 'ss', ':sp<CR>', {noremap=true, silent=true})
vim.keymap.set('n', 'st', ':tabnew<CR>', {noremap=true, silent=true})
vim.keymap.set('n', 'sn', 'gt', {noremap=true, silent=true})
vim.keymap.set('n', 'sp', 'gT', {noremap=true, silent=true})
vim.keymap.set('n', 'sq', ':q<CR>', {noremap=true, silent=true})

vim.keymap.set('', 'wh', '<C-w>h')
vim.keymap.set('', 'wk', '<C-w>k')
vim.keymap.set('', 'wj', '<C-w>j')
vim.keymap.set('', 'el', '<C-w>l')

vim.keymap.set('t', '<ESC>', '<C-Bslash><C-n>')

vim.keymap.set('n', '||', '$', {noremap=true, silent=true})

vim.keymap.set('i', '<C-h>', '<C-o>h',  {noremap=true, silent=true})
vim.keymap.set('i', '<C-j>', '<C-o>j',  {noremap=true, silent=true})
vim.keymap.set('i', '<C-k>', '<C-o>k',  {noremap=true, silent=true})
vim.keymap.set('i', '<C-l>', '<C-o>l',  {noremap=true, silent=true})

vim.keymap.set('n', '<F8>', '<cmd>TagbarToggle<CR>', {noremap=true, silent=true})

vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical')

vim.keymap.set('n', '<leader>f', '<NOP>',{noremap = true})
local TSbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', TSbuiltin.find_files, {noremap=true})
vim.keymap.set('n', '<leader>fg', TSbuiltin.live_grep, {noremap=true})
vim.keymap.set('n', '<leader>fb', TSbuiltin.buffers, {noremap=true})
vim.keymap.set('n', '<leader>fh', TSbuiltin.help_tags, {noremap=true})
