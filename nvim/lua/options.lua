---------------------------------------------------------
-- Global default options. use `:help Options`
---------------------------------------------------------

local opt = vim.opt
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.showtabline = 2
opt.cursorline = true
opt.swapfile = false
opt.scrolloff = 5 -- scroll offset
opt.signcolumn = "yes" -- gutter
opt.wildmode = { "list", "longest" }
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.wrap = false

opt.completeopt = "menu,menuone,noselect,noinsert" -- required for compe to work
opt.updatetime = 250 -- update interval for gitsigns

-- Tabs
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Set number of spaces a tab counts for
opt.shiftwidth = 4 -- Set indent size
opt.smartindent = true -- code friendly auto line indenting


-- Search & highlighting
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Highlight search results while typing
opt.ignorecase = true -- Ignore case
opt.smartcase = true  -- Do not ignore case with capitals

-- Theme
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "NONE"
vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_background_color = "dark" -- medium or dark
vim.g.gruvbox_baby_transparent_mode = false
vim.cmd[[colorscheme gruvbox-baby]]
-- vim.cmd[[colorscheme rvcs]]
-- vim.cmd[[colorscheme humanoid]]


-- Session
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,globals"
vim.g.prosession_per_branch = 1

-- Snippets
vim.g.vsnip_snippet_dir = '~/Documents/configs/nvim/snips'
vim.g.vsnip_filetypes = {
    javascriptreact = { "javascript" },
    typescriptreact = { "typescript" }
}

-- yank highlight duration
vim.g.highlightedyank_highlight_duration = 150
