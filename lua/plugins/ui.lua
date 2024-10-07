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
      icons = {
        filetype = {
          enabled = false,
        },
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local icons = require("atolycs.icons")
      local function padding(opts)
        return {
          type = "padding",
          val = opts.val,
        }
      end

      local header = {
        type = "text",
        val = custom_text or dashboard.section.header.val,
        opts = {
          position = "center",
        },
      }

      local sections = {
        buttons = {
          quick_actions = {
            type = "group",
            val = {
              {
                type = "text",
                val = "File",
                opts = {
                  position = "center",
                },
              },
              dashboard.button("n", icons.dashboard.new_file .. " New File", [[<cmd> ene <BAR> startinsert <cr>]]),
              dashboard.button("o", icons.dashboard.open_file .. " Open File", "<cmd>Telescope file_browser<cr>"),
            },
            opts = {
              position = "left",
            },
          },
          config = {
            type = "group",
            val = {
              {
                type = "text",
                val = "Config",
                opts = {
                  position = "center",
                },
              },
              dashboard.button(
                "c",
                icons.dashboard.wrench .. " Neovim",
                [[<cmd> lua LazyVim.pick.config_files()() <cr>]]
              ),
            },
          },
          lazy = {
            type = "group",
            val = {
              {
                type = "text",
                val = "lazy",
                opts = {
                  position = "center",
                },
              },
              dashboard.button("l", icons.dashboard.bolta .. " Lazy Manager", [[<cmd> Lazy <cr>]]),
              dashboard.button("SPC l s", "  " .. icons.lazy.sync .. " Sync Plugins...", "<cmd>Lazy sync<cr>"),
              dashboard.button("SPC l u", "  " .. icons.lazy.update .. " Update Plugins...", "<cmd>Lazy update<cr>"),
            },
          },
          system = {
            type = "group",
            val = {
              {
                type = "text",
                val = "System",
                opts = {
                  position = "center",
                },
              },
              dashboard.button("q", icons.dashboard.quit .. " Quit", "<cmd>qa<cr>"),
            },
          },
        },
      }

      -- stylua :ignore
      -- dashboard.section.buttons.val = {
      --   dashboard.button("n", icons.dashboard.new_file .. " New File", [[<cmd> ene <BAR> startinsert <cr>]]),
      --   dashboard.button("f", icons.dashboard.search .. " Find file", [[<cmd> lua LazyVim.pick()()<cr>]]),
      --   dashboard.button("c", icons.dashboard.wrench .. " Config", [[<cmd> lua LazyVim.pick.config_files()() <cr>]]),
      --   dashboard.button("l", icons.dashboard.bolta .. " Lazy", [[<cmd> Lazy <cr>]]),
      --   dashboard.button("q", icons.dashboard.quit .. " Quit", "<cmd> qa <cr>"),
      -- }
      --
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end

      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      dashboard.opts.layout = {
        header,

        padding({ val = 2 }),
        sections.buttons.quick_actions,
        sections.buttons.config,
        sections.buttons.lazy,

        padding({ val = 1 }),
        sections.buttons.system,

        padding({ val = 2 }),
        dashboard.section.footer,
      }
      return dashboard
    end,
    config = function(_, dashboard)
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

          dashboard.section.footer.val = "Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. " ms"
            .. "\n"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
