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
opt.colorcolumn = "80,160"
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true

opt.completeopt = "menu,menuone,noselect" -- required for compe to work
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
vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_background_color = "dark"
vim.g.gruvbox_baby_transparent_mode = true
vim.cmd[[colorscheme gruvbox-baby]]
