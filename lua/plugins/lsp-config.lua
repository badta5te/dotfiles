return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "eslint", "html", "solargraph" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.eslint.setup({})
      lspconfig.html.setup({})
      lspconfig.solargraph.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Get description' })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = 'Go to definition' })
      vim.keymap.set({ 'n', 'v' }, "<leader>ca", vim.lsp.buf.code_action, { desc = 'Code actions' })
    end
  }
}

