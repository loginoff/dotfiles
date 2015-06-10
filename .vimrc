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

set background=dark

" Indents
set tabstop=8 "sets tab stops to eight characters wide
set expandtab "converts tabs to white space
set softtabstop=4 "makes the Tab key indent by four spaces
set shiftwidth=4 "sets the width for autoindents

"allows auto-indenting depending on file type
filetype indent on

"enamble syntax highligting
syntax on

"enables line numbers
set number

"" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F3>
set clipboard=unnamed
"
" " Mouse and backspace
" set mouse=a
" set bs=2
"
" Moving blocks of code and keep selection
vnoremap < <gv
vnoremap > >gv


" This is for setting up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" " For GitHub repos, you specify plugins using the
" " 'user/repository' format
Plugin 'gmarik/vundle'
"
" " We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'
map <F2> :NERDTreeToggle<CR>

" " To get plugins from Vim Scripts, you can reference the plugin
" " by name as it appears on the site
Plugin 'Buffergator'

Plugin 'saltstack/salt-vim'
Plugin 'ivanov/vim-ipython'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"set laststatus=2

" " Now we can turn our filetype functionality back on
filetype plugin indent on
