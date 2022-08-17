-- NOTE: lsp related mappings are defined in lsp.lua file.
--       Some mappings are also in plugins

local map = require('utils').map

map('', '<Space>', '<NOP>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


map('n', '<leader>/', '<cmd>set nohlsearch!<CR>', { silent = true })

map('n', '<leader>=', '<C-w>=') -- Resize windows to equal sizes

map('n', '<leader>.', '<cmd>set wrap!<CR>', { silent = true }) -- Toggle wrap

-- Neovim terminal mappings
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<M-[>', '<Esc>')

-- Windows navigation
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- Navigation
map('nx', '<C-j>', '@=\'5j\'<CR>', { silent = true }) -- The weird @ is used to save the position in cursor history
map('nx', '<C-k>', '@=\'5k\'<CR>', { silent = true })
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
map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { silent = true })
map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { silent = true })
map('n', '<M-h>', '<cmd>BufferLineMovePrev<CR>', { silent = true })
map('n', '<M-l>', '<cmd>BufferLineMoveNext<CR>', { silent = true })

-- Telescope
map('n', '<C-p>', '<cmd>Telescope find_files hidden=true<CR>', { silent = true })
map('n', '<C-b>', '<cmd>Telescope buffers hidden=true<CR>', { silent = true })
map('n', '<C-f>', '<cmd>Telescope live_grep<CR>', { silent = true })
map('n', '<leader>tb', '<cmd>Telescope buffers<CR>', { silent = true })
map('n', '<leader>th', '<cmd>Telescope help_tags<CR>', { silent = true })
map('n', '<leader>to', '<cmd>Telescope oldfiles<CR>', { silent = true })
map('n', '<leader>tr', '<cmd>Telescope registers<CR>', { silent = true })

-- Tree
map('n', '<leader>v', '<cmd>NvimTreeToggle<CR>', { silent = true })
map('n', '<Leader>V', '<cmd>NvimTreeFindFile<CR>', { silent = true })

-- Vsnips
vim.api.nvim_set_keymap('i', '<Tab>', 'vsnip#jumpable(1) ? \'<Plug>(vsnip-jump-next)\' : \'<Tab>\'',
    { expr = true, silent = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'vsnip#jumpable(1) ? \'<Plug>(vsnip-jump-next)\' : \'<Tab>\'',
    { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-t>', 'vsnip#jumpable(1) ? \'<Plug>(vsnip-jump-next)\' : \'<Tab>\'',
    { expr = true, silent = true })
vim.api.nvim_set_keymap('s', '<C-t>', 'vsnip#jumpable(1) ? \'<Plug>(vsnip-jump-next)\' : \'<Tab>\'',
    { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<S-Tab>\'',
    { expr = true, silent = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<S-Tab>\'',
    { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', 'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<S-Tab>\'',
    { expr = true, silent = true })
vim.api.nvim_set_keymap('s', '<C-s>', 'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<S-Tab>\'',
    { expr = true, silent = true })

-- Timber
map('nx', '<Leader>tl', '<Plug>(TimberLog)')

-- Trouble
map('n', '<Leader>gl', '<cmd>TroubleToggle<CR>')

-- Zen mode + Twlight
map('n', '<leader>zz', '<cmd>ZenMode<CR>', { silent = true })
map('n', '<leader>zt', '<cmd>Twilight<CR>', { silent = true })

-- illuminate
map('n', 'gn', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>')
map('n', 'gN', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')

-- NOTE: lsp related mappings are defined in lsp.lua file.
--       Some mappings are also in plugins
