local M = {}

local function pcall_panic(func, ...)
  local ok, error = pcall(func, ...)
  if not ok then
    vim.notify(error, vim.log.levels.ERROR)
  end
end

local function quit()
  pcall_panic(vim.cmd.quit, { mods = { silent = true } })
end

local function quitall()
  pcall_panic(vim.cmd.quitall, { mods = { silent = true } })
end

local function is_last_window()
  local wins = vim.api.nvim_list_wins()
  local count = 0
  for _, v in ipairs(wins) do
    local is_normal_window = vim.api.nvim_win_get_config(v).relative == ""
    if is_normal_window then
      count = count + 1
    end
  end
  return count == 1
end

function M.is_last_quit()
  local is_last_tab_page = vim.fn.tabpagenr("$") == 1
  local is_last_viewable = is_last_window() and is_last_tab_page

  local should_quit = not is_last_viewable
  if should_quit then
    quit()
  else
    quitall()
  end
end

return M
