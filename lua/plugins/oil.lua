return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    keys = {
        { '<C-e>', '<CMD>Oil<CR>', desc = "Open parent directory" }
    }
}
