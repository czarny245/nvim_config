-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
---------------------------------
-- Autocommand to save the view when leaving a buffer
-- vim.api.nvim_create_autocmd("BufWinLeave", { pattern = "*", command = "mkview" })
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    if vim.fn.filereadable(vim.fn.expand "%:p") ~= 0 then
      vim.cmd "mkview"
    end
  end,
})

-- Autocommand to load the view when entering a buffer
-- vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*", command = "silent! loadview" })
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.filereadable(vim.fn.expand "%:p") ~= 0 then
      vim.cmd "silent! loadview"
    end
  end,
})
