set encoding=utf-8
set number relativenumber
syntax enable
set noswapfile
set scrolloff=7
set backspace =indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set fileformat=unix
set guifont=Comic\ Code\ Ligatures:h8
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'rose-pine/neovim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
call plug#end()



let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
colorscheme rose-pine 
let g:airline_theme='gruvbox'

let NerdTreeQuitOnOpen=1
nmap <F2> :NERDTreeToggle<CR>


