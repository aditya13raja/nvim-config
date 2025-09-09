return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- Add TypeScript support
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- Completion plugins
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
  },
  config = function()
    local lsp = require("lsp-zero")

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "jdtls",
        "lua_ls",
        "jsonls",
        "html",
        "bashls",
        "gopls",
      },
      handlers = {
        lsp.default_setup,
        lua_ls = function()
          local lua_opts = lsp.nvim_lua_ls()
          require("lspconfig").lua_ls.setup(lua_opts)
        end,
      },
    })

    -- TypeScript setup
    require("typescript-tools").setup({
      settings = {
        tsserver_file_preferences = {
          importModuleSpecifierPreference = "non-relative",
        },
        tsserver_format_options = {
          allowIncompleteCompletions = false,
          allowRenameOfImportPath = false,
        },
        code_lens = "all",
        complete_function_calls = true,
      }
    })

    -- ESLint setup
    require("lspconfig").eslint.setup({
      on_attach = function(_client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
    })

    -- Diagnostic configuration (added for full message)
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        source = "always",
        format = function(diagnostic)
          return string.format("%s: %s", diagnostic.source, diagnostic.message)
        end,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    local cmp_action = require("lsp-zero").cmp_action()
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    require("luasnip.loaders.from_vscode").lazy_load()

    -- `/` cmdline setup
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- `:` cmdline setup
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        ["<S-Tab>"] = cmp_action.luasnip_supertab(),
--        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      }),
    })
  end,
}

