"文字コードをutf-8
set fenc=utf-8

"バックアップファイルを作らない
set nobackup

"スワップファイルを作らない
set noswapfile

"編集中のファイルが変更されたら自動で読み直す
set autoread

"バッファが処理中でもその他のファイルを開けるように
set hidden

"入力中のコマンドをステータスに表示する
set showcmd

"行番号
set number

"現在行を強調表示
set cursorline

"現在の行を強調表示
set virtualedit=onemore

"インデントはスマートインデント
set smartindent

"ビープ音を可視化
set visualbell

"括弧入力時の対応する括弧を表示
set showmatch

"ステータスラインを常に表示
set laststatus=2

"コマンドラインの補完
set wildmode=list:longest

"折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

"不可視文字を可視化
set list listchars=tab:\▶︎\-

"Tab文字を半角スペースにする
set expandtab

"行頭以外のtab文字の表示幅
set tabstop=4

"行頭でのtab文字の表示幅
set shiftwidth=4

"検索文字列が小文字の場合は大文字小文字区別なく検索する
set ignorecase

"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

"検索文字列入力時に順次対象文字列をヒットさせる
set incsearch

"検索時に最後まで行ったら最初に戻る
set wrapscan

"検索語をハイライト表示
set hlsearch

"ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

