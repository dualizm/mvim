local options = {
-- tabs and space
	smarttab = true,    -- automatic addition of margins
	expandtab = true,   -- real tab character C-V<Tab>
	tabstop = 4,        -- number of visual spaces per TAB
	softtabstop = 4,    -- number of spacesin tab when editing
	shiftwidth = 4,     -- insert n spaces on a tab
	autoindent = true,  -- indent equal to the indent of the prev line
	smartindent = true, -- smart alignment
-- lines
	relativenumber = true,  -- show relative number 
	number = true,          -- show absolute number
	showcmd = true,         -- displays the commands that are entered
	textwidth = 80,         -- maximum text width
-- search
	incsearch = true, -- search as characters are entered
	hlsearch = false, -- do not highlight matches
-- encoding
	fileencoding = "utf8", -- character encoding in file
	termencoding = "utf8", -- character encoding in terminal
	guifont = "JetBrainsMono Font:h12", -- set the font for the gui
-- colors
	syntax = "on",          -- syntax highlighting
	termguicolors = true,   -- enable 24-bit RGB in TUI
}

-- set all options
for option,value in pairs(options) do
	vim.opt[option] = value
end

-- set autocomands
local acmd = vim.api.nvim_create_autocmd

acmd("TextYankPost", {
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
	vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
	end,
})

-- acmd('VimEnter', {
-- 	desc = 'Greets the user',
-- 	pattern = '*',
-- 	command = 'echo "Hello, " . $USER . "!"'
-- })

local files_config = {
	{
		pattern = "make",
		command = "set noexpandtab nocin"},
	{
		pattern = "html",
		command = "set noexpandtab nocin textwidth=160"},
	{
		pattern = "css",
		command = "set noexpandtab nocin"}, 
	{
		pattern = "python",
		command = "set nocin"
    }
}

for i, config in ipairs(files_config) do
	acmd("filetype", config)
end
