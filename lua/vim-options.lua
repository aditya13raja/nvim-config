vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set number")

vim.g.mapleader = " "
vim.opt.guicursor = {
    "n-v-c:block",
    "a:blinkon0",
}

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.termguicolors = true
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>f", ":Ex<CR>")

-- keep the cursor to center while navigating
vim.keymap.set("n", "<C-d>", '<C-d>zz')
vim.keymap.set("n", "<C-u>", '<C-u>zz')

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy past functionality
vim.g.clipboard = {
  name = 'WSLClipboard',
  copy = {
    ["+"] = 'clip.exe',
    ["*"] = 'clip.exe',
  },
  paste = {
    ["+"] = 'powershell.exe -command "Get-Clipboard"',
    ["*"] = 'powershell.exe -command "Get-Clipboard"',
  },
  cache_enabled = 1,
}

-- Keymap Ctrl+C to copy selected text to clipboard in Visual mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Keymap to select all
vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
