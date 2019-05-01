set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ChrisYip/Better-CSS-Syntax-for-Vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
"Plugin 'kien/ctrlp.vim'
"Plugin 'ervandew/supertab'
"Plugin 'scrooloose/vim-space'
"Plugin 'pangloss/vim-javascript'

call vundle#end()            " required
filetype plugin indent on
"run :PluginInstall


""""""""""""""
" UI
""""""""""""""
set t_Co=256
scriptencoding utf-8
set encoding=utf-8
syntax on " syntax highlighting on
colorscheme ron " default dark
set ruler " Always show current positions along the bottom
set cmdheight=1 " the command bar is 2 high
set number " turn on line numbers

set statusline=%F%m%r%h%w\ [buffer=%n]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
set laststatus=2 " always show the status line
set fillchars=vert:\ ,stl:\ ,stlnc:\

set textwidth=121
set colorcolumn=120
hi ColorColumn ctermbg=233 guibg=#121212

set cul                                           " highlight current line
hi CursorLine term=none cterm=none ctermbg=23 "23      " adjust color

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""
"General
""""""""""""""
let mapleader = ","
set nocompatible " get out of horrible vi-compatible mode
set ignorecase
set showmatch
set hlsearch
set incsearch " BUT do highlight as you type you search phrase
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list

set novisualbell " don't blink
set noerrorbells " no noises

set nobackup
set noswapfile

set backspace=2 " make backspace work normal

if has("mouse")
    set mouse=a " use mouse everywhere
    set ttymouse=xterm2
endif

set ve=all

set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for

set cindent " do c-style indenting
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set nowrap " do not wrap lines

" Easy split navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Jump to start and end of line using the home row keys
noremap H ^
noremap L $

" Stupid shift key fixes
command W w
command Q q
command Wq wq
command WQ wq
command Tabe tabe
command E NERDTree

" tab key match bracket pairs.
nnoremap <tab> %
vnoremap <tab> %


set pastetoggle=<F2>
set paste  "interfers with snipmate
map <F3> :call ToggleMouse()<CR>
map <F4> :set list!<CR>
map <F5> :setlocal spell! spelllang=en_us<CR>

function! ToggleMouse()
if &mouse == 'a'
    set mouse=
    set nonumber
    echo "Mouse usage disabled"
else
    set mouse=a
    set number
    echo "Mouse usage enabled"
    endif
    endfunction

if has("autocmd")
  " make these files act like php
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.info set filetype=php
    autocmd BufRead,BufNewFile *.tpl set filetype=php
    autocmd BufRead,BufNewFile *.mustache set filetype=html
    autocmd BufRead,BufNewFile *.scala set filetype=scala
  augroup END
endif

autocmd FileType python set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType ruby set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab

" NERDTree always show invisible files
let NERDTreeShowHidden=1
" close on open
let NERDTreeQuitOnOpen=1

let g:fugitive_github_domains = ['github.com','github.etsycorp.com']

" add any machine specific configs to .vimrc.local
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

set path=~/development/Web/phplib/EtsyModel,~/development/Web/phplib,~/development/Web/templates
set includeexpr=substitute(v:fname,'_','/','g').'.php'
set suffixesadd=.tpl
