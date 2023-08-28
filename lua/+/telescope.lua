local utils = require "utils"

utils.with_require("telescope", function ()
    require("telescope").setup({
      defaults = {},
      pickers = {},
      extensions = {},
    })
end)
