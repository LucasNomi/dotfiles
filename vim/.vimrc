" Plugins
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
call plug#end()

" General Config
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set encoding=utf-8
set mouse=a
set clipboard=unnamed

if has("gui_running")
  set belloff=all
endif

" Visual Config
set number
set background=dark
set termguicolors
colorscheme gruvbox
set showcmd
set cmdheight=2
set history=50
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

if has("gui_running")
  set guifont=JetBrainsMono\ 20
  set guioptions=aegit
  set lines=900
  set columns=900
endif

" Text Config
syntax enable
set filetype=plugin-indent-on
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=10
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrap

" Vimscript
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
