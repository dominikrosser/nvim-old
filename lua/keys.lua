-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '<esc>', {}) -- basically this sets the usual esc to jk

-- Vimspector keys
-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>", {})
map('n', "Dw", ":call vimspector#AddWatch()<cr>", {})
map('n', "De", ":call vimspector#Evaluate()<cr>", {})

-- Floaterm floating terminal
map('n', "<leader>ft", ":FloatermNew --name=myfloat2 --height=0.9 --width=0.9 --autoclose=2 fish <CR> ", {})
map('n', "t", ":FloatermToggle myfloat2<CR>", {})
map('t', "<Esc>", "<C-\\><C-n>:q<CR>", {})

-- nvim-tree file explorer
map('n', "<leader>e", ":NvimTreeToggle<CR>", {})
map('n', "<leader>f", ":NvimTreeFocus<CR>", {})

-- tagbar this lists classes and functions and stuff
map('n', "<leader>t", ":TagbarToggle<CR>", {})
-- TODO install ctags for rust

-- todo-comments: jump between todos
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
-- TODO test this in python, rust

-- trouble: diagnostics tab
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)

-- lazygit
-- " setup mapping to call :LazyGit
map('n', "<leader>gg", ":LazyGit<CR>", {})
