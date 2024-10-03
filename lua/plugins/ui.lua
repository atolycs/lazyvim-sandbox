return {
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    enabled = false,
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
    opts = function()
      -- stylua: ignore
      local select_mode = ""
      if vim.opt.diff:get() then
        select_mode = "tabs"
      else
        select_mode = "buffers"
      end

      return {
        options = {
          mode = select_mode,
          close_command = function(n)
            LazyVim.ui.bufremove(n)
          end,
          right_mouse_command = function(n)
            LazyVim.ui.bufremove(n)
          end,
          diagnostics = "nvim_lsp",
          always_show_bufferline = false,
          diagnostics_indicator = function(_, _, diag)
            local icons = require("lazyvim.config").icons.diagnostics
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
            return vim.trim(ret)
          end,
        },
      }
    end,
  },
  {
    "folke/zen-mode.nvim",
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      auto_hide = true,
    },
  },
}
