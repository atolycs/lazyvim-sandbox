local M = {}

--@return boolean
function M.isWindows()
  return vim.fn.has("win") == 1
end

--@return boolean
function M.isMac()
  return vim.fn.has("mac") == 1
end

--@return boolean
function M.isLastBuffer()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #buffers == 1 then
    return true
  else
    return false
  end
end

function M.GetBuffer()
  local buflist = {}
  for i = 1, vim.fn.bufnr("$") do
    if vim.fn.buflisted(i) == 1 and vim.fn.getbufvar(i, "&filetype") ~= "nerdtree" then
      table.insert(buflist, i)
    end
  end
  print(buflist)
  return buflist
end

-- return M
return M
