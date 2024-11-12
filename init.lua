-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.loader then
  vim.loader.enable()
end
require("config.lazy")
require("atolycs.util")
require("atolycs.quit-util")
