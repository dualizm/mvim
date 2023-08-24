local utils = require 'utils'

utils.with_require("beacon", function ()
    require("beacon").setup({
      enable = true,
    	size = 50,
    	fade = true,
    	minimal_jump = 10,
    	show_jumps = true,
    	focus_gained = false,
    	shrink = true,
    	timeout = 5000,
    	ignore_buffers = {},
    	ignore_filetypes = {},
    })
end)
