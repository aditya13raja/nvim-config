vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>f", ":Ex<CR>")

-- keep the cursor to center while navigating
vim.keymap.set("n", "<C-d>", '<C-d>zz')
vim.keymap.set("n", "<C-u>", '<C-u>zz')

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- delete things over without losing the paste value/code
vim.keymap.set("n", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set('n', 'Y', '"+Y', { noremap = true, desc = "Yank line to system clipboard" })
vim.keymap.set('v', 'Y', '"+y', { noremap = true, desc = "Yank selection to system clipboard" })

-- Keymap to select all
vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- Remap for moving in splits
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')


-- Create vertical split
-- Instead of <C-/>, I need to write '_' instead of '/'.
vim.keymap.set('n', '<C-_>', ':vs<CR>')
