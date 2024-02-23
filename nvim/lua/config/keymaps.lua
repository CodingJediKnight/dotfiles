-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- lsp
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- surrounding words
vim.keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

-- telescope symbols
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope symbols<cr>", { desc = "Find Symbols" })

-- these keep the cursor in the middle when scrolling with ctrl d and u
-- from https://github.com/ThePrimeagen/init.lua
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- and these are for searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- nvim go related
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })
