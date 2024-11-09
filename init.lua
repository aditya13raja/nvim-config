vim.cmd("set expandtab")
vim.cmd("set relativenumber")
vim.cmd("set number")
--vim.cmd("set tabstop=4")
--vim.cmd("set softtabstop=4")
--vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{"olimorris/onedarkpro.nvim", priority = 1000},	
        {
                'nvim-telescope/telescope.nvim', tag = '0.1.8',
                dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin")

-- setting telescope shortcut
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "javascript", "html", "go", "css", "typescript", "java" },
          highlight = { enable = true },
          indent = { enable = true },  
        })

require("onedarkpro").setup()
vim.cmd.colorscheme "onedark"