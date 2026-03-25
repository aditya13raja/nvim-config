-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		local config = require("nvim-treesitter.configs")
-- 
-- 		config.setup({
-- 			ensure_installed = { "lua", "javascript", "html", "go", "css", "typescript", "java" },
--             auto_install = true,
-- 			highlight = { enable = true },
-- 			indent = { enable = true },
-- 		})
-- 	end,
-- }
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = { "lua", "javascript", "html", "go", "css", "typescript", "java" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        -- pcall safely attempts to require the module. 
        -- If it fails (e.g., during initial install), it exits the function without crashing Neovim.
        local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return
        end

        treesitter.setup(opts)
    end,
}
