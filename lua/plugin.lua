-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

function check_packer()
    local fn = vim.fn
    local script = {
      program = "git",
      args = "clone --depth 1",
      repository = "https://github.com/wbthomason/packer.nvim",
      packpath = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    }

    if fn.empty(fn.glob(script.packpath)) > 0 then
        local handle = io.popen(string.format("%s %s %s %s", 
            script.program,
            script.args,
            script.repository,
            script.packpath))
        handle:close()

        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = check_packer()
    
-- Reload configurations if we modify pkr.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function()
  -- + plugin manager
    use "wbthomason/packer.nvim"
  -- + colorschemes
    use "savq/melange-nvim"
  -- + status line
    use "nvim-lualine/lualine.nvim"
  -- + commenter
    use "terrortylor/nvim-comment"
  -- + file manager
    use "nvim-tree/nvim-tree.lua"
  -- + sitter
    use { "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
  -- + motions
    use "phaazon/hop.nvim"
  -- + find, filter, preview, pick.
    use { "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }
  -- + lsp
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
  -- + completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

-- misc
  -- + scroll
    use "karb94/neoscroll.nvim"
  -- + flash cursor
    use "rainbowhxch/beacon.nvim"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
