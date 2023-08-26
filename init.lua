
-- |================================================================|
-- | Filename: init.lua
-- | Author: ezeire
-- | Description:
-- | [[
-- |	Config file for evim
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
    "beacon",
    "hop",
    "nvim-tree",
    "nvim-sitter",
    "telescope",
    "lsp",
    "cmp",
    -- neomake для выполнения билдов
    -- индентация и формат в файлах
    -- снипеты настроить
    -- индекатор ошибок
}
