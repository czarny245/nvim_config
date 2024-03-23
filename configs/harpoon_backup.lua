local M = {}

local whichkey = require "which-key"
local keys = {}

function keys.setup()
  local keymap = {
    p = {
      name = "Harpoon",
      o = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu" },
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Haroon add file" },
      w = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file" },
      q = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
      x = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Test Method DAP" }, -- <- this would require user input

      -- o = { "<cmd>lua require('harpoon.ui').toggle_quick_menu(harpoon.list())<cr>", "Harpoon Quick Menu" },
      -- a = { "<cmd>lua require('harpoon.list').append()<cr>", "Harpoon add file" },
      -- h = { "<cmd>lua require('harpoon.list').select(1)<cr>", "Harpoon select 1" },
      -- t = { "<cmd>lua require('harpoon.list').select(2)<cr>", "Harpoon select 2" },
      -- n = { "<cmd>lua require('harpoon.list').select(3)<cr>", "Harpoon select 3" },
      -- s = { "<cmd>lua require('harpoon.list').select(4)<cr>", "Harpoon select 4" },
    },
  }

  whichkey.register(keymap, {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })
end

function M.setup()
  require("telescope").load_extension "harpoon"
  require("harpoon").setup {}
  -- keys.setup()
  local harpoon = require "harpoon"

  -- REQUIRED
  harpoon:setup()
  -- REQUIRED

  vim.keymap.set("n", "<leader>a", function()
    harpoon:list():append()
  end)
  vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  vim.keymap.set("n", "<C-h>", function()
    harpoon:list():select(1)
  end)
  vim.keymap.set("n", "<C-t>", function()
    harpoon:list():select(2)
  end)
  vim.keymap.set("n", "<C-n>", function()
    harpoon:list():select(3)
  end)
  vim.keymap.set("n", "<C-s>", function()
    harpoon:list():select(4)
  end)
end

return M
