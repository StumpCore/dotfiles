-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    -- opts = function(_, opts)
    --   -- add more things to the ensure_installed table protecting against community packs modifying it
    --   -- opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
    --   --   "codelldb",
    --   --   "cpptools",
    --   -- })
    -- end,
  },
}
