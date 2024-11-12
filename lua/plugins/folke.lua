return {
  --- folke/snacks.nvim
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
      notifier = {
        enabled = true,
        style = "fancy",
      },
      toggle = {
        map = vim.keymap.set,
        which_key = true,
        notify = true,
      },
    },
  },
}
