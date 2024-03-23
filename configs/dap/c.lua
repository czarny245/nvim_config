local M = {}

local dap = require "dap"

function M.setup(_)
  dap.configurations.c = {
    {
      name = "Launch",
      type = "gdb",
      -- type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopAtBeginningOfManSubprogram = false,
    },
  }
  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" },
  }
end

return M
