return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      -- table.insert(
      --   opts.adapters,
      --   require("neotest-jest")({
      --     jestCommand = "npm test --",
      --     jestConfigFile = "custom.jest.config.ts",
      --     env = { CI = true },
      --     cwd = function()
      --       return vim.fn.getcwd()
      --     end,
      --   })
      -- )
      table.insert(
        opts.adapters,
        require("neotest-vitest")({
          -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
          vitestCommand = "node_modules\\.bin\\vitest.CMD",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        })
      )
    end,
  },
}
