return {
  {
    enabled = false,
    "folke/flash.nvim",
  },
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = function()
          if not require("atolycs.util").isWindows() then
            return "make"
          end
        end,
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "sf",
        function()
          local telescope = require("telescope")
          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            hidden = true,
            cwd = telescope_buffer_dir(),
            initial_mode = "normal",
            layout_config = {
              height = 40,
            },
          })
        end,
        desc = "Open file browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
        file_ignore_patterns = {
          ".git",
        },
      })

      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.extensions = {
        file_browser = {
          hijack_netrw = true,
          hidden = {
            file_browser = true,
            folder_browser = true,
          },
          mappings = {
            ["n"] = {
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,

              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,

              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
            },
          },
        },
      }
      telescope.setup(opts)
      if not vim.fn.has("win") then
        require("telescope").load_extension("fzf")
      end
      require("telescope").load_extension("file_browser")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
