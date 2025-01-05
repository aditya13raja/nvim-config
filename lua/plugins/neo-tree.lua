return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()

        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left toggle<CR>', {})
        vim.keymap.set('n', '<leader>e', ':Neotree focus<CR>', {})

        require("neo-tree").setup({
            window = {
                position = "left",
                width = 30,
            }
        })

        vim.cmd([[
            highlight NeoTreeNormal guibg=none ctermbg=none
            highlight NeoTreeNormalNC guibg=none ctermbg=none
            highlight NeoTreeEndOfBuffer guibg=none ctermbg=none
            highlight NeoTreeWinSeparator guibg=none ctermbg=none
        ]])
    end
}
