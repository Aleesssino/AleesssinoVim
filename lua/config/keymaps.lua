-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local Util = require("lazy.util")

keymap.set("n", "<C-/>", function()
  Util.float_term(nil, { border = "rounded" })
end, { desc = "Term with border" })

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "=", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Split window
-- keymap.set("n", "ss", ":split<Return>", opts)
-- keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sl", "<C-w>l")

-- Resize window
-- keymap.set("n", "<C-S-h>", "<C-w><")
-- keymap.set("n", "<C-S-l>", "<C-w>>")
-- keymap.set("n", "<C-S-k>", "<C-w>+")
-- keymap.set("n", "<C-S-j>", "<C-w>-")

-- Oil vim
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Paste over a word without overwriting the current register content
keymap.set("n", "<Leader>P", '"_diw0P', { noremap = true, silent = true })

-- Special
-- open current file (html..) in browser
keymap.set("n", "<Leader>io", ":!xdg-open %<CR>", { desc = "open Image/File" })
-- move Image
keymap.set("n", "<Leader>ip", ":MoveImage<CR>", { noremap = true, silent = true })

-- FastAction code action for normal mode
keymap.set("n", "<Leader>a", "<CMD>lua require('fastaction').code_action()<CR>", { buffer = bufnr }, {
  desc = "FastAction Code Action",
})

-- FastAction range code action for visual mode
keymap.set("v", "<Leader>a", "<ESC><CMD>lua require('fastaction').range_code_action()<CR>", { buffer = bufnr }, {
  desc = "FastAction Range Code Action",
})

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
