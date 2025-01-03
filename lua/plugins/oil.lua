-- This file contains the configuration for the oil.nvim plugin in Neovim.

return {
  -- Plugin: oil.nvim
  -- URL: https://github.com/stevearc/oil.nvim
  -- Description: A Neovim plugin for managing and navigating directories.
  "stevearc/oil.nvim",

  opts = {
    -- Key mappings for oil.nvim actions
    keymaps = {
      ["g?"] = "actions.show_help", -- Show help
      ["<CR>"] = "actions.select", -- Select entry
      ["<C-M-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" }, -- Open entry in vertical split
      ["<C-p>"] = "actions.preview", -- Preview entry
      ["<C-c>"] = "actions.close", -- Close oil.nvim
      ["<C-l>"] = "actions.refresh", -- Refresh oil.nvim
      ["_"] = "actions.parent", -- Go to parent directory
      ["-"] = "actions.open_cwd", -- Open current working directory
      ["gs"] = "actions.change_sort", -- Change sorting method
      ["gx"] = "actions.open_external", -- Open entry with external application
      ["g."] = "actions.toggle_hidden", -- Toggle hidden files
      ["g\\"] = "actions.toggle_trash", -- Toggle trash
      -- ["<C-d>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" }, -- Open entry in horizontal split
      -- ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" }, -- Open entry in new tab
      -- ["`"] = "actions.cd", -- Change directory
    },
    use_default_keymaps = false, -- Do not use default key mappings
  },
}
