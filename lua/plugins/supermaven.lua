return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            ignore_filetypes = { "alpha", "NvimTree", "neo-tree", "dashboard", "Outline", "lspinfo", "java", "go" }
        })
    end,
}
