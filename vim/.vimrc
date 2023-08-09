" Plugins
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
  Plug 'rakr/vim-one'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
  
" COC Config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" General Config
set nocompatible
set updatetime=300
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
set signcolumn=yes
set background=light
set termguicolors
colorscheme one
set showcmd
set cmdheight=2
set history=50
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

if has("gui_running")
  set guifont=JetBrainsMono\ 14
  set guioptions=aegit
  set lines=30
  set columns=120
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
