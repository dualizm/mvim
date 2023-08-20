require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "vim",
    "vimdoc", "bash", "make",
    "regex", "sql", "go"},
  sync_install = false,
  auto_install = true,
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
