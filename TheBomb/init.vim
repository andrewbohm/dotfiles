" HOW TO UPDATE NEOVIM
" cd $HOME/neovim
" git pull
" make distclean && make CMAKE_BUILD_TYPE=Release

"  set runtimepath-=~/.config/nvim
" set runtimepath-=~/.config/nvim/after
" set runtimepath-=~/.local/share/nvim/site
" set runtimepath-=~/.local/share/nvim/site/after

" set runtimepath+=~/.config/nvim-nightly/after
" set runtimepath^=~/.config/nvim-nightly
" set runtimepath+=~/.local/share/nvim-nightly/site/after
" set runtimepath^=~/.local/share/nvim-nightly/site



" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('$HOME/.local/share/nvim-nightly/site/autoload')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Initialize plugin system
call plug#end()

source ~/.config/nvim-nightly/plugin/sets.vim

colorscheme onehalfdark
" colorscheme onehalflight
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }
"
" highlight Normal guibg=none
"
let mapleader = " "
" nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
" Change an option
nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_BOMB
    " Clear current autocommands for group
    autocmd!
    " Execute function trim to all files
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

