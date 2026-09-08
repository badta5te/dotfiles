-- Run ruby-lsp via `mise exec -- bundle exec` instead of Mason's binstub.
-- Mason's gem binstub hardcodes an absolute Ruby path in its shebang at
-- install time, so it silently breaks every time the project's Ruby
-- version changes (see .ruby-version). Routing through mise + bundle
-- picks up whatever Ruby the project is pinned to on every launch, using
-- the ruby-lsp gem that's already resolved in Gemfile.lock.
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
        cmd = { "mise", "x", "--", "bundle", "exec", "ruby-lsp" },
      },
    },
  },
}
