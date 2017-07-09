"----------------------- Keybindings ----------------------------------

let mapleader = "\<Space>"
inoremap jj <ESC>
nnoremap <leader>f <c-f>

nnoremap <leader>b <c-b>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>d :bdelete<CR>

inoremap <c-h> <Left>
inoremap <c-j> <Up>
inoremap <c-k> <Down>
inoremap <c-l> <Right>

vnoremap ' <esc>`>a'<esc>`<i'<esc>f'
vnoremap " <esc>`>a"<esc>`<i"<esc>f"
vnoremap ) <esc>`>a)<esc>`<i(<esc>f)
vnoremap ] <esc>`>a]<esc>`<i[<esc>f]

vnoremap s :sort<CR>

inoremap {} {}<ESC>i

vnoremap <leader>r :SlimuxREPLSendSelection<CR>
nnoremap <leader>r :SlimuxREPLSendLine<CR>

"---------------------- Misc ------------------------------------------
set hidden                      " Allow switching buffer without saving

"" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F3>
set clipboard=unnamed

" Moving blocks of code and keep selection
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>i `[v`]        " highlight last inserted text

" Some test abreviations
iabbrev ssig --<CR>Martin Loginov<CR>martin.loginov@gmail.com<CR>skype:mart1nl<CR>
iabbrev @@ martin.loginov@gmail.com

"---------------------- Filetype specific stuff -----------------------

filetype indent on              "allows auto-indenting depending on file type

" Some commenting for different filetypes
autocmd FileType clojure inoremap <buffer> () ()<Left>
autocmd FileType clojure inoremap <buffer> [ []<Left>
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
autocmd FileType javascript vnoremap <buffer> <leader>c I//<esc>
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
autocmd FileType python vnoremap <buffer> <leader>c I#<esc>

augroup Go
    autocmd!
    autocmd FileType go set autowrite
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
    autocmd FileType go nnoremap <buffer> <leader>b :GoBuild<CR>
    autocmd FileType go nnoremap <buffer> <leader>r :GoRun<CR>
    autocmd FileType go noremap <buffer> <C-n> :cnext<CR>
    autocmd FileType go noremap <buffer> <leader>c :cclose<CR>
    autocmd FileType go noremap <buffer> dg :GoDefPop<CR>
    autocmd FileType go noremap <buffer> gh :GoDoc<CR>
    autocmd FileType go noremap <buffer> gi :GoImports<CR>

augroup END

augroup Elm
  autocmd!
  autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd BufWrite *.elm setlocal filetype=elm
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"----------------------- Backups --------------------------------------
set nobackup
set writebackup

set undodir=~/.vim/undo
set undofile


"---------------------- Usr interface ---------------------------------
syntax enable                   " enamble syntax highligting
set number                      " set line numbers
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
set background=dark

" GUI
" set ttymouse=xterm2             " force mouse support for screen
" set mouse=a                     " terminal mouse when possible
set guifont=Source\ Code\ Pro\ 9
                                " nice fixedwidth font

"----------------------- Splits ---------------------------------------
set splitbelow
set splitright

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


"----------------------- Search ---------------------------------------
set incsearch                   " do incremental searching
set ignorecase                  " useful more often than not
set smartcase                   " case-sens when capital letters
set hlsearch                    " highlight matches

" clear search highlight
nnoremap <leader><leader> :nohlsearch<CR>

" Search and replace
nnoremap <Leader>s :%s//g<Left><Left>

"---------------------- indents ---------------------------------------
set autoindent                  " keep indenting on <CR>
set shiftwidth=4                " one tab = four spaces (autoindent)
set tabstop=4                   " when VIM opens a file, it shows tabs as this many spaces
set softtabstop=4               " number of spaces inserted when you hit TAB
set expandtab                   " turn tabs into spaces
set shiftround                  " only indent to multiples of shiftwidth
set smarttab                    " DTRT when shiftwidth/softtabstop diverge



"---------------------- TAB completion --------------------------------
set wildmenu                    " show a menu of completions like zsh
set wildmode=full               " complete longest common prefix first
set wildignore+=.*.sw*,__pycache__,*.pyc
                                " ignore junk files
set complete-=i                 " don't try to tab-complete #included files
"set completeopt-=preview        " preview window is super annoying


"---------------------- Folding ---------------------------------------
set foldenable                  " enable folding
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " maximum nested folds
set foldmethod=syntax           " help foldmethod

"---------------------- Plugins ---------------------------------------
set rtp+=~/.vim
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'bling/vim-bufferline'
Plug 'hashivim/vim-terraform'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'epeli/slimux'

call plug#end()

filetype plugin indent on

"---------------------- Plugin settings -------------------------------

"--------------- NETRW
map <F2> :Lexplore<CR>

"let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

"--------------- vim-airline

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_skip_empty_sections = 1
let g:airline_theme='papercolor'

"---------------------- vimdiff color sheme ---------------------------
highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen gui=none guifg=bg guibg=LightGreen
highlight DiffText cterm=none ctermfg=black ctermbg=Red gui=none guifg=bg guibg=Red
