-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Back to normal mode with jj
map("i", "jk", "<ESC>", opts)

-- Center the document in the last line you edit the file
map("n", ";", "g;zzzv", opts)

-- Position cursor at the middle of the screen after scrolling half page
map("n", "<C-d>", "<C-d>zzzv") -- Scroll down half a page and center the cursor
map("n", "<C-u>", "<C-u>zzzv") -- Scroll up half a page and center the cursor

-- Fix n and N for search. Keeping cursor in center
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Redefine Ctrl+s to save with the custom function
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", opts)

----- OIL -----
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Custom save function
function SaveFile()
  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename
  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved!") -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end
