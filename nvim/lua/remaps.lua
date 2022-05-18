local map = require('utils').map

map('', '<Space>', '<NOP>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


map('n', '<leader>/', '<cmd>set nohlsearch!<CR>', { silent = true })

map('n', '<leader>=', '<C-w>=') -- Resize windows to equal sizes

map('n', '<leader>.', '<cmd>set wrap!<CR>', {silent = true }) -- Toggle wrap

-- Neovim terminal mappings
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<M-[>', '<Esc>')

-- Windows navigation
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- Navigation
map('nx', '<C-j>', '@=\'5j\'<CR>', {silent = true}) -- The weird @ is used to save the position in cursor history
map('nx', '<C-k>', '@=\'5k\'<CR>', {silent = true})
map('nx', '<C-h>', '0')
map('nx', '<C-l>', '$')

map('n', 'j', 'v:count? "j": "gj"', { expr = true }) -- use j if selecting otherwise, use gj
map('n', 'k', 'v:count? "k": "gk"', { expr = true }) -- use j if selecting otherwise, use gj


-- Buffer management
map('n', '<leader>q', '<cmd>Bdelete<CR>') -- delete buffer
map('n', '<leader>Q', '<cmd>Bdelete!<CR>') -- delete buffer and discard changes

-- Copy and paste
map('v', 'p', '"_dP') -- Don't copy after paste in visual mode

map('nv', '<leader>y', '"+y')
map('nv', '<leader>p', '"+p')

----------
-- Start of PLUGINS remaps
----------

-- Bufferline
map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', {silent = true})
map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', {silent = true})
map('n', '<S-M-h>', '<cmd>BufferLineMovePrev<CR>', {silent = true})
map('n', '<S-M-l>', '<cmd>BufferLineMoveNext<CR>', {silent = true})
