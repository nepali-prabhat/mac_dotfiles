local packer = require('packer')

local function treesitterConfig()
    require('nvim-treesitter.configs').setup({
        ensure_installed = { "css", "scss", "typescript", "javascript", "lua", "go", "python", "yaml", "rust", "json", "norg" },
        sync_install = false,
        highlight = {
            enable = true,
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

    local icons = require("icons")
    require("lualine").setup({
        options = {
            theme = gruvbox_baby,
            section_separators = { left = '|', right = '|' },
            component_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', },
            lualine_c = { { 'filename', path = 1, show_status = true } },
            lualine_x = { "filetype" },
            lualine_y = { {
                'diagnostics',
                sources = { 'nvim_diagnostic', 'coc' },
                sections = { 'error', 'warn', 'info', 'hint' },

                diagnostics_color = {
                    error = 'DiagnosticError',
                    warn  = 'DiagnosticWarn',
                    info  = 'DiagnosticInfo',
                    hint  = 'DiagnosticHint',
                },
                symbols = {
                    error = icons.diag['error_'],
                    warn = icons.diag['warn_'],
                    hint = icons.diag['hint_'],
                    info = icons.diag['info_'],
                },
                colored = true,
                update_in_insert = false,
                always_visible = false,
            }
            },
            lualine_z = { 'location' }
        },
    })
end

local function bufferlineConfig()
    require("bufferline").setup {
        options = {
            numbers = "none",
            -- mappings = false,
            right_mouse_command = "Bdelete! %d",
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
        sorting_strategy = "descending",
        path_display = { "absolute" },
        winblend = 0,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_ignore_patterns = { "node_modules", ".git" },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            }
        }
    }
    require("telescope").setup({
        defaults = defaults,
    })
end

local function nvimTreeConfig()
    local tree_cb = require('nvim-tree.config').nvim_tree_callback
    require('nvim-tree').setup({
        view = {
            mappings = {
                custom_only = true,
                list = {
                    { key = { "<CR>", "o" }, cb = tree_cb("edit") },
                    { key = { "<C-v>" }, cb = tree_cb("vsplit") },
                    { key = { "<C-x>" }, cb = tree_cb("split") },
                    { key = { "<C-t>" }, cb = tree_cb("tabnew") },
                    { key = { "<" }, cb = tree_cb("prev_sibling") },
                    { key = { ">" }, cb = tree_cb("next_sibling") },
                    { key = { "r" }, cb = tree_cb("rename") },
                    { key = { "R" }, cb = tree_cb("refresh") },
                    { key = { "df" }, cb = tree_cb("remove") },
                    { key = { "x" }, cb = tree_cb("cut") },
                    { key = { "c" }, cb = tree_cb("copy") },
                    { key = { "v" }, cb = tree_cb("paste") },
                    { key = { "y" }, cb = tree_cb("copy_name") },
                    { key = { "Y" }, cb = tree_cb("copy_path") },
                    { key = { "s" }, cb = tree_cb("system_open") },
                    { key = { "gy" }, cb = tree_cb("copy_absolute_path") },
                    { key = { "?" }, cb = tree_cb("toggle_help") },
                    { key = { "<BS>" }, cb = tree_cb("close_node") },
                    { key = { "a" }, cb = tree_cb("create") },
                    { key = { "[" }, cb = tree_cb("parent_node") },
                }
            }
        }
    })
end

local function completionConfig()
    local cmp = require('cmp');
    cmp.setup {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'buffer' },
            { name = 'path' },
        },
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
        mapping = {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
        },
        formatting = {
            format = function(entry, vim_item)
                -- vim_item.kind = icons.lang[vim_item.] .. vim_item.menu
                local icons = require('icons')
                if icons.lang["_" .. vim_item.kind .. "_"] then
                    vim_item.kind = icons.lang["_" .. vim_item.kind .. "_"] .. vim_item.kind
                end
                vim_item.menu = ({
                    nvim_lsp = icons.bar.thick .. " LSP",
                    vsnip = icons.bar.thick .. " VSnip",
                    buffer = icons.bar.thick .. " Buff",
                    path = icons.bar.thick .. " Path",
                })[entry.source.name]
                return vim_item
            end
        }
    }
end

local function snipsConfig()
    -- defining behaviour of Tab for different cases
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end
    _G.tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return vim.fn["compe#confirm"]()
        elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
            return t("<Plug>(vsnip-expand-or-jump)")
        else
            return t("<Tab>")
        end
    end
end

local function troubleConfig()
    local icons = require('icons')
    require "trouble".setup({
        signs = {
            error = icons.diag.error,
            warning = icons.diag.warn,
            hint = icons.diag.hint,
            information = icons.diag.info,
            other = icons.diag.pass
        },
    })

end

local function gitSignsConfig()
    require('gitsigns').setup({
        numhl = true,
        current_line_blame_opts = {
            delay = 200,
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true })

            map('n', '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true })

            -- Actions
            map({ 'n', 'v' }, '<leader>ss', ':Gitsigns stage_hunk<CR>')
            map({ 'n', 'v' }, '<leader>sr', ':Gitsigns reset_hunk<CR>')
            map('n', '<leader>sS', gs.stage_buffer)
            map('n', '<leader>su', gs.undo_stage_hunk)
            map('n', '<leader>sR', gs.reset_buffer)
            map('n', '<leader>sp', gs.preview_hunk)
            map('n', '<leader>sb', function() gs.blame_line { full = true } end)
            map('n', '<leader>tb', gs.toggle_current_line_blame)
            map('n', '<leader>sd', gs.diffthis)
            map('n', '<leader>sD', function() gs.diffthis('~') end)
            map('n', '<leader>td', gs.toggle_deleted)

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
    })
end

local function zenConfig()
    require("zen-mode").setup {
        window = {
            backdrop = 1,
            width = 120,
        },
        plugins = {
            twilight = { enabled = false }
        }
    }
end

local function twlightConfig()
    require("twilight").setup {
        dimming = {
            alpha = 0.35,
            color = { "Normal", "#ffffff" },
            inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 10, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
            "function",
            "method",
            "table",
            "if_statement",
        },
        exclude = {}, -- exclude these filetypes
    }
end

packer.startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use {
        'nepali-prabhat/gruvbox-baby',
    }

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
    use 'nvim-treesitter/playground'

    -- File Navigation
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = nvimTreeConfig,

    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = telescopeConfig,
    }

    -- UI
    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = lualineConfig,
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = bufferlineConfig,
    }

    -- Basic helpers
    use 'kitallen23/vim-timber'
    use 'tpope/vim-surround'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-commentary'
    use 'famiu/bufdelete.nvim'
    use 'machakann/vim-highlightedyank'

    use "lukas-reineke/indent-blankline.nvim"

    -- Sessions
    use {
        'dhruvasagar/vim-prosession',
        requires = { 'tpope/vim-obsession' },
    }

    -- LSP (configured in ./lsp.lua folder)
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {
        'hrsh7th/nvim-cmp',
        requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-vsnip", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
        config = completionConfig
    }
    use {
        'hrsh7th/vim-vsnip',
        config = snipsConfig }
    use 'hrsh7th/vim-vsnip-integ'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = troubleConfig,
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = gitSignsConfig
    }
    use 'tpope/vim-fugitive'

    -- zen mode + twlight
    use {
        "folke/zen-mode.nvim",
        config = zenConfig
    }
    use {
        "folke/twilight.nvim",
        config = twlightConfig
    }

end)

return packer
