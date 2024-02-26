-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local k = vim.keymap

-- lsp
k.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- surrounding words
k.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

-- telescope symbols
k.set("n", "<leader>fs", "<cmd>Telescope symbols<cr>", { desc = "Find Symbols" })

k.set("i", "<Char-0x4>", "<Del>")
k.set("i", "<C-K>", "<C-o>d$")
k.set("i", "<Char-0x1b><Char-0x7f>", "<C-o>db")

k.set("i", "<Esc>b", "<C-o>b")
k.set("i", "<Esc>f", "<C-o>w")

-- ThePrimeagen remaps
k.set("n", "<leader>pv", "<cmd>Ex<CR>")
k.set("n", "<leader>u", "<cmd>UndotreeShow<CR>")

k.set("v", "J", ":m '>+1<CR>gv=gv")
k.set("v", "K", ":m '<-2<CR>gv=gv")

k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")

k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")
k.set("n", "J", "mzJ`z")

k.set("x", "<leader>p", '"_dP')

k.set("n", "<leader>y", '"+y')
k.set("v", "<leader>y", '"+y')
k.set("n", "<leader>Y", '"+Y')

k.set("n", "<leader>d", '"_d')
k.set("v", "<leader>d", '"_d')

k.set("n", "<C-L>", ':nohl<CR><C-L>')

-- Prevent exiting on Control-z
k.set("n", "Q", "<nop>")
k.set({ "n", "v", "c" }, "<C-Z>", "<nop>")

k.set("n", "<C-F>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

k.set("n", "<C-k>", "<cmd>cnext<CR>zz")
k.set("n", "<C-j>", "<cmd>cprev<CR>zz")
k.set("n", "<leader>k", "<cmd>lnext<CR>zz")
k.set("n", "<leader>j", "<cmd>lprev<CR>zz")

k.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
k.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

k.set({ "n", "v", "c", "i" }, "<F1>", ":set number!<CR> :set relativenumber!<CR>")
k.set({ "n", "v", "c", "i" }, "<F2>", ":set wrap!<CR>")
k.set({ "n", "v", "c", "i" }, "<F3>", ":set signcolumn=no<CR>")
k.set({ "n", "v", "c", "i" }, "<F4>", ":set list!<CR>")
k.set({ "n", "v", "c", "i" }, "<F5>", ":set signcolumn=yes<CR>")
k.set({ "n", "v", "c", "i" }, "<F7>", ":set spell!<CR>")

-- nvim go related
k.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })
