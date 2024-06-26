---@typehMappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- The following adds Tmux compatibility
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j"] = {"<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k"] = {"<cmd> TmuxNavigateUp<CR>", "window up" }
  },
}

return M
