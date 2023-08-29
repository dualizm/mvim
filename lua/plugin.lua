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
    -- plugin manager
        use "wbthomason/packer.nvim"
    -- status line
        use "nvim-lualine/lualine.nvim"
    -- commenter
        use "terrortylor/nvim-comment"
    -- file manager
        use "nvim-tree/nvim-tree.lua"
    -- sitter
        use "nvim-treesitter/nvim-treesitter"
    -- boost treesitter
        use {
            "m-demare/hlargs.nvim",
            config = function ()
                local hlargs = require("hlargs")
                hlargs.setup()
                hlargs.enable()
            end
        }
    -- motions
        use "phaazon/hop.nvim"
    -- find, filter, preview, pick.
        use { "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            }
        }
    -- lsp
        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "onsails/lspkind.nvim",
            "MunifTanjim/prettier.nvim",
        }
    -- completion
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "L3MON4D3/LuaSnip"
        use "saadparwaiz1/cmp_luasnip"
        use "rafamadriz/friendly-snippets"

    -- scroll 
        use "karb94/neoscroll.nvim"
    -- icons
        use "nvim-tree/nvim-web-devicons"
    -- colors
        use { 
            "norcalli/nvim-colorizer.lua",
            config = function ()
                require("colorizer").setup()
            end
        }
    -- todo fix
        use {
            "folke/todo-comments.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function ()
                require("todo-comments").setup()
            end
        }
    -- -- autopairs
    --     use {
    -- 	        "windwp/nvim-autopairs",
    --         config = function()
    --             require("nvim-autopairs").setup()
    --         end
    --     }
    -- theme
        use "nyoom-engineering/oxocarbon.nvim"
        use "rebelot/kanagawa.nvim"

    -- web
        use "windwp/nvim-ts-autotag"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
