return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["q"] = "actions.close",
    },
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = "rounded",
      preview_split = "left",
    },
  },
  dependencies = {
    {
      "echasnovski/mini.icons",
      opts = {},
    },
  },
}
