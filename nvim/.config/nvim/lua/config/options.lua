-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.ignorecase = false

-- pandoc related

opt.spell = false
opt.spelllang = "ru,en"
opt.foldmethod = "manual"
opt.foldenable = false

-- undo
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- scrolling
opt.number = false
opt.relativenumber = false
opt.scrolloff = 8
opt.linebreak = true

-- indentation
opt.expandtab = true              -- convert tabs to spaces
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 4                   -- insert 4 spaces for a tab
opt.shiftwidth = 4               -- the number of spaces inserted for each indentation
opt.tabstop = 4                   -- insert 4 spaces for a tab

opt.hlsearch = false
opt.incsearch = true

opt.updatetime = 100

-- opt.signcolumn = "auto:1"

opt.textwidth=72

vim.g.mapleader = " "

opt.listchars = "space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\\|>"
opt.list = false

opt.shortmess = "aoOtTI"
opt.ttyfast = true
