--[[
sixty Configurations

Variables:
  - notify_timeout: Timeout duration (in milliseconds) for notifications.
]]

local M = {}

--- Configures sixty with user-defined options or applies defaults.
--  If `notify_timeout` is not provided in `opts`, defaults to 2000 ms.
-- @param opts table User configuration options. Fields:
--   - notify_timeout (number): Sets the duration of the notification display in milliseconds.
function M.setup(opts)
  M.notify_timeout = opts.notify_timeout or 2000
end

return M

