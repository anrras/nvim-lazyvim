return {
  "lewis6991/gitsigns.nvim",
  vim.keymap.set(
    { "n", "v" },
    "<leader>gt",
    ":Gitsigns toggle_current_line_blame<CR>",
    { desc = "Toggle blame inline" }
  ),
}
