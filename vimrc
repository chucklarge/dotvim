runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stuff I have decided I don't like
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set list " turns out, I don't like listchars -- show chars on end of line, whitespace, etc
"autocmd GUIEnter * :simalt ~x -- having it auto maximize the screen is annoying
"autocmd BufEnter * :lcd %:p:h -- switch to current dir (breaks some scripts)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap leader to comma
let mapleader = ","
"  search stuff
set nocompatible " get out of horrible vi-compatible mode
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader>/ :nohls<cr>

filetype on " detect the type of file
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs=unix,dos,mac " support all three, in this order
filetype plugin on " load filetype plugins
set viminfo+=! " make sure it can save viminfo
"set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
set tags=tags;/

"set digraph
scriptencoding utf-8
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
"set background=dark
syntax on " syntax highlighting on
colorscheme ron " default dark
"colorscheme molokai
"let g:molokai_original=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile
" set backup " make backup file
" set backupdir=$VIM\vimfiles\backup " where to put backup file
" set directory=$VIM\vimfiles\temp " directory is the directory for temp file
" set makeef=error.err " When using make, where should it dump the file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set cmdheight=1 " the command bar is 2 high
set number " turn on line numbers
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
if has("mouse")
    set mouse=a " use mouse everywhere
endif
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\
"set nofoldenable
set switchbuf=useopen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
"set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set list
"set lines=60 " 80 lines tall
"set columns=160 " 140 cols wide
set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set noerrorbells " no noises
set statusline=%F%m%r%h%w\ [buffer=%n]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
set laststatus=2 " always show the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set fo=tcrqn " See Help (complex)
"set ai " autoindent
"set si " smartindent
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
"set noexpandtab " real tabs please!
set expandtab
set nowrap " do not wrap lines
"set smarttab " use tabs at the start of a line, spaces elsewhere

set textwidth=120
set colorcolumn=120
hi ColorColumn ctermbg=233 guibg=#121212

set cul                                           " highlight current line
hi CursorLine term=none cterm=none ctermbg=23 "23      " adjust color

" make ; behave as :
nnoremap ; :
vnoremap ; :

" Easy split navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Jump to start and end of line using the home row keys
noremap H ^
noremap L $

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr> " Easily Edit VIMRC
nnoremap <leader>sv :so $MYVIMRC<cr>      " Easily Source VIMRC

" dont be lazy
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>

" +/- resizes window
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

cmap w!! %!sudo tee > /dev/null % " Force Saving Files that Require Root Permission

command W w
command Q q
command E NERDTree

nnoremap / /\v
vnoremap / /\v

" tab key match bracket pairs.
nnoremap <tab> %
vnoremap <tab> %

" save on losing focus
au FocusLost * :wa

inoremap jj <ESC>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd BufWritePre * :%s/\s\+$//e

" Retab and Format the File with Spaces
nnoremap <leader>T :set expandtab<cr>:retab!<cr>

" cd into the dir that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" diff current file and saved file
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

set pastetoggle=<F2>
"set paste  "interfers with snipmate
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
  augroup END
endif


autocmd FileType python set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType ruby set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab

" add any machine specific configs to .vimrc.local
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

