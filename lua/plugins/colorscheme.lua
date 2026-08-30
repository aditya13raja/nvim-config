return {
    --    "olimorris/onedarkpro.nvim", priority = 1000,
    --"folke/tokyonight.nvim", priority = 1000, lazy = false,
    "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            transparent_background = false, -- disables setting the background color.
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                    ok = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                    ok = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },
            color_overrides = {},
            custom_highlights = {},
            default_integrations = true,
            auto_integrations = false,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin-nvim"



        -- Custom highlights to make text more vibrant and bright
        -- local highlight = vim.api.nvim_set_hl

        -- Brighten the text color
        -- highlight(0, "Normal", { fg = "#e0e0e0", bg = "NONE" })  -- Set text to light color
        -- highlight(0, "Comment", { fg = "#B0B0B0" })  -- Light gray for comments
        -- highlight(0, "String", { fg = "#A6E3A1" })  -- Bright green for strings
        -- highlight(0, "Identifier", { fg = "#89B4FA" })  -- Soft bright blue for identifiers
        -- highlight(0, "Function", { fg = "#F9E2AF" })  -- Warm yellow for functions
        -- highlight(0, "Keyword", { fg = "#F38BA8", bold = true })  -- Vibrant red for keywords
        -- highlight(0, "Constant", { fg = "#74C7EC" })  -- Light cyan for constants
        -- highlight(0, "Type", { fg = "#FAB387" })  -- Light peach for types

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
