return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        -- Add other sources as needed
      },
    })

    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, {})
  end,
}

