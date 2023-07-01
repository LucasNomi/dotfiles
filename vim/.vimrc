set nocompatible
set nobackup
set nowritebackup
set noswapfile
set encoding=utf-8
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
set number
set relativenumber
set termguicolors
colorscheme torte
set showcmd
set cmdheight=2
set history=50
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set nowrap

autocmd InsertEnter * set cursorline
autocmd InsertEnter * set cursorcolumn
autocmd InsertLeave * set nocursorline
autocmd InsertLeave * set nocursorcolumn
