-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local keymap = vim.keymap

local silent_opts = { noremap = true, silent = true }
local opts = { noremap = true, silent = false }

keymap.set("n", "dd", '"_dd')
keymap.set("n", "x", '"_x')
keymap.set("n", "qq", ":qa<CR>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- select all
keymap.set("n", "<C-a>", "gg<S-V>G")

-- split window
keymap.set("n", "ss", ":split<CR>")
keymap.set("n", "sv", ":vsplit<CR>")

keymap.set("n", "sh", "<C-w>h")
--  Move window
keymap.set("n", "sh", "<C-w>h", silent_opts)
keymap.set("n", "sk", "<C-w>k", silent_opts)
keymap.set("n", "sj", "<C-w>j", silent_opts)
keymap.set("n", "sh", "<C-w>h", silent_opts)
