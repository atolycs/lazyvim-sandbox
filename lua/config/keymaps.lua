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
  end
end, default_opts({ desc = "Close Tab" }))

keymap.set("n", "dw", 'vb"_d', default_opts({ desc = "Delete back word" }))

-- Word movement
keymap.set({ "n", "v" }, "<C-l>", "e", default_opts({ desc = "Move to the end of the word" }))
keymap.set({ "n", "v" }, "<C-h>", "b", default_opts({ desc = "Move to the beginning of the word" }))

-- Disable continuation of comments
keymap.set("n", "<Leader>o", "o<Esc>^Da", default_opts({ desc = "Insert newline below" }))
keymap.set("n", "<Leader>O", "O<Esc>^Da", default_opts({ desc = "Insert newline above" }))

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
end)

keymap.set("n", "sv", function()
  if g.vscode then
    local vscode = require("vscode")
    vscode.call("workbench.action.splitEditorDown")
  else
    vim.cmd("vsplit")
  end
end)

--  Move window
keymap.set("n", "sh", "<C-w>h", silent_opts({ desc = "Move to the left window" }))
keymap.set("n", "sj", "<C-w>j", silent_opts({ desc = "Move to the bottom window" }))
keymap.set("n", "sk", "<C-w>k", silent_opts({ desc = "Move to the top window" }))
keymap.set("n", "sl", "<C-w>l", silent_opts({ desc = "Move to the right window" }))

-- Copilot Switch
keymap.set("n", "<Leader>cp", "<cmd>Copilot toggle<CR>", silent_opts({ desc = "Toggle Copilot" }))
