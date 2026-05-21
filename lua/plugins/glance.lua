return {
  {
    "DNLHC/glance.nvim",
    cmd = "Glance",
    keys = {
      { "<leader>cd", "<cmd>Glance definitions<cr>", desc = "Peek Definition" },
      { "<leader>ci", "<cmd>Glance implementations<cr>", desc = "Peek Implementation" },
    },
    opts = {
      detached = false,
      border = {
        enable = true,
      },
      preview_win_opts = {
        wrap = false,
      },
    },
  },
}
