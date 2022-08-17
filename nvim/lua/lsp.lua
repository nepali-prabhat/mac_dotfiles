-- Configured servers uptop now
-- bashls
-- dockerls
-- efm
-- gopls (go)
-- graphql
-- pyright (python)
-- sumneko_lua (lua)
-- tsserver (typescript, javascript)
-- yamlls
-- tailwindcss

local lsp_installer = require("nvim-lsp-installer")
local lsp_cmp = require('cmp_nvim_lsp')
local lspconfig = require("lspconfig")
local icons = require("icons")

lsp_installer.setup({})
local capabilities = vim.lsp.protocol.make_client_capabilities()
local updated_capabilities = lsp_cmp.update_capabilities(capabilities)

-- for emmet_ls
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- lsp related mappings
local function lsp_mappings(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'M', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('i', '<C-x>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[a', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']a', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true })
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true })
    end
end

vim.lsp.diagnostic.enable = true
-- Change Icons
vim.fn.sign_define('DiagnosticSignError', { text = icons.diag.error, texthl = "DiagnosticSignError" })
vim.fn.sign_define('DiagnosticSignWarn', { text = icons.diag.warn, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define('DiagnosticSignInfo', { text = icons.diag.info, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define('DiagnosticSignHint', { text = icons.diag.hint, texthl = "DiagnosticSignHint" })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = { prefix = icons.diag.virtual },
        update_in_insert = false,
    }
)

-- default on_attach function
local function on_attach(client, bufnr)
    lsp_mappings(client, bufnr)
    -- require('illuminate').on_attach(client)
end

-- lua setup
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim', 'use' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
        on_attach = on_attach,
    },
    on_attach = on_attach,
    capabilities = updated_capabilities
}

-- javascript typescript dev setup
local prettier = {
    formatCommand = "prettier --semi --trailing-comma es5 --arrow-parens avoid --bracket-spacing --print-width 80 --tab-width 4 --stdin-filepath ${INPUT} --config-precedence file-override",
    formatStdin = true
}

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local languages = {
    javascript = { prettier, eslint },
    javascriptreact = { prettier, eslint },
    ["javascript.jsx"] = { prettier, eslint },
    typescript = { prettier, eslint },
    ["typescript.tsx"] = { prettier, eslint },
    typescriptreact = { prettier, eslint },
    -- json = { prettier, eslint },
    css = { prettier },
    scss = { prettier },
    markdown = { prettier },
}

lspconfig.efm.setup {
    init_options = { codeAction = true, documentFormatting = true },
    settings = {
        languages = languages
    },
    filetypes = vim.tbl_keys(languages),
    on_attach = on_attach,
    capabilities = updated_capabilities
}

lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
        -- This makes sure tsserver is not used for formatting (I prefer prettier)
        client.resolved_capabilities.document_formatting = false

        -- ts_utils_attach(client)
        on_attach(client, bufnr)
    end,
    settings = { documentFormatting = false },
    capabilities = updated_capabilities
}

lspconfig.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
})

local servers = { 'pyright', 'gopls', 'jsonls', 'yamlls', 'bashls', 'graphql', 'dockerls', 'tailwindcss' }
for _, server in pairs(servers) do
    lspconfig[server].setup {
        on_attach = on_attach,
        capabilities = updated_capabilities
    }
end
