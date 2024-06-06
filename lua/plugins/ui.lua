return {
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      mode = function()
        if vim.opt.diff:get() then
          return "tabs"
        else
          return "buffers"
        end
      end,
    },
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
      {
        "q",
        function(n)
          LazyVim.ui.bufremove(n)
        end,
        desc = "Close Tab",
      },
    },
  },
}
