--[[
sixty Notifications
]]

local M = {}

--- Displays a notification reminding the user to use 60% layout keys.
--  The notification timeout is configured in `sixty.config`.
function M.notify_arrow_usage()
  M.count = M.count or 0;
  if M.count == 10 then
    vim.notify("Use 60% keyboard keys for movement!\nType \"nvim man\" for help", vim.log.levels.INFO, {
      title = "sixty",
      timeout = require("sixty.config").notify_timeout,
    })
    M.count = 0
  else
    vim.notify("Use 60% keyboard keys for movement!", vim.log.levels.INFO, {
      title = "sixty",
      timeout = require("sixty.config").notify_timeout,
    })
    M.count = M.count + 1
  end
end

return M

