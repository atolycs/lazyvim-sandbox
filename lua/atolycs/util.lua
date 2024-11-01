local api = vim.api
local fn = vim.fn

local M = {}

--@return boolean
function M.isWindows()
  return fn.has("win") == 1
end

--@return boolean
function M.isMac()
  return fn.has("mac") == 1
end

--@return boolean
function M.isLastBuffer()
  local buffers = fn.getbufinfo({ buflisted = 1 })
  if #buffers == 1 then
    return true
  else
    return false
  end
end

function M.GetBuffer()
  local buflist = {}
  for i = 1, fn.bufnr("$") do
    if fn.buflisted(i) == 1 and fn.getbufvar(i, "&filetype") ~= "nerdtree" then
      table.insert(buflist, i)
    end
  end
  print(buflist)
  return buflist
end

--@return string
function M.get_gir_root()
  local git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(git_path, ":h")
end

-- return M
return M
