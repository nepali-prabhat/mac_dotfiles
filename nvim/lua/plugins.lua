local packer = require('packer')

local function treesitterConfig()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "css", "scss", "typescript", "javascript", "lua", "go", "python", "yaml", "rust", "json" },
      sync_install = false, -- install parsers synchronously
      highlight = {
        enable = true, -- `false` will disable the whole extension
      },
      indent = {
        enable = true
      },
      incremental_selection = { -- for selecting based on treesitter nodes
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      context_commentstring = {
        enable = true
      }
    })
end

local function lualineConfig()
    local colors = {
      fg1    = '#282828',
      color2 = '#504945',
      fg2    = '#ddc7a1',
      color3 = '#32302f',
      color4 = '#E7D7AD',
      color5 = '#7daea3',
      color6 = '#a9b665',
      color7 = '#d8a657',
      color8 = '#d3869b',
      color9 = '#ea6962',
    }

    local gruvbox_baby = {
      normal = {
        a = { fg = colors.fg1, bg = colors.color5, gui = 'bold' },
        b = { fg = colors.fg2, bg = colors.color2 },
        c = { fg = colors.fg2, bg = nil },
      },
      command = { a = { fg = colors.fg1, bg = colors.color7, gui = 'bold' } },
      inactive = { a = { fg = colors.fg2, bg = colors.color2 } },
      insert = { a = { fg = colors.fg1, bg = colors.color6, gui = 'bold' } },
      replace = { a = { fg = colors.fg1, bg = colors.color7, gui = 'bold' } },
      terminal = { a = { fg = colors.fg1, bg = colors.color8, gui = 'bold' } },
      visual = { a = { fg = colors.fg1, bg = colors.color9, gui = 'bold' } },
    }

    require("lualine").setup({
        options = {
            theme = gruvbox_baby,
            section_separators = { left = '|', right = '|'},
            component_separators = { left = '', right = ''},
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
    })
end

local function bufferlineConfig()
    require("bufferline").setup {
        options = {
            numbers = "none",
            -- mappings = false,
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center"
                }
            },
            show_buffer_icons = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = true,
            persist_buffer_sort = true,
            always_show_bufferline = true,
        }
    }
end

local function telescopeConfig()
    local actions = require('telescope.actions')
    local defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = false,
                ["<M-q>"] = false,
                ["<C-o>"] = actions.smart_send_to_qflist + actions.open_qflist,
            }, 
            n = {
                ["<C-q>"] = false,
                ["<M-q>"] = false,
                ["<C-o>"] = actions.smart_send_to_qflist + actions.open_qflist,
            }
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        initial_mode = "insert",
        selection_strategy = "reset",
        path_display = { "absolute" },
        winblend = 0,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    }
    require("telescope").setup({
       defaults = defaults,
    })
end

local function nvimTreeConfig()
    local tree_cb = require('nvim-tree.config').nvim_tree_callback
    require('nvim-tree').setup({
        view={
            mappings = {
                list = {
                    {key = {"d"}, cb = tree_cb("cut")},
                    {key = {"?"}, cb = tree_cb("toggle_help")},
                    {key = {"df"}, cb = tree_cb("remove")},
                }
            }
        }
    })
end

packer.startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'luisiacc/gruvbox-baby'

    -- Show hex colors in neovim (#ffb299)
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    }

    -- Treesitter highlighting
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- commenting based on cursor location and treesitter queries. Works with vim-commentary
    use {
        'nvim-treesitter/nvim-treesitter',
        config = treesitterConfig,
        run = ':TSUpdate'
    }

    -- File Navigation
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = nvimTreeConfig,

    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = telescopeConfig,
    }

    -- UI
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = lualineConfig,
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = bufferlineConfig,
    }

    -- Basic helpers
    use "jiangmiao/auto-pairs"
    use "tpope/vim-commentary"

    -- TODO: zen mode + twlight

end)


return packer
