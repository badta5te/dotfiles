return {
  { "RRethy/nvim-treesitter-endwise" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "slim-template/vim-slim", -- Syntax highlighting for VIM
    ft = "slim",
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   opts = {},
  --   config = function()
  --     require("codecompanion").setup({
  --       strategies = {
  --         chat = {
  --           adapter = "anthropic",
  --           model = "claude-sonnet-4-20250514",
  --         },
  --         inline = {
  --           adapter = "anthropic",
  --         },
  --         cmd = {
  --           adapter = "anthropic",
  --         },
  --       },
  --       extensions = {
  --         mcphub = {
  --           callback = "mcphub.extensions.codecompanion",
  --           opts = {
  --             make_vars = true,
  --             make_slash_commands = true,
  --             show_result_in_chat = true,
  --           },
  --         },
  --       },
  --     })
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "ravitemer/mcphub.nvim",
  --     "ravitemer/codecompanion-history.nvim",
  --   },
  -- },
  -- {
  --   "HakonHarnes/img-clip.nvim",
  --   opts = {
  --     filetypes = {
  --       codecompanion = {
  --         prompt_for_file_name = false,
  --         template = "[Image]($FILE_PATH)",
  --         use_absolute_path = true,
  --       },
  --     },
  --   },
  -- },
}
