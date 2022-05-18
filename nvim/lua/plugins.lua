
local packer = require('packer')
packer.startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'luisiacc/gruvbox-baby'

end)

return packer
