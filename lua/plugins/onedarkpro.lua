return {
    "olimorris/onedarkpro.nvim", priority = 1000,
    config = function()
        vim.cmd.colorscheme "onedark"
        --        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        --        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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
