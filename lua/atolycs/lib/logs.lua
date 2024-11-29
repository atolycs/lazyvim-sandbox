--- @type { [string]: function }
local M = {}

local api = vim.api
local notify = vim.notify

--- @type {[string]: string}
local default_opts = {
  title = "Atolycs Plugin",
}

--- @enum loglevel
local logLevel = {
  TRACE = 0,
  DEBUG = 1,
  INFO = 2,
  WARN = 3,
  ERROR = 4,
}

--- @param str string
--- @param level loglevel
--- @return nil
local function send_notify(str, level)
  notify(str, level, default_opts)
  return nil
end

--- @param str string
--- @return nil
function M.info(str)
  send_notify(str, logLevel.INFO)
end

--- @param str string
--- @return nil
function M.warn(str)
  send_notify(str, logLevel.WARN)
end
--- @param str string
--- @return nil
function M.error(str)
  send_notify(str, logLevel.ERROR)
end
--- @param str string
--- @return nil
function M.debug(str)
  send_notify(str, logLevel.DEBUG)
end

return M
