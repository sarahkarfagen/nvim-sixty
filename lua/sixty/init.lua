--[[
sixty - Disables arrow keys and encourages using a 60% keyboard layout by displaying reminders.
]]

local M = {}

local config = require("sixty.config")
local notifications = require("sixty.notifications")

--- Configures sixty using user-defined options or defaults.
--  Calls setup_keymaps to disable arrow keys across specified modes.
-- @param opts table User configuration options. See `config.lua` for available options.
function M.setup(opts)
  opts = opts or {} -- Ensure opts is a table, even if nil
  config.setup(opts)
  M.setup_keymaps()
end

--- Disables arrow keys across specified modes (normal, insert, visual, and command)
--  and sets command-line keymaps for "tcsh"-style control movements.
function M.setup_keymaps()
  local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
  local modes = { "n", "i", "v", "c" } -- Normal, Insert, Visual, and Command modes

  -- Set arrow key mappings in each specified mode
  for _, key in ipairs(keys) do
    for _, mode in ipairs(modes) do
      M.set(mode, key)
    end
  end

  -- Set command-line mode mappings for "tcsh"-style movement controls
  vim.keymap.set("c", "<C-A>", "<Home>", { remap = false })
  vim.keymap.set("c", "<C-F>", "<Right>", { remap = false })
  vim.keymap.set("c", "<C-B>", "<Left>", { remap = false })
end

--- Disables a specific key in given mode(s) with a notification callback.
--  Calls `notifications.notify_arrow_usage` on key press to show an alert.
-- @param mode string|string[] Mode short-name (e.g., "n" for normal, "i" for insert, etc.).
-- @param lhs string           Left-hand side (LHS) of the mapping to be disabled (e.g., "<Up>", "<Down>").
-- @param opts table?          Options table for `vim.keymap.set`. Defaults to `{ remap = false, silent = true }`.
function M.set(mode, lhs, opts)
  vim.keymap.set(
    mode,
    lhs,
    notifications.notify_arrow_usage,
    opts or { remap = false, silent = true }
  )
end

return M

