set nocompatible " turn off vi compability
set encoding=utf-8
set exrc " load vimrc from current directory

" vundle
filetype off " required!
set rtp+=~/.dotfiles/vim/bundle/vundle/
call vundle#rc('$HOME/.dotfiles/vim/bundle')

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'Solarized'

filetype plugin indent on " required!

set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

syntax enable
set synmaxcol=800 " don't try to highlight long lines
set linespace=1

set ruler
set cursorline
set showcmd

set hidden

