"-----------------------------------------------------"
"----------------------------------------------- 4Max "
"     Yb    dP 88 8b    d8 88""Yb  dP""b8             "
"      Yb  dP  88 88b  d88 88__dP dP   `"             "
" .o.   YbdP   88 88YbdP88 88"Yb  Yb                  "
" `"'    YP    88 88 YY 88 88  Yb  YboodP  kishiyamat "
"-----------------------------------------------------"

"******************************************************************************
" BASIC SETUP
"******************************************************************************

" Encoding
set encoding=utf-8
scriptencoding utf-8
set fileencoding=uft-8   " カレントバッファのファイルの文字エンコーディング
set fileencodings=uft-8  " 既存ファイルの編集を開始時の文字エンコーディング
set bomb                 " bite order mark をハンドルする

" Tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Searching
set hlsearch " Highlight search results
set incsearch " Turn on incremental searching
set ignorecase
set smartcase
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <ESC><ESC> :nohlsearch<CR><ESC> " ESC連打でハイライト解除

" Misc
set ttyfast  " 高速ターミナル接続を行う(スクロールが重くなる対策)
set backspace=indent,eol,start  " Fix backspace indent
" https://stackoverflow.com/questions/774560/
" in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"******************************************************************************
" FUNCTIONS
"******************************************************************************

set nocompatible  " to vi
syntax enable
filetype plugin on
autocmd! bufreadpost *.Rmd set syntax=off

" Fuzzy File Search with tab completion
set path+=**  " recursive search
set wildmenu



"******************************************************************************
" VISUAL SETTINGS
"******************************************************************************

" UI
" syntax on
colo pablo
set ruler
set number
" Syntax
set showmatch                   " 対応する括弧に一瞬カーソル飛ぶ
set matchtime=1                 " マッチしている括弧を表示するための時間を0.1秒単位で指定
" Line
set number                      " Turn on line numbers
set display+=lastline           " 画面最後の行をできる限り表示
set fileformats=unix,dos,mac    " 改行のコードを試す順番
set autoindent                  " 改行時に前の行のインデントを継続
set smartindent                 " 改行時に入力された行の末尾に合わせて次行のインデントを増減
set scrolloff=3
" Commands
set sc                          " Show commands
set bsdir=last                  " Go to last folder when browsing
set history=100                 " Keep X commands in history
set clipboard=unnamedplus
set gcr=a:blinkon0              " Disable the blinking cursor.
" Characters
set list                        " これがないと見えない...
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% " 不可視文字

" Status bar
set statusline=%f%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}
set display=lastline  " 長いテキストを省略せず最後まで表示
set laststatus=2  " 最下ウィンドウにステータス行を常に表示
set modelines=10 " Use modeline overrides
set title
set titleold="Terminal"
set titlestring=%F

" Other
set pumheight=10 " 補完メニューの高さ

"******************************************************************************
" MAPPING SETTINGS
"******************************************************************************
" スペースをLeaderとして使う
let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" 移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" replace : and ;
noremap ; :
noremap : ;

" 画面分割, タブページ
" https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
" 分割
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" 移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" 窓移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" タブ関連
nnoremap <Leader>t :tabedit<CR>
nnoremap tl gt
nnoremap th gT
"
" 数字のインクリメント、デクリメントへのマッピング
nnoremap + <C-a>
nnoremap - <C-x>

" 行末までのヤンクにする設定; DやCに合わせる
nnoremap Y y$
" https://stackoverflow.com/questions/17561706/vim-yank-does-not-seem-to-work
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" 参考資料
" https://www.youtube.com/watch?v=XA2WjJbmmoM
" https://itchyny.hatenablog.com/entry/2014/12/25/090000
" https://qiita.com/morikooooo/items/9fd41bcd8d1ce9170301
"
" 必要な機能(他にも色々とあるので調査.
" デフォルトの機能で使えるやつはデフォでいい)
"   * 関数の参照
"   * testの実施
"   * シンタックスハイライト
"   * 実行環境の選択と明示
" Python
" R
" Haskell
"
