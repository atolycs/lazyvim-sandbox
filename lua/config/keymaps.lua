-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local keymap = vim.keymap

local g = vim.g

local function silent_opts(opts)
  opts.silent = true
  opts.noremap = true
  return opts
end

local function default_opts(opts)
  opts.silent = false
  opts.noremap = true
  return opts
end

-- Delete Window keymaps
keymap.del("n", "<C-j>")
keymap.del("n", "<C-k>")
keymap.del("n", "<C-h>")
keymap.del("n", "<C-l>")

keymap.del("n", "<C-s>")

-- local silent_opts = { noremap = true, silent = true, desc = "" }
-- local opts = { noremap = true, silent = false, desc = "" }

keymap.set("n", "<esc><esc>", "<cmd>nohl<cr>", silent_opts({ desc = "Clear Highlight" }))

keymap.set("n", "dd", '"_dd', default_opts({ desc = "Delete line" }))
keymap.set("n", "x", '"_x', default_opts({ desc = "Delete character" }))
keymap.set("n", "qq", function()
  if not vim.g.vscode then
    vim.cmd("qa")
  end
end, default_opts({ desc = "Quit all" }))

keymap.set("n", "q", function()
  if vim.bo.filetype == "help" then
    vim.cmd("helpclose")
  elseif vim.opt.diff:get() then
    vim.cmd("quitall")
  elseif vim.g.vscode then
    local vscode = require("vscode")
    vscode.call("workbench.action.closeActiveEditor")
  elseif require("atolycs.util").isLastBuffer() then
    vim.cmd("qa")
  else
    vim.cmd("BufferWipeout", silent_opts({ desc = "Close Buffer" }))
    -- vim.cmd("b#|bd#|quit")
  end
end, silent_opts({ desc = "Quit All" }))

-- keymap.set("n", "q", function()
--   if vim.bo.filetype == "help" then
--     vim.cmd("helpclose")
--   elseif vim.opt.diff:get() then
--     vim.cmd("quitall")
--   elseif vim.g.vscode then
--     local vscode = require("vscode")
--     vscode.call("workbench.action.closeActiveEditor")
--   end
-- end, default_opts({ desc = "Close Tab" }))

keymap.set("n", "dw", 'vb"_d', default_opts({ desc = "Delete back word" }))

-- Word movement
keymap.set({ "n", "v" }, "<C-l>", "e", default_opts({ desc = "Move to the end of the word" }))
keymap.set({ "n", "v" }, "<C-h>", "b", default_opts({ desc = "Move to the beginning of the word" }))

-- Disable continuation of comments
keymap.set("n", "<Leader>o", "o<Esc>^Da", silent_opts({ desc = "Insert newline below" }))
keymap.set("n", "<Leader>O", "O<Esc>^Da", silent_opts({ desc = "Insert newline above" }))

-- Scroll up and down
keymap.set("n", "<C-j>", "<C-f>", default_opts({ desc = "Scroll Forward" }))
keymap.set("n", "<C-k>", "<C-b>", default_opts({ desc = "Scroll Backward" }))

-- select all
keymap.set("n", "<C-a>", "gg<S-V>G", default_opts({ desc = "Select all" }))

-- split window
-- keymap.set("n", "ss", "<cmd>split<CR>", silent_opts({ desc = "Split window" }))
-- keymap.set("n", "sv", "<cmd>vsplit<CR>", silent_opts({ desc = "Vertical split window" }))

keymap.set("n", "ss", function()
  if g.vscode then
    local vscode = require("vscode")
    vscode.call("workbench.action.splitEditorRight")
  else
    vim.cmd("split")
  end
end, silent_opts({ desc = "Split Window" }))

keymap.set("n", "sv", function()
  if g.vscode then
    local vscode = require("vscode")
    vscode.call("workbench.action.splitEditorDown")
  else
    vim.cmd("vsplit")
  end
end, silent_opts({ desc = "Split Vertical Window" }))

--  Move window
keymap.set("n", "sh", "<C-w>h", silent_opts({ desc = "Move to the left window" }))
keymap.set("n", "sj", "<C-w>j", silent_opts({ desc = "Move to the bottom window" }))
keymap.set("n", "sk", "<C-w>k", silent_opts({ desc = "Move to the top window" }))
keymap.set("n", "sl", "<C-w>l", silent_opts({ desc = "Move to the right window" }))
keymap.set("n", "sq", "<cmd>bwipeout<cr>", silent_opts({ desc = "Close window" }))

-- Copilot Switch
keymap.set("n", "<Leader>cp", "<cmd>Copilot toggle<CR>", silent_opts({ desc = "Toggle Copilot" }))

-- Zen Mode
keymap.set("n", "<Leader>z", function()
  if g.vscode then
    local vscode = require("vscode")
    vscode.call("workbench.action.toggleZenMode")
  else
    vim.cmd("ZenMode")
  end
end, silent_opts({ desc = "Toggle Zen Mode" }))

keymap.set({ "n", "v" }, "+", "zc", silent_opts({ desc = "Close one fold under the cursor" }))
keymap.set({ "n", "v" }, "++", "zM", silent_opts({ desc = "Close all folds" }))
keymap.set({ "n", "v" }, "-", "zo", silent_opts({ desc = "Open one fold under the cursor" }))
keymap.set({ "n", "v" }, "--", "zR", silent_opts({ desc = "Open all folds" }))

-- Oil Map
keymap.set("n", "ooo", "<cmd>Oil<CR>", silent_opts({ desc = "Open parent Directory" }))

-- barbar
keymap.set("n", "<tab>", "<cmd>BufferNext<CR>", silent_opts({ desc = "Next Buffer" }))
keymap.set("n", "<S-tab>", "<cmd>BufferPrevious<CR>", silent_opts({ desc = "Previous Buffer" }))

-- copilot suggestions navigation
keymap.set("i", "<C-CR>", "<cmd>Coiplot suggestion dismiss<cr>", silent_opts({ desc = "Copilot Suggestions" }))
