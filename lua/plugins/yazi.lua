return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>e", "<cmd>Yazi<cr>", desc = "Open yazi at current file" },
      { "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Open yazi at cwd" },
    },
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    init = function() end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },
}
