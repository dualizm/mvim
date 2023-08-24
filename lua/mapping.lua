local utils = require 'utils'

local bind = vim.api.nvim_set_keymap
local vbind = vim.keymap.set

vim.g.mapleader = " "

local function do_binds(binds, fbind, opt)
    for _,bnd in ipairs(binds) do
        fbind(bnd[1], bnd[2], bnd[3], opt or { noremap = true, silent = true}) 
    end
end

-- save
do_binds({
    {"n", "<f2>", "<esc>:wall<cr>"},
    {"i", "<f2>", "<esc>:wall<cr>"}
}, bind)

-- better window navigation
do_binds({
    {"n", "<C-l>", "<C-w>l"},
    {"n", "<C-h>", "<C-w>h"},
    {"n", "<C-j>", "<C-w>j"},
    {"n", "<C-k>", "<C-w>k"}
}, bind)

-- resize with arrows
do_binds({
    {"n", "<C-Up>", ":resize -2<cr>"},
    {"n", "<C-Down>", ":resize +2<cr>"},
    {"n", "<C-Left>", ":vertical resize -2<cr>"},
    {"n", "<C-Right>", ":vertical resize +2<cr>"}
}, bind)

-- file explorer
utils.with_require("nvim-tree", function()
    do_binds({
        {"n", "<leader>t", ":NvimTreeToggle<cr>"},
    }, vbind)
end)

-- hop
utils.with_require("hop", function()
    local hop = require'hop'
    local directions = require'hop.hint'.HintDirection

    do_binds({
        {"", "f", function()
            hop.hint_char1 { 
                direction = directions.AFTER_CURSOR,
                current_line_only = true
            }
        end}, 
        {"", "F", function()
            hop.hint_char1 { 
                direction = directions.BEFORE_CURSOR,
                current_line_only = true }
        end}, 
        {"", "t", function()
            hop.hint_char1 { 
                direction = directions.AFTER_CURSOR,
                current_line_only = true, hint_offset = -1 }
        end},
        {"", "T", function()
            hop.hint_char1 { 
                direction = directions.BEFORE_CURSOR,
                current_line_only = true, hint_offset = 1 }
        end}
    }, vbind)
end)

-- telescope
utils.with_require("telescope", function()
    local builtin = require('telescope.builtin');
    do_binds({
        {"n", "<leader>ff", builtin.find_files},
        {"n", "<leader>fg", builtin.live_grep},
        {"n", "<leader>fb", builtin.buffers},
        {"n", "<leader>fn", builtin.help_tags}
    }, vbind)
end)

-- lsp
do_binds({
    {"n", "<leader>e", vim.diagnostic.open_float},
    {"n", "[d", vim.diagnostic.goto_prev},
    {"n", "]d", vim.diagnostic.goto_next},
    {"n", "<leader>q", vim.diagnostic.setloclist}
}, vbind)

function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    do_binds({
        {"n", "gD", vim.lsp.buf.declaration},
        {"n", "gd", vim.lsp.buf.definition},
        {"n", "K", vim.lsp.buf.hover},
        {"n", "gi", vim.lsp.buf.implementation},
        {"n", "<C-k>", vim.lsp.buf.signature_help},
        {"n", "<leader>wa", vim.lsp.buf.add_workspace_folder},
        {"n", "<leader>wr", vim.lsp.buf.remove_workspace_folder},
        {"n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end},
        
        {"n", "<leader>D", vim.lsp.buf.type_definition},
        {"n", "<leader>rn", vim.lsp.buf.rename},
        {"n", "<leader>ca", vim.lsp.buf.code_action},
        {"n", "gr", vim.lsp.buf.references},
        {"n", "<leader>f", vim.lsp.buf.formatting},
    }, vbind, bufopts)
end
