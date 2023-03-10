-- [[ opts.lua ]]
local opt = vim.opt
	
-- [[ Context ]]
-- Options for how my lines render to the screen
opt.colorcolumn = '80'		-- str: Show col for max line length
opt.number = true		-- bool: Show line numbers
opt.relativenumber = true	-- bool: Show relative line numbers
opt.scrolloff = 4		-- int: Min num lines of context
opt.signcolumn = "yes"		-- str: Show the sign column

-- [[ Filetypes ]]
-- configure unicode compatibility
opt.encoding = 'utf8'		-- str: String encoding to use
opt.fileencoding = 'utf8'	-- str: File encoding to use

-- [[ Theme ]]
-- Set options that are related to neovims look and feel
opt.syntax = "ON"		-- str: Allow syntax highlighting
opt.termguicolors = true	-- bool: Enable this if terminal supports ui color

-- [[ Search ]]
-- Handling search
opt.ignorecase = true		-- bool: Ignore case in search pattern
opt.smartcase = true		-- bool: Overrider ignorecase if search pattern contains capitals
opt.incsearch = true		-- bool: Use incremental search
opt.hlsearch = false		-- bool: Highlight search matches


-- [[ Whitespace ]]
-- How to handle whitespaces
opt.expandtab = true		-- bool: Use spaces instead of tabs
opt.shiftwidth = 4		-- num: Size of an indent
opt.softtabstop = 4		-- num: Number of spaces tabs count in insert mode
opt.tabstop = 4			-- num: Number of spaces tabs count

-- [[ Splits ]]
-- How to handle splits
opt.splitright = true		-- bool: Enable place new window to the right of current one
opt.splitbelow = true		-- bool: Enable place new window below the current one


-- [[ Autocompletion Experience ]]
--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 
-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- [[ Treesitter Folding ]]
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- [[ Vimspector options ]]
-- Vimspector options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
]])
