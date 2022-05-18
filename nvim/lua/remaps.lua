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
map('n', '<leader>q', '<cmd>bdelete<CR>') -- delete buffer
map('n', '<leader>Q', '<cmd>bdelete!<CR>') -- delete buffer and discard changes

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
map('n', '<M-h>', '<cmd>BufferLineMovePrev<CR>', {silent = true})
map('n', '<M-l>', '<cmd>BufferLineMoveNext<CR>', {silent = true})

-- Telescope
map('n', '<C-p>', '<cmd>Telescope find_files hidden=true<CR>', {silent = true})
map('n', '<C-f>', '<cmd>Telescope live_grep<CR>', {silent = true})
map('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<CR>', {silent = true})
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {silent = true})
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {silent = true})
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {silent = true})
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', {silent = true})

-- Tree
map('n', '<leader>v', '<cmd>NvimTreeToggle<CR>', {silent = true})
