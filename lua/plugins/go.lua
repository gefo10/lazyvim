return {
  -- DAP configuration for attaching to a running Go server
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")
      dap.configurations.go = dap.configurations.go or {}
      table.insert(dap.configurations.go, {
        name = "Attach to server (:8080 / dlv :2345)",
        type = "go",
        request = "attach",
        mode = "remote",
        host = "127.0.0.1",
        port = 2345,
      })
      table.insert(dap.configurations.go, {
        name = "Attach to server (:8081 / dlv :2346)",
        type = "go",
        request = "attach",
        mode = "remote",
        host = "127.0.0.1",
        port = 2346,
      })
    end,
  },

  -- gofmt only (no import reordering), matching GoLand "Reformat Code" without "Optimize Imports"
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "gofmt" },
      },
    },
  },

  -- Configure gopls LSP to disable conflicting formatting
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = false, -- use goimports/gofmt instead, matching GoLand
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
              memoryMode = "DegradeClosed",
            },
          },
        },
      },
    },
  },
}
