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
        config = treesitterConfig(),
        run = ':TSUpdate'
    }

    -- UI
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() 
            -- Copyright (c) 2020-2021 shadmansaleh
            -- MIT license, see LICENSE for more details.
            -- stylua: ignore
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
                c = { fg = colors.fg2, bg = colors.color3 },
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
                component_separators = { left = '', right = ''},
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
        }) end
    }

    -- Basic helpers
    use "jiangmiao/auto-pairs"
    use "tpope/vim-commentary"

    -- TODO: zen mode + twlight

end)


return packer
