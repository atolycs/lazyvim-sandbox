-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local keymap = vim.keymap

local silent_opts = { noremap = true, silent = true }
local opts = { noremap = true, silent = false }

keymap.set("n", "dd", '"_dd', { desc = "Delete line" })
keymap.set("n", "x", '"_x', { desc = "Delete character" })
keymap.set("n", "qq", ":qa<CR>", { desc = "Quit All" })

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', { desc = "Delete backwords" })

-- select all
keymap.set("n", "<C-a>", "gg<S-V>G", { desc = "Select all" })

-- split window
keymap.set("n", "ss", ":split<CR>", { desc = "Split window" })
keymap.set("n", "sv", ":vsplit<CR>", { desc = "Vertical split window" })

--  Move window
keymap.set("n", "sh", "<C-w>h", silent_opts)
keymap.set("n", "sk", "<C-w>k", silent_opts)
keymap.set("n", "sj", "<C-w>j", silent_opts)
keymap.set("n", "sl", "<C-w>l", silent_opts)
