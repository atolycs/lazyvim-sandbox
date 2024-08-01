local M = {}

--@return boolean
function M.isWindows()
  return vim.fn.has("win") == 1
end

--@return boolean
function M.isMac()
  return vim.fn.has("mac") == 1
end

-- return M
return {
  M,
}
