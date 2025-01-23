-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local toggle_relative_number = vim.api.nvim_create_augroup("ToggleRelativeNumber", { clear = true })

-- No undofile for temps files
autocmd("BufWritePre", {
  pattern = { "*.tmp", "*.log", "*.bak" },
  callback = function()
    cmd([[:setlocal noundofile]])
  end,
})

-- When enter in InsertMode disable relativenumber
autocmd("InsertEnter", {
  group = toggle_relative_number,
  desc = "When enter in InsertMode disable relativenumber",
  callback = function()
    vim.opt.relativenumber = false
  end,
})

-- When leave InsertMode enable relativenumber
autocmd("InsertLeave", {
  group = toggle_relative_number,
  desc = "When leave InsertMode enable relativenumber",
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Auto source lua files after save
autocmd("BufWritePost", {
  pattern = { "*.lua" },
  desc = "Auto source lua files after save",
  callback = function()
    cmd([[:source % ]])
  end,
})

--Establecer el tipo de archivo como "env"
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.env",
  callback = function()
    vim.bo.filetype = "env"
    vim.bo.syntax = "sh"
  end,
})
