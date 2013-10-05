set encoding=utf-8
set nocompatible " turn off vi compability
set exrc " load vimrc from current directory

" vundle
filetype off " required!
set rtp+=~/.dotfiles/vim/bundle/vundle/
call vundle#rc('$HOME/.dotfiles/vim/bundle')

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'fugitive.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'molokai'
Bundle 'delimitMate.vim'
Bundle 'tComment'

filetype plugin indent on " required!

set t_Co=256
colorscheme molokai
let g:molokai_original = 0
set cursorline

syntax enable
set synmaxcol=800 " don't try to highlight long lines
set linespace=1

set ruler
set showcmd
set hidden
set autoread
set updatecount=0

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list " Show invisible sharacters
set backspace=indent,eol,start    " backspace through everything in insert mode
set shell=bash
let g:is_bash=1
set history=200
set scrolloff=1
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set showbreak=↪\
"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter
set gdefault                      " have :s///g flag by default on
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=100

set formatoptions+=j " Delete comment char when joining comment lines
set nojoinspaces " Use only 1 space after "." when joining lines, not 2
" function s:setupWrapping()
"   set wrap
"   set wrapmargin=2
"   set textwidth=80
" endfunction

if has("autocmd")
  " Avoid showing trailing whitespace when in insert mode
  au InsertEnter * :set listchars-=trail:•
  au InsertLeave * :set listchars+=trail:•

  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " https://github.com/sstephenson/bats
  au BufNewFile,BufRead *.bats set ft=sh

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " mark Jekyll YAML frontmatter as comment
  au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/

  " magic markers: enable using `H/S/J/C to jump back to
  " last HTML, stylesheet, JS or Ruby code buffer
  au BufLeave *.{erb,html}      exe "normal! mH"
  au BufLeave *.{css,scss,sass} exe "normal! mS"
  au BufLeave *.{js,coffee}     exe "normal! mJ"
  au BufLeave *.{rb}            exe "normal! mC"
endif

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

let mapleader="\\"

" fuzzysearch в текущей папке
map <leader>f :CtrlP %%<cr>
" fuzzysearch по открытым буферам
map <leader>b :CtrlPBuffer<cr>
" let g:ctrlp_root_markers = ['.git', 'Rakefile']
let g:ctrlp_working_path_mode = 0
" let g:ctrlp_extensions = ['tag', 'buffertag']

" In command-line mode, C-a jumps to beginning (to match C-e)
cnoremap <C-a> <Home>

" toggle between last open buffers
nnoremap <leader><leader> <c-^>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

set splitright
set splitbelow
