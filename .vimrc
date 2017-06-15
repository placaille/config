set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'			" let Vundle manage Vundle (required!)
Plugin 'scrooloose/syntastic'		" Syntax
Plugin 'jimf/vim-pep8-text-width'	" pep8 for python
Plugin 'tomasr/molokai'				" Color scheme
Plugin 'scrooloose/nerdtree'		" File explorer
Plugin 'tpope/vim-commentary'		" Commenter
Plugin 'vim-airline/vim-airline'	" airline status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'			" Git wrapper
Plugin 'ctrlpvim/ctrlp.vim'				" Fuzzy finder

call vundle#end()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

scriptencoding utf-8
set encoding=utf-8
filetype plugin on
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set noswapfile
set nowritebackup

set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd 		" display incomplete commands
set incsearch		" do incremental searching
set textwidth=79	" default line width (from python)

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Map Ctrl-n for toggling the directory tree
map <C-n> :NERDTreeToggle<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!
        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=64
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END
else
    set autoindent        " always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
set autochdir
autocmd BufEnter * silent ! cd %:p:h
set noexpandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
"set number  " show line index
set relativenumber  " show relative line index
let g:gist_open_browser_after_post = 1
set list
set listchars=tab:»\ ,trail:⋅,extends:❯,precedes:❮
"set showbreak=↪
vnoremap < <gv
vnoremap > >gv
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>knoremap <C-l> <C-w>l

set clipboard=unnamed
"
" Training wheels!
"
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
syntax on
set t_Co=256


let g:airline_theme='wombat'
let g:rehash256=1
set background=dark
let g:solarized_termcolors=256
" colorscheme solarized
colorscheme molokai
set hlsearch

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
