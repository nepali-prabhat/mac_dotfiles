-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/pravatpandey/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/pravatpandey/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/pravatpandey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/pravatpandey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/pravatpandey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nç\b\0\0\a\0?\0`5\0\0\0005\1\14\0005\2\6\0005\3\2\0009\4\1\0=\4\3\0039\4\4\0=\4\5\3=\3\a\0025\3\t\0009\4\b\0=\4\3\0039\4\n\0=\4\5\3=\3\v\0025\3\f\0009\4\b\0=\4\3\3=\3\r\2=\2\15\0015\2\18\0005\3\16\0009\4\1\0=\4\3\0039\4\17\0=\4\5\3=\3\a\2=\2\19\0015\2\21\0005\3\20\0009\4\b\0=\4\3\0039\4\n\0=\4\5\3=\3\a\2=\2\22\0015\2\25\0005\3\23\0009\4\1\0=\4\3\0039\4\24\0=\4\5\3=\3\a\2=\2\26\0015\2\28\0005\3\27\0009\4\1\0=\4\3\0039\4\17\0=\4\5\3=\3\a\2=\2\29\0015\2 \0005\3\30\0009\4\1\0=\4\3\0039\4\31\0=\4\5\3=\3\a\2=\2!\0015\2$\0005\3\"\0009\4\1\0=\4\3\0039\4#\0=\4\5\3=\3\a\2=\2%\0016\2&\0'\4'\0B\2\2\0029\2(\0025\4/\0005\5)\0=\1*\0055\6+\0=\6,\0055\6-\0=\6.\5=\0050\0045\0052\0005\0061\0=\0063\0055\0064\0=\0065\0055\0066\0=\0067\0055\0068\0=\0069\0055\6:\0=\6;\0055\6<\0=\6=\5=\5>\4B\2\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\0\2\nright\5\tleft\5\23section_separators\1\0\2\nright\6|\tleft\6|\ntheme\1\0\0\nsetup\flualine\frequire\vvisual\1\0\0\vcolor9\1\0\1\bgui\tbold\rterminal\1\0\0\vcolor8\1\0\1\bgui\tbold\freplace\1\0\0\1\0\1\bgui\tbold\vinsert\1\0\0\vcolor6\1\0\1\bgui\tbold\rinactive\1\0\0\1\0\0\fcommand\1\0\0\vcolor7\1\0\1\bgui\tbold\vnormal\1\0\0\6c\1\0\0\6b\vcolor2\1\0\0\bfg2\6a\1\0\0\abg\vcolor5\afg\1\0\1\bgui\tbold\bfg1\1\0\n\vcolor3\f#32302f\bfg2\f#ddc7a1\vcolor2\f#504945\bfg1\f#282828\vcolor9\f#ea6962\vcolor8\f#d3869b\vcolor7\f#d8a657\vcolor6\f#a9b665\vcolor5\f#7daea3\vcolor4\f#E7D7AD\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nÇ\3\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\ttext\18File Explorer\15text_align\vcenter\rfiletype\rNvimTree\1\0\n\24persist_buffer_sort\2\27always_show_bufferline\2\16diagnostics\rnvim_lsp\23left_mouse_command\14buffer %d\24right_mouse_command\16Bdelete! %d\fnumbers\tnone\24show_tab_indicators\2\20show_close_icon\1\28show_buffer_close_icons\1\22show_buffer_icons\2\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim™\2\0\2\a\0\19\0.6\2\0\0'\4\1\0B\2\2\0029\3\2\2'\4\3\0009\5\4\1'\6\3\0&\4\6\0048\3\4\3\15\0\3\0X\4\tÄ9\3\2\2'\4\3\0009\5\4\1'\6\3\0&\4\6\0048\3\4\0039\4\4\1&\3\4\3=\3\4\0015\3\t\0009\4\6\0029\4\a\4'\5\b\0&\4\5\4=\4\n\0039\4\6\0029\4\a\4'\5\v\0&\4\5\4=\4\f\0039\4\6\0029\4\a\4'\5\r\0&\4\5\4=\4\14\0039\4\6\0029\4\a\4'\5\15\0&\4\5\4=\4\16\0039\4\17\0009\4\18\0048\3\4\3=\3\5\1L\1\2\0\tname\vsource\tpath\n Path\vbuffer\n Buff\nvsnip\v VSnip\rnvim_lsp\1\0\0\t LSP\nthick\bbar\tmenu\tkind\6_\tlang\nicons\frequire¿\4\1\0\t\0$\0;6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\5\0005\5\b\0>\5\1\0045\5\t\0>\5\2\0045\5\n\0>\5\3\0045\5\v\0>\5\4\4=\4\f\0035\4\r\0=\4\14\0035\4\17\0009\5\15\0009\5\16\5B\5\1\2=\5\18\0049\5\15\0009\5\19\0055\a\20\0009\b\21\0009\b\22\b=\b\23\aB\5\2\2=\5\24\0049\5\15\0009\5\25\5B\5\1\2=\5\26\0049\5\15\0009\5\27\5B\5\1\2=\5\28\0049\5\15\0009\5\29\5)\a¸ˇB\5\2\2=\5\30\0049\5\15\0009\5\29\5)\a\4\0B\5\2\2=\5\31\4=\4\15\0035\4!\0003\5 \0=\5\"\4=\4#\3B\1\2\1K\0\1\0\15formatting\vformat\1\0\0\0\n<C-d>\n<C-u>\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\21select_prev_item\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\0\rcomplete\fmapping\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nΩ\2\0\0\v\0\22\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\20\0005\4\18\0005\5\16\0004\6\4\0005\a\6\0005\b\5\0=\b\a\a\18\b\0\0'\n\b\0B\b\2\2=\b\t\a>\a\1\0065\a\v\0005\b\n\0=\b\a\a\18\b\0\0'\n\f\0B\b\2\2=\b\t\a>\a\2\0065\a\14\0005\b\r\0=\b\a\a\18\b\0\0'\n\15\0B\b\2\2=\b\t\a>\a\3\6=\6\17\5=\5\19\4=\4\21\3B\1\2\1K\0\1\0\tview\1\0\0\rmappings\1\0\0\tlist\1\0\0\vremove\1\0\0\1\2\0\0\adf\16toggle_help\1\0\0\1\2\0\0\6?\acb\bcut\bkey\1\0\0\1\2\0\0\6d\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¢\3\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\v\0\0\bcss\tscss\15typescript\15javascript\blua\ago\vpython\tyaml\trust\tjson\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nƒ\b\0\0\6\0-\0F6\0\0\0'\2\1\0B\0\2\0025\1\14\0005\2\n\0005\3\3\0009\4\2\0=\4\4\0039\4\5\0=\4\6\0039\4\a\0009\5\b\0 \4\5\4=\4\t\3=\3\v\0025\3\f\0009\4\a\0009\5\b\0 \4\5\4=\4\t\3=\3\r\2=\2\15\0015\2\16\0=\2\17\0015\2\18\0=\2\19\0015\2\20\0=\2\21\0015\2\22\0=\2\23\0016\2\0\0'\4\24\0B\2\2\0029\2\25\2=\2\26\0016\2\0\0'\4\24\0B\2\2\0029\2\27\2=\2\28\0016\2\0\0'\4\29\0B\2\2\0029\2\30\0029\2\31\2=\2 \0016\2\0\0'\4\29\0B\2\2\0029\2!\0029\2\31\2=\2\"\0016\2\0\0'\4\29\0B\2\2\0029\2#\0029\2\31\2=\2$\0015\2&\0005\3%\0=\3'\2=\2(\0016\2\0\0'\4)\0B\2\2\0029\2*\0025\4+\0=\1,\4B\2\2\1K\0\1\0\rdefaults\1\0\0\nsetup\14telescope\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\19generic_sorter\29get_generic_fuzzy_sorter\16file_sorter\19get_fuzzy_file\22telescope.sorters\25file_ignore_patterns\1\3\0\0\17node_modules\t.git\fset_env\1\0\1\14COLORTERM\14truecolor\17path_display\1\2\0\0\rabsolute\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\rmappings\1\0\5\21sorting_strategy\15descending\rwinblend\3\0\23selection_strategy\nreset\17initial_mode\vinsert\ruse_less\2\6n\1\0\2\n<M-q>\1\n<C-q>\1\6i\1\0\0\n<C-o>\16open_qflist\25smart_send_to_qflist\n<C-j>\24move_selection_next\n<C-k>\1\0\2\n<C-q>\1\n<M-q>\1\28move_selection_previous\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n‘\1\0\0\6\0\16\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\14\0005\4\6\0009\5\4\0009\5\5\5=\5\5\0049\5\4\0009\5\a\5=\5\b\0049\5\4\0009\5\t\5=\5\t\0049\5\4\0009\5\n\5=\5\v\0049\5\4\0009\5\f\5=\5\r\4=\4\15\3B\1\2\1K\0\1\0\nsigns\1\0\0\nother\tpass\16information\tinfo\thint\fwarning\twarn\1\0\0\nerror\tdiag\nsetup\ftrouble\nicons\frequire\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-prosession"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/vim-prosession",
    url = "https://github.com/dhruvasagar/vim-prosession"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-timber"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/vim-timber",
    url = "https://github.com/kitallen23/vim-timber"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim‘\1\0\0\4\1\t\1\0276\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\5Ä6\0\0\0009\0\1\0009\0\3\0D\0\1\0X\0\15Ä6\0\0\0009\0\1\0009\0\4\0'\2\5\0005\3\6\0B\0\3\2\t\0\0\0X\0\4Ä-\0\0\0'\2\a\0D\0\2\0X\0\3Ä-\0\0\0'\2\b\0D\0\2\0K\0\1\0\0¿\n<Tab>!<Plug>(vsnip-expand-or-jump)\1\2\0\0\3\1\20vsnip#available\tcall\18compe#confirm\15pumvisible\afn\bvim\0021\1\0\3\0\4\0\0063\0\0\0006\1\1\0003\2\3\0=\2\2\0012\0\0ÄK\0\1\0\0\17tab_complete\a_G\0\0" },
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/pravatpandey/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nƒ\b\0\0\6\0-\0F6\0\0\0'\2\1\0B\0\2\0025\1\14\0005\2\n\0005\3\3\0009\4\2\0=\4\4\0039\4\5\0=\4\6\0039\4\a\0009\5\b\0 \4\5\4=\4\t\3=\3\v\0025\3\f\0009\4\a\0009\5\b\0 \4\5\4=\4\t\3=\3\r\2=\2\15\0015\2\16\0=\2\17\0015\2\18\0=\2\19\0015\2\20\0=\2\21\0015\2\22\0=\2\23\0016\2\0\0'\4\24\0B\2\2\0029\2\25\2=\2\26\0016\2\0\0'\4\24\0B\2\2\0029\2\27\2=\2\28\0016\2\0\0'\4\29\0B\2\2\0029\2\30\0029\2\31\2=\2 \0016\2\0\0'\4\29\0B\2\2\0029\2!\0029\2\31\2=\2\"\0016\2\0\0'\4\29\0B\2\2\0029\2#\0029\2\31\2=\2$\0015\2&\0005\3%\0=\3'\2=\2(\0016\2\0\0'\4)\0B\2\2\0029\2*\0025\4+\0=\1,\4B\2\2\1K\0\1\0\rdefaults\1\0\0\nsetup\14telescope\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\19generic_sorter\29get_generic_fuzzy_sorter\16file_sorter\19get_fuzzy_file\22telescope.sorters\25file_ignore_patterns\1\3\0\0\17node_modules\t.git\fset_env\1\0\1\14COLORTERM\14truecolor\17path_display\1\2\0\0\rabsolute\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\rmappings\1\0\5\21sorting_strategy\15descending\rwinblend\3\0\23selection_strategy\nreset\17initial_mode\vinsert\ruse_less\2\6n\1\0\2\n<M-q>\1\n<C-q>\1\6i\1\0\0\n<C-o>\16open_qflist\25smart_send_to_qflist\n<C-j>\24move_selection_next\n<C-k>\1\0\2\n<C-q>\1\n<M-q>\1\28move_selection_previous\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nΩ\2\0\0\v\0\22\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\20\0005\4\18\0005\5\16\0004\6\4\0005\a\6\0005\b\5\0=\b\a\a\18\b\0\0'\n\b\0B\b\2\2=\b\t\a>\a\1\0065\a\v\0005\b\n\0=\b\a\a\18\b\0\0'\n\f\0B\b\2\2=\b\t\a>\a\2\0065\a\14\0005\b\r\0=\b\a\a\18\b\0\0'\n\15\0B\b\2\2=\b\t\a>\a\3\6=\6\17\5=\5\19\4=\4\21\3B\1\2\1K\0\1\0\tview\1\0\0\rmappings\1\0\0\tlist\1\0\0\vremove\1\0\0\1\2\0\0\adf\16toggle_help\1\0\0\1\2\0\0\6?\acb\bcut\bkey\1\0\0\1\2\0\0\6d\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n‘\1\0\0\6\0\16\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\14\0005\4\6\0009\5\4\0009\5\5\5=\5\5\0049\5\4\0009\5\a\5=\5\b\0049\5\4\0009\5\t\5=\5\t\0049\5\4\0009\5\n\5=\5\v\0049\5\4\0009\5\f\5=\5\r\4=\4\15\3B\1\2\1K\0\1\0\nsigns\1\0\0\nother\tpass\16information\tinfo\thint\fwarning\twarn\1\0\0\nerror\tdiag\nsetup\ftrouble\nicons\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¢\3\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\v\0\0\bcss\tscss\15typescript\15javascript\blua\ago\vpython\tyaml\trust\tjson\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\nÇ\3\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\ttext\18File Explorer\15text_align\vcenter\rfiletype\rNvimTree\1\0\n\24persist_buffer_sort\2\27always_show_bufferline\2\16diagnostics\rnvim_lsp\23left_mouse_command\14buffer %d\24right_mouse_command\16Bdelete! %d\fnumbers\tnone\24show_tab_indicators\2\20show_close_icon\1\28show_buffer_close_icons\1\22show_buffer_icons\2\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim‘\1\0\0\4\1\t\1\0276\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\5Ä6\0\0\0009\0\1\0009\0\3\0D\0\1\0X\0\15Ä6\0\0\0009\0\1\0009\0\4\0'\2\5\0005\3\6\0B\0\3\2\t\0\0\0X\0\4Ä-\0\0\0'\2\a\0D\0\2\0X\0\3Ä-\0\0\0'\2\b\0D\0\2\0K\0\1\0\0¿\n<Tab>!<Plug>(vsnip-expand-or-jump)\1\2\0\0\3\1\20vsnip#available\tcall\18compe#confirm\15pumvisible\afn\bvim\0021\1\0\3\0\4\0\0063\0\0\0006\1\1\0003\2\3\0=\2\2\0012\0\0ÄK\0\1\0\0\17tab_complete\a_G\0\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim™\2\0\2\a\0\19\0.6\2\0\0'\4\1\0B\2\2\0029\3\2\2'\4\3\0009\5\4\1'\6\3\0&\4\6\0048\3\4\3\15\0\3\0X\4\tÄ9\3\2\2'\4\3\0009\5\4\1'\6\3\0&\4\6\0048\3\4\0039\4\4\1&\3\4\3=\3\4\0015\3\t\0009\4\6\0029\4\a\4'\5\b\0&\4\5\4=\4\n\0039\4\6\0029\4\a\4'\5\v\0&\4\5\4=\4\f\0039\4\6\0029\4\a\4'\5\r\0&\4\5\4=\4\14\0039\4\6\0029\4\a\4'\5\15\0&\4\5\4=\4\16\0039\4\17\0009\4\18\0048\3\4\3=\3\5\1L\1\2\0\tname\vsource\tpath\n Path\vbuffer\n Buff\nvsnip\v VSnip\rnvim_lsp\1\0\0\t LSP\nthick\bbar\tmenu\tkind\6_\tlang\nicons\frequire¿\4\1\0\t\0$\0;6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\5\0005\5\b\0>\5\1\0045\5\t\0>\5\2\0045\5\n\0>\5\3\0045\5\v\0>\5\4\4=\4\f\0035\4\r\0=\4\14\0035\4\17\0009\5\15\0009\5\16\5B\5\1\2=\5\18\0049\5\15\0009\5\19\0055\a\20\0009\b\21\0009\b\22\b=\b\23\aB\5\2\2=\5\24\0049\5\15\0009\5\25\5B\5\1\2=\5\26\0049\5\15\0009\5\27\5B\5\1\2=\5\28\0049\5\15\0009\5\29\5)\a¸ˇB\5\2\2=\5\30\0049\5\15\0009\5\29\5)\a\4\0B\5\2\2=\5\31\4=\4\15\0035\4!\0003\5 \0=\5\"\4=\4#\3B\1\2\1K\0\1\0\15formatting\vformat\1\0\0\0\n<C-d>\n<C-u>\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\21select_prev_item\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\0\rcomplete\fmapping\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nç\b\0\0\a\0?\0`5\0\0\0005\1\14\0005\2\6\0005\3\2\0009\4\1\0=\4\3\0039\4\4\0=\4\5\3=\3\a\0025\3\t\0009\4\b\0=\4\3\0039\4\n\0=\4\5\3=\3\v\0025\3\f\0009\4\b\0=\4\3\3=\3\r\2=\2\15\0015\2\18\0005\3\16\0009\4\1\0=\4\3\0039\4\17\0=\4\5\3=\3\a\2=\2\19\0015\2\21\0005\3\20\0009\4\b\0=\4\3\0039\4\n\0=\4\5\3=\3\a\2=\2\22\0015\2\25\0005\3\23\0009\4\1\0=\4\3\0039\4\24\0=\4\5\3=\3\a\2=\2\26\0015\2\28\0005\3\27\0009\4\1\0=\4\3\0039\4\17\0=\4\5\3=\3\a\2=\2\29\0015\2 \0005\3\30\0009\4\1\0=\4\3\0039\4\31\0=\4\5\3=\3\a\2=\2!\0015\2$\0005\3\"\0009\4\1\0=\4\3\0039\4#\0=\4\5\3=\3\a\2=\2%\0016\2&\0'\4'\0B\2\2\0029\2(\0025\4/\0005\5)\0=\1*\0055\6+\0=\6,\0055\6-\0=\6.\5=\0050\0045\0052\0005\0061\0=\0063\0055\0064\0=\0065\0055\0066\0=\0067\0055\0068\0=\0069\0055\6:\0=\6;\0055\6<\0=\6=\5=\5>\4B\2\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\0\2\nright\5\tleft\5\23section_separators\1\0\2\nright\6|\tleft\6|\ntheme\1\0\0\nsetup\flualine\frequire\vvisual\1\0\0\vcolor9\1\0\1\bgui\tbold\rterminal\1\0\0\vcolor8\1\0\1\bgui\tbold\freplace\1\0\0\1\0\1\bgui\tbold\vinsert\1\0\0\vcolor6\1\0\1\bgui\tbold\rinactive\1\0\0\1\0\0\fcommand\1\0\0\vcolor7\1\0\1\bgui\tbold\vnormal\1\0\0\6c\1\0\0\6b\vcolor2\1\0\0\bfg2\6a\1\0\0\abg\vcolor5\afg\1\0\1\bgui\tbold\bfg1\1\0\n\vcolor3\f#32302f\bfg2\f#ddc7a1\vcolor2\f#504945\bfg1\f#282828\vcolor9\f#ea6962\vcolor8\f#d3869b\vcolor7\f#d8a657\vcolor6\f#a9b665\vcolor5\f#7daea3\vcolor4\f#E7D7AD\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
