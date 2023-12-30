local opt = vim.opt

-- Session Management
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 4

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable the mouse while in nvim
opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- Always 8 lines on top or on bottom
opt.scrolloff = 8

-- Set color Column
opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- swap file options
opt.swapfile = false
opt.backup = false
-- opt.undofile = true
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
