
-- |================================================================|
-- | Filename: init.lua
-- | Author: ezeire
-- | Description:
-- | [[
-- |	Config file for mvim
-- | ]]
-- |================================================================|

local utils = require "utils"

require("core")
require("plugin")
require("scheme")
require("mapping")

utils.require_plugins {
    "lualine",
    "nvim-comment",
    "neoscroll",
    "hop",
    "nvim-tree",
    "nvim-sitter",
    "telescope",
    "lsp",
    "cmp",
}
