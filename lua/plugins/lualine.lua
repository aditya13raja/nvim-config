return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                iconss_enabled = true,
                theme = 'codedark',
                component_separators = { left = '', right = ''},
                -- section_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            sections = {
                lualine_a = {
                    {
                        'vim.fn.getcwd()',
                        fmt = function(str)
                            -- Get only the last folder name
                            return str:match("([^/]+)$")
                        end,
                    }
                },
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        path=1
                    },
                },
                lualine_x = { 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                --lualine_c = {'filename'},
                lualine_x = {'location', 'encoding', 'fileformat'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })
    end
}
