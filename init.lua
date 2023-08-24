
-- |================================================================|
-- | Filename: init.lua
-- | Author: ezeire
-- | Description:
-- | [[
-- |	Config file for snvim
-- | ]]
-- |================================================================|

local utils = require "utils"

utils.categories {
    configs = {
        "core",
        "plugin",
        "mapping",
    },
    plugins = {
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
      -- поисковик внутри файлов!
      -- интерфейс для git
      -- neomake для выполнения билдов
      -- индентация и формат в файлах
      -- снипеты настроить
      -- индекатор ошибок
    },
    colorscheme = {
        "scheme",
    }
}
