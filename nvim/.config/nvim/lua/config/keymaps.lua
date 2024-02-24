-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- lsp
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- surrounding words
vim.keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

-- telescope symbols
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope symbols<cr>", { desc = "Find Symbols" })

vim.keymap.set("i", "<Char-0x4>", "<Del>")
vim.keymap.set("i", "<C-K>", "<C-o>d$")
vim.keymap.set("i", "<Char-0x1b><Char-0x7f>", "<C-o>db")

vim.keymap.set("i", "<Esc>b", "<C-o>b")
vim.keymap.set("i", "<Esc>f", "<C-o>w")

-- ThePrimeagen remaps
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeShow<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Prevent exiting on Control-z
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "n", "v", "c" }, "<C-Z>", "<nop>")

vim.keymap.set({ "n", "v", "c" }, "<C-F>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set({ "n", "v", "c" }, "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set({ "n", "v", "c" }, "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set({ "n", "v", "c" }, "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set({ "n", "v", "c" }, "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set({ "n", "v", "c" }, "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set({ "n", "v", "c" }, "<leader>x", "<cmd>!chmod +x %<CR>")

-- nvim go related
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })
