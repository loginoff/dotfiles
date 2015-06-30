let mapleader = "\<Space>"
inoremap jj <ESC>
nnoremap <leader><leader> V
nnoremap <leader>f <c-f>
nnoremap <leader>b <c-b>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

inoremap <c-h> <Left>
inoremap <c-j> <Up>
inoremap <c-k> <Down>
inoremap <c-l> <Right>


" Some test abreviations
iabbrev ssig --<CR>Martin Loginov<CR>martin.loginov@gmail.com<CR>skype:mart1nl<CR>
iabbrev @@ martin.loginov@gmail.com


" backups and stuff
set nobackup
set writebackup

set undodir=~/.vim/undo
set undofile

"user interface
set history=1000                " remember command mode history
set laststatus=2                " always show status line
set lazyredraw                  " don't update screen inside macros, etc
set matchtime=2                 " ms to show the matching paren for showmatch
set number                      " line numbers
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmatch                   " show matching brackets while typing
"set relativenumber              " line numbers spread out from 0
"set cursorline                  " highlight current line
set display=lastline,uhex       " show last line even if too long; use <xx>

" regexes
set incsearch                   " do incremental searching
set ignorecase                  " useful more often than not
set smartcase                   " case-sens when capital letters

" Indents
set autoindent                  " keep indenting on <CR>
set shiftwidth=4                " one tab = four spaces (autoindent)
set softtabstop=4               " one tab = four spaces (tab key)
set expandtab                   " never use hard tabs
set shiftround                  " only indent to multiples of shiftwidth
set smarttab                    " DTRT when shiftwidth/softtabstop diverge

filetype indent on              "allows auto-indenting depending on file type

" GUI
set ttymouse=xterm2             " force mouse support for screen
set mouse=a                     " terminal mouse when possible
set guifont=Source\ Code\ Pro\ 9    
                                " nice fixedwidth font

set number                      " set line numbers
syntax enable                   " enamble syntax highligting
set background=dark

" tab completion
set wildmenu                    " show a menu of completions like zsh
set wildmode=full               " complete longest common prefix first
set wildignore+=.*.sw*,__pycache__,*.pyc
                                " ignore junk files
set complete-=i                 " don't try to tab-complete #included files
"set completeopt-=preview        " preview window is super annoying

"" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F3>
set clipboard=unnamed

" Moving blocks of code and keep selection
vnoremap < <gv
vnoremap > >gv


" This is for setting up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" " For GitHub repos, you specify plugins using the
" " 'user/repository' format
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'ivanov/vim-ipython'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

" " Now we can turn our filetype functionality back on
call vundle#end()
filetype plugin indent on

" Plugin settings

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
