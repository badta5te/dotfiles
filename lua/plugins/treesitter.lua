return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "typescript", "ruby", "html", "css", "markdown", "yaml", "dockerfile" },
      highlight = { enable = true },
      endwise = { enable = true },
      indent = { enable = true }
    })
  end
}
