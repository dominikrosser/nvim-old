-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- BEGIN PACKER

-- Automatically install on any machine I clone the configuration to
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
     -- Packer can manage itself
     use 'wbthomason/packer.nvim'

     -- Simple plugins can be specified as strings
     -- use 'rstacruz/vim-closer'

     -- Lazy loading:
     -- Load on specific commands
     -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

     -- Load on an autocommand event
     use {'andymass/vim-matchup', event = 'VimEnter'}

     -- Load on a combination of conditions: specific filetypes or commands
     -- Also run code after load (see the "config" key)
     -- [[
     -- use {
     --  'w0rp/ale',
     --  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
     --  cmd = 'ALEEnable',
     --  config = 'vim.cmd[[ALEEnable]]'
     -- }
     -- ]]

     -- Plugins can have dependencies on other plugins
     -- use {
     --  'haorenW1025/completion-nvim',
     --  opt = true,
     --  requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
     -- }

     -- Plugins can also depend on rocks from luarocks.org:
     -- use {
     --  'my/supercoolplugin',
     --  rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
     -- }

     -- You can specify rocks in isolation
     -- use_rocks 'penlight'
     -- use_rocks {'lua-resty-http', 'lpeg'}

     -- Local plugins can be included
     -- use '~/projects/personal/hover.nvim'

     -- Plugins can have post-install/update hooks
     -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

     -- Post-install/update hook with neovim command
     -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

     -- Post-install/update hook with call of vimscript function with argument
     -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

     -- Use specific branch, dependency and run lua file after load
     -- use {
     --  'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
     --  requires = {'kyazdani42/nvim-web-devicons'}
     -- }

     -- Use dependency and run lua function after load
     -- use {
     --  'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
     --  config = function() require('gitsigns').setup() end
     --}

     -- You can specify multiple plugins in a single call
     -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

     -- You can alias plugin names
     -- use {'dracula/vim', as = 'dracula'}

     -- [[ LSP ]]
     -- mason enables us to install varios lsp providers
     use 'williamboman/mason.nvim'
     use 'williamboman/mason-lspconfig.nvim'
     require("mason").setup()
     -- a collection of lsp configs
     use 'neovim/nvim-lspconfig'
     -- automatically setup lsp config for Rust-Analyzer
     use 'simrat39/rust-tools.nvim'
     -- LSP AUTOCOMPLETION PLUGINS
     use 'hrsh7th/nvim-cmp' -- Completion framework
     use 'hrsh7th/cmp-nvim-lsp' -- LSP Completion source
     -- Useful completion sources:
     use 'hrsh7th/cmp-nvim-lua'
     use 'hrsh7th/cmp-nvim-lsp-signature-help'
     use 'hrsh7th/cmp-vsnip'                             
     use 'hrsh7th/cmp-path'                              
     use 'hrsh7th/cmp-buffer'                            
     use 'hrsh7th/vim-vsnip'
     -- -- END LSP
     -- [[ PARSER ]]
     -- nvim-treesitter
     use 'nvim-treesitter/nvim-treesitter'
     -- -- END PARSER

     -- [[ Vimspector and CodeLLDB to debug Rust and Rust Tests ]]
     -- vimspector is alwo used with python
     use 'puremourning/vimspector'

     -- [[ Floatterm floating terminal ]]
     use 'voldikss/vim-floaterm'

     -- [[ Telescope (Search) TODO set this stuff up ]]
     use 'kdheepak/lazygit.nvim'
     use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'}, {'kdheepak/lazygit.nvim'} },
      config = function()
          require("telescope").load_extension("lazygit")
        end,
    }

     -- [[ nvim-tree File Explorer ]]
     use {
     'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

     -- [[ Tagbar ]]
     use 'preservim/tagbar'

     -- [[ todo-comments Highlight and search todos ]]
     use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    } 
     
     -- [[ nvim-web-devicons ]]
     -- already installed above use 'nvim-tree/nvim-web-devicons'
     -- [[ lsp-colors ]]
     use 'folke/lsp-colors.nvim'

     -- [[ Trouble pretty diagnostics view ]]
     -- TODO check how this actually works
     use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
        require("trouble").setup {
            position = "bottom", -- position of the list can be: bottom, top, left, right
            height = 10, -- height of the trouble list when position is top or bottom
            width = 50, -- width of the list when position is left or right
            icons = true, -- use devicons for filenames
            mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
            fold_open = "", -- icon used for open folds
            fold_closed = "", -- icon used for closed folds
            group = true, -- group results by file
            padding = true, -- add an extra new line on top of the list
            action_keys = { -- key mappings for actions in the trouble list
                -- map to {} to remove a mapping, for example:
                -- close = {},
                close = "q", -- close the list
                cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                refresh = "r", -- manually refresh
                jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
                open_split = { "<c-x>" }, -- open buffer in new split
                open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                open_tab = { "<c-t>" }, -- open buffer in new tab
                jump_close = {"o"}, -- jump to the diagnostic and close the list
                toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                toggle_preview = "P", -- toggle auto_preview
                hover = "K", -- opens a small popup with the full multiline message
                preview = "p", -- preview the diagnostic location
                close_folds = {"zM", "zm"}, -- close all folds
                open_folds = {"zR", "zr"}, -- open all folds
                toggle_fold = {"zA", "za"}, -- toggle fold of current file
                previous = "k", -- previous item
                next = "j" -- next item
            },
            indent_lines = true, -- add an indent guide below the fold icons
            auto_open = false, -- automatically open the list when you have diagnostics
            auto_close = false, -- automatically close the list when you have no diagnostics
            auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
            auto_fold = false, -- automatically fold a file trouble list at creation
            auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
            signs = {
                -- icons / text used for a diagnostic
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = "﫠"
            },
            use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
        }
     end
     } 

     -- [[ indent-blankline: Better indentation experience ]]
     use "lukas-reineke/indent-blankline.nvim"

     -- [[ nvim-autopairs: smart auto pairing of brackets ]]
     use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
     }

     -- [[ vim-surround: easily change and create surrounding environments ]]
     -- TODO see how this works and practice
     use 'tpope/vim-surround'

     -- [[ vim-illuminate: highlight the same words as under cursor ]]
     use 'RRethy/vim-illuminate'
     -- default configuration
        require('illuminate').configure({
            -- providers: provider used to get references in the buffer, ordered by priority
            providers = {
                'lsp',
                'treesitter',
                'regex',
            },
            -- delay: delay in milliseconds
            delay = 100,
            -- filetype_overrides: filetype specific overrides.
            -- The keys are strings to represent the filetype while the values are tables that
            -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
            filetype_overrides = {},
            -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
            filetypes_denylist = {
                'dirvish',
                'fugitive',
            },
            -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
            filetypes_allowlist = {},
            -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
            -- See `:help mode()` for possible values
            modes_denylist = {},
            -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
            -- See `:help mode()` for possible values
            modes_allowlist = {},
            -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
            -- Only applies to the 'regex' provider
            -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
            providers_regex_syntax_denylist = {},
            -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
            -- Only applies to the 'regex' provider
            -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
            providers_regex_syntax_allowlist = {},
            -- under_cursor: whether or not to illuminate under the cursor
            under_cursor = true,
            -- large_file_cutoff: number of lines at which to use large_file_config
            -- The `under_cursor` option is disabled when this cutoff is hit
            large_file_cutoff = nil,
            -- large_file_config: config to use for large files (based on large_file_cutoff).
            -- Supports the same keys passed to .configure
            -- If nil, vim-illuminate will be disabled for large files.
            large_file_overrides = nil,
            -- min_count_to_highlight: minimum number of matches required to perform highlighting
            min_count_to_highlight = 1,
        })

    -- [[ comment quickly ]]
    -- TODO test this with rust, python
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                ignore = '^$',
                toggler = {
                    line = '<leader>cc',
                    block = '<leader>bc',
                },
                opleader = {
                    line = '<leader>c',
                    block = '<leader>b',
                },
            })
        end
    }

    -- [[ NICE LOOKS AND FEEL ]]
    -- leverage treesitter and hightlight argument definitions
    use 'm-demare/hlargs.nvim'
    -- highlight our prompt when we jump from one location to another.
    use 'danilamihailov/beacon.nvim'
    -- an awesome color theme (used in the screenshots of this post).
    -- use 'tanvirtin/monokai.nvim'
    -- another great color-theme
    use 'navarasu/onedark.nvim'
    require('onedark').setup {
        style = 'deep'
    }
    require('onedark').load()
    -- cool icons in the file explorer and other places
    use 'kyazdani42/nvim-web-devicons'
    -- make neovim even faster
    use 'lewis6991/impatient.nvim'
    require('impatient')
    -- alpha is a cool startup greeter
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }

    -- [[ Ripgrep is used as a searching tool ]]
    -- TODO see how this works
    -- cargo install ripgrep


     -- Put this at the end after all plugins
     if packer_bootstrap then
        require('packer').sync()
     end

end)

-- END PACKER
