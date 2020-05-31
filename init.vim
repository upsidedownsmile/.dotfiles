"VimPlug
call plug#begin()
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'freitass/todo.txt-vim'
call plug#end()

"General
set autoread
set autoindent
set incsearch      "Move cursor to search result as you type
set autoindent     "Autoindentation
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set ignorecase     "Search is not case sensitive
set wildmenu       "Wildmenu on
set wildmode=longest,full
set backspace=eol,start,indent
set relativenumber
set nocompatible
set encoding=utf-8
set clipboard=unnamed
set splitbelow
set splitright
filetype off
filetype plugin indent on

"Remapping
let mapleader="\<Space>"
let maplocalleader = "\<Space>"
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>w :w!<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
imap jj <Esc>

"Cosmetic
set termguicolors
syntax enable
colorscheme Tomorrow-Night-Eighties
set t_Co=256
set number         "Line Numbers
set ts=2           "Smaller tab size
set tabstop=2
set cmdheight=2    "Height of the cmd line
set lbr            "Linebreak on 500 chars
set tw=500
set cursorline     "Cursor line highlighted
set hlsearch       "Highlight search result
set showcmd        "Command in bottom bar
set linespace=0    "No spacing between lines
set showmatch      "Show matching parenthesis and brackets

"Airline
set laststatus=2
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_theme="tomorrow"
let g:airline_powerline_fonts=1

"indent file
nnoremap <Leader>i gg=G''zz
nnoremap <C-P> :Files<CR>

"colorcolumn
set colorcolumn=+1
hi ColorColumn guibg=#1D8348

"Disable backups and swapfiles
set nobackup
set nowritebackup
set noswapfile

