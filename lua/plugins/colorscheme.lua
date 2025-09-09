return {
    --    "olimorris/onedarkpro.nvim", priority = 1000,
    "folke/tokyonight.nvim", priority = 1000, lazy = false,
    --"catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
        vim.cmd.colorscheme "tokyonight"

        -- Custom highlights to make text more vibrant and bright
        local highlight = vim.api.nvim_set_hl

        -- Brighten the text color
        highlight(0, "Normal", { fg = "#e0e0e0", bg = "NONE" })  -- Set text to light color
        highlight(0, "Comment", { fg = "#B0B0B0" })  -- Light gray for comments
        highlight(0, "String", { fg = "#A6E3A1" })  -- Bright green for strings
        highlight(0, "Identifier", { fg = "#89B4FA" })  -- Soft bright blue for identifiers
        highlight(0, "Function", { fg = "#F9E2AF" })  -- Warm yellow for functions
        highlight(0, "Keyword", { fg = "#F38BA8", bold = true })  -- Vibrant red for keywords
        highlight(0, "Constant", { fg = "#74C7EC" })  -- Light cyan for constants
        highlight(0, "Type", { fg = "#FAB387" })  -- Light peach for types

        -- Set transparent background for main editor and common elements
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- For floating windows
    end,
}
