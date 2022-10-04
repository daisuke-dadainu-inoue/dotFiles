" スワップファイルを作成しない
set noswapfile

" 番号
set number
" カーソル行アンダーライン表示
set cursorline

" 不可視文字表示
set list
" set listchars=tab:>-,space:-,trail:-,eol:$,extends:>,precedes:<
" eol,extends,precedesの色
highlight NonText    ctermfg=59
" tab,spaceの色
highlight SpecialKey ctermfg=59
" backspace
set backspace=indent,eol,start

" タブを空白入力に変更
set expandtab
" 画面上でのタブ表示幅
set tabstop=2
" 自動インデントでずれる幅
set shiftwidth=2
" 改行前に前の行のインデントを継続
set autoindent
set smartindent

filetype plugin indent on

" 全角文字設定
" set ambiwidth=double

" 検索大文字小文字区別しない
set ignorecase
" 小文字検索で大文字小文字区別しない
set smartcase
" 再検索
set wrapscan
" インクリメンタル検索
set incsearch
" 検索結果ハイライト
set hlsearch

" コマンド表示
set showcmd

" leader変更
let mapleader = "\<Space>"

" 保存コマンド
nnoremap <Leader>w :w<CR>

" 補完候補一つでも表示
set completeopt=menuone
highlight Pmenu ctermfg=6 ctermbg=235
highlight PmenuSel ctermfg=6 ctermbg=236
highlight Pmenu ctermfg=6 ctermbg=235
highlight PmenuSbar ctermbg=235
highlight PmenuThumb ctermbg=235

" 自動補完
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfo

" 定義へ飛ぶ
nmap <silent> <C-]> :LspDefinition<CR>
" 定義へ飛ぶ
nmap <silent> gd :LspDefinition<CR>
" 呼び出し箇所を見る
nmap <silent> gD :LspReferences<CR>

" 保存時処理
function! s:remove_dust()
  let cursor = getpos(".")
  %s/\s\+$//ge
  %s/\t/  /ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" クリップボード
set clipboard+=unnamed

