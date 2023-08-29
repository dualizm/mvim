local utils = require 'utils'

utils.with_require("nvim-treesitter", function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua" },
      sync_install = false,
      auto_install = true,
      autotag = {
          enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
end)
