syntax on
set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Clipboard
set clipboard+=unnamedplus

set nowrap
" set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

" Give more space for displaying messages
set cmdheight=2

" Having londer tupdatetime leads to delay and poor user experience
set updatetime=50

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

set colorcolumn=80
set t_Co=256
" set cursorline
