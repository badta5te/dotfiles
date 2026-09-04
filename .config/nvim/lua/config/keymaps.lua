-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>yp", "", {
  noremap = true,
  silent = true,
  desc = "Copy Relative File Path",
  callback = function()
    local path = vim.fn.expand("%:.")
    vim.fn.setreg("+", path)
    vim.notify("Copied relative path: " .. path, vim.log.levels.INFO, { title = "Clipboard" })
  end,
})
vim.api.nvim_set_keymap("n", "<leader>yP", "", {
  noremap = true,
  silent = true,
  desc = "Copy Absolute File Path",
  callback = function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify("Copied absolute path: " .. path, vim.log.levels.INFO, { title = "Clipboard" })
  end,
})
