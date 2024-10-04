-- @param dashboard table? optional
-- @param social table? optional
-- @param program table? optional
local M = {}

M.dashboard = {
  search = "", -- nf-oct-search
  new_file = "", -- nf-cod-new_file
  wrench = "", -- nf-fa-wrench
  bolta = "󱐋", -- nf-md-lightning_bolt
  quit = "󰈆", -- nf-md-exit_to_app
  open_file = "", -- nf-custom-folder_open
}

M.program = {
  nvim = "", -- nf-linux-neovim
}

M.social = {
  github = "", -- nf-dev-github_badge
}

return M
