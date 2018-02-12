set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle (required!)
Plugin 'jimf/vim-pep8-text-width'	" pep8 for python
Plugin 'tomasr/molokai'				" Color scheme
Plugin 'scrooloose/nerdtree'		" File explorer
Plugin 'tpope/vim-commentary'		" Commenter
Plugin 'vim-airline/vim-airline'	" airline status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jacob-ogre/vim-syncr'		" sftp tool
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'Townk/vim-autoclose'

call vundle#end()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
"
set nocompatible

" ======= General settings =======
set autochdir
set noexpandtab
set clipboard=unnamed
syntax on
set hlsearch "highlight all search hits

scriptencoding utf-8
set encoding=utf-8
filetype plugin on

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd 		" display incomplete commands
" set incsearch		" do incremental searching
set number
set ruler
" set relativenumber  " show relative line index

let g:gist_open_browser_after_post = 1
set list
set listchars=tab:»\ ,trail:⋅,extends:❯,precedes:❮
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set scrolloff=8 "Start scrolling when we're 8 lines away from margins

" Set status line
set laststatus=2

" ===== Turn off swap files =====
set nobackup
set noswapfile
set nowb

" ===== Python PEP8 settings =====
autocmd Filetype python call SetPythonOptions()
function SetPythonOptions()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set textwidth=79
  set expandtab
  set autoindent
  set fileformat=unix
endfunction

" ==== Nerd Tree settings =====
" Map Ctrl-n for toggling the directory tree
map <C-n> :NERDTreeToggle<CR>

" ===== Colorschemes  =====
set t_Co=256
let g:airline_theme='wombat' "tool bar
let g:rehash256=1
set background=dark
colorscheme molokai

" ===== Spell checking params =====
set spelllang=en_ca

" ===== Settings for LaTeX =====
autocmd FileType tex call SetLatexOptions()
function SetLatexOptions()
  hi clear texItalStyle
  hi clear texBoldStyle
  hi clear texUnderlineStyle
endfunction

" ===== Options for markdown preview =====
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
