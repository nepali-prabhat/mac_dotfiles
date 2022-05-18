local M = {}

M.map = function(mode, mapping, command, options)
    local opts = {noremap = true}
    if options then
        opts = vim.tbl_extend("force", opts, options)
    end
    if string.len(mode) > 1 then
        for i = 1, string.len(mode) do
            vim.api.nvim_set_keymap(string.sub(mode, i, i), mapping, command, opts)
        end
    else
        vim.api.nvim_set_keymap(mode, mapping, command, opts)
    end
end

return M

