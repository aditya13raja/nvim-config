vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set number")

vim.g.mapleader = " "

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

-- Use <C-c> to copy to the Windows system clipboard in visual mode
vim.keymap.set('v', '<C-c>', function()
    -- Yank the selected text into the unnamed register
    vim.cmd('normal! "+y')
    -- Get the yanked text from the clipboard register
    local selected_text = vim.fn.getreg("+")
    -- Send the yanked text to the Windows clipboard using clip.exe
    vim.fn.system('clip.exe', selected_text)
end, { noremap = true, silent = true })
