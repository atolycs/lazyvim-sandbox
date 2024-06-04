return {
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<tab>",
        "<Cmd>BufferLineCycleNext<CR>",
        desc = "Next Tab",
      },
      {
        "<S-tab>",
        "<Cmd>BufferLineCyclePrev<CR>",
        desc = "Previous Tab",
      },
    },
  },
}
