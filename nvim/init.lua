vim.cmd [[ let mapleader=';' ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(
"plugins", { 
  checker = { enabled = true, notify = false },
  change_detection = { enabled = true, notify = false },
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
}
)

vim.cmd [[
filetype plugin on
filetype indent on
syntax on
set nocompatible
set mouse=a
set clipboard=unnamedplus
set background=dark
set tabstop=4
set hlsearch
set incsearch
set expandtab
set number
set cpt=.,w,b,u,t
set softtabstop=4
set shiftwidth=4
set autoindent
set number
set backupdir=~/.cache/nvim
set ignorecase
set smartcase

set number
set termguicolors
set clipboard=unnamedplus
colorscheme koehler

"====[ Use persistent cursor ]=================

augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

augroup END


"====[ Use persistent undo ]=================

if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    set undodir=$HOME/.VIM_UNDO_FILES

    " Save a lot of back-history...
    set undolevels=5000

    " Actually switch on persistent undo
    set undofile

"====[ tmux navigator ]=================
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <c-h> :up<cr>:TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :up<cr>:TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :up<cr>:TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :up<cr>:TmuxNavigateRight<cr>
inoremap <silent> <c-h><c-h> <esc>:w<cr>:TmuxNavigateLeft<cr>
inoremap <silent> <c-j><c-j> <esc>:w<cr>:TmuxNavigateDown<cr>
inoremap <silent> <c-k><c-k> <esc>:w<cr>:TmuxNavigateUp<cr>
inoremap <silent> <c-l><c-l> <esc>:w<cr>:TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

]]


