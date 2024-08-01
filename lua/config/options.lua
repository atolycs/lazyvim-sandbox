-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false

vim.opt.scrolloff = 10
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }

vim.opt.inccommand = "split"
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0

if vim.g.vscode then
  local vscode = require("vscode")
  vim.notify = vscode.notify
  vim.g.clipboard = vim.g.vscode_clipboard
  vim.notify("VScode setting loaded", "info", { title = "LazyVim" })
end
