set number
set title
set showmatch
set list
set visualbell
set laststatus=2
set ruler
"sysntax on

set fenc=utf-8
set virtualedit=onemore
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set listchars=tab:>-,trail:-,eol:$
set whichwrap=b,s,h,l,<,>,[,],~
set backspace=indent,eol,start
"let &t_ti.="\e[5 q"

set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch

set mouse=a
set ttymouse=xterm2

noremap <UP> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <UP> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set cursorline
set wildmode=list:longest
set expandtab
set shiftwidth=2
nmap <Esc><Esc> :nohlsearch<CR><Esc>

inoremap <C-j> <DOWN>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap <silent> jj <Esc>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 85

