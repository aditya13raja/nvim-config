return {
    --"olimorris/onedarkpro.nvim", priority = 1000,
    "folke/tokyonight.nvim", priority = 1000, lazy = false,
    config = function()
        vim.cmd.colorscheme "tokyonight"

        -- Set transparent background for main editor and common elements
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- For floating windows
    end
}
