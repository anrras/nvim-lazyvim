return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      ["neotest-vitest"] = {
        additional_treesitter_queries = [[
          ((call_expression
            function: (identifier) @func_name (#any-of? @func_name "it" "test")
            arguments: (arguments (template_string (string_fragment) @test.name) (arrow_function))
          )) @test.definition
        ]],
        -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
        filter_dir = function(name, rel_path, root)
          return name ~= "node_modules"
        end,
        vitestCommand = "bun run tests",
      },
    },
  },
}

-- return {
--   {
--     "nvim-neotest/neotest",
--     dependencies = {
--       "marilari88/neotest-vitest",
--     },
--     opts = function(_, opts)
--       table.insert(
--         opts.adapters,
--         require("neotest-vitest")({
--           vitestCommand = "node_modules\\.bin\\vitest --api.port 4500",
--           cwd = function(path)
--             return vim.fn.getcwd()
--           end,
--         })
--       )
--     end,
--   },
-- }
