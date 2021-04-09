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

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"" Yes, I am a sneaky snek now
Plug 'ambv/black'
"
" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
"
" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'kabouzeid/nvim-lspinstall'
"
" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
"
" THANKS BFREDL
Plug '/home/mpaulson/personal/contextprint.nvim'
Plug '/home/mpaulson/personal/af-pluth-pluth'

Plug 'rust-lang/rust.vim'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug '/home/theprimeagen/personal/af-pluth-pluth'
Plug 'gruvbox-community/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-projectionist'

" prettier
Plug 'sbdchd/neoformat'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Initialize plugin system
call plug#end()


colorscheme onehalfdark
" colorscheme onehalflight
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }
"
" highlight Normal guibg=none
"------ Filetypes ------"

source ~/.config/nvim-nightly/plugin/sets.vim
source ~/.config/nvim-nightly/plugin/git.vim
source ~/.config/nvim-nightly/plugin/lsp.vim
source ~/.config/nvim-nightly/plugin/telescope.vim
source ~/.config/nvim-nightly/plugin/vimspector.vim
source ~/.config/nvim-nightly/plugin/custom_comment.vim

" Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Lisp
autocmd Filetype lisp,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp expandtab shiftwidth=2 tabstop=8 softtabstop=2
" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" JavaScript
" autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript,typescript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

set path=.,,**
lua require'lspconfig'.tsserver.setup{}
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
" Change an option
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap gcc :<c-u>.,.+<c-r>=v:count<cr>call <SID>toggleComment()<cr>
nnoremap gc :<c-u>set opfunc=<SID>commentOp<cr>g@
xnoremap gc :call <SID>toggleComment()<cr>
" nmap <C-_>   <Plug>NERDCommenterToggle

" nvim completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
tnoremap <Esc> <C-\><C-n>

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

