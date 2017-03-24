"" Vim Setting File
"
" @author m-ogawa
" @update 2014/11
"
""

"----------
" Base
"----------
" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible
" encoding
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
" UTF-8の□や○でカーソル位置がずれないようにす
if exists('&ambiwidth')
    set ambiwidth=double
endif
" 改行コードの指定
set fileformats=unix,dos,mac
let ff_table = {'dos' : 'CR+LF', 'unix' : 'LF', 'mac' : 'CR' }
" ビジュアルベルの無効化
set vb t_vb=
" pluginの設定ファイル読み込み
set rtp+=$HOME/.dotfiles/
runtime! .vim.d/*.vim


"----------
" File
"----------
" 更新時自動再読み込み
set autoread
" バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
set confirm
" 編集中でも他のファイルを開けるようにする
set hidden
" スワップファイルを作らない
set noswapfile
" バックアップを取らない
set nobackup
" リードオンリーにしない
set noreadonly
" undo履歴ファイルを作る (7.4~
set undofile
set undodir=$HOME/.vimundo
set viminfo+=n$HOME/.viminfo/.viminfo
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペース2つに変換する
" autocmd BufWritePre * :%s/\t/  /ge

"----------
" indent
"----------
" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent
" ファイル内の &lt;Tab&gt; が対応する空白の数
set tabstop=4
" tabstopを変えずに空白を含めることにより、見た目のtabstopを変える
set softtabstop=4
" 自動インデントの各段階に使われる空白の数
set shiftwidth=4
" Insertモードで: &lt;Tab&gt; を挿入するのに、適切な数の空白を使う
set expandtab
" バックスペースで特殊記号も削除可能に
set backspace=indent,eol,start

"----------
" search
"----------
" 検索履歴
set history=1000
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が混在しているときは区別する
set ignorecase
set smartcase
" 検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set wrapscan
" インクリメンタルサーチ
set incsearch
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch
" <C-N>で検索後の強調表示を解除する
nnoremap <silent> <C-N> :nohlsearch <CR>

"----------
" display
"----------
" ウィンドウのタイトルを変更する設定
set title
" 行番号を表示しない
set nonumber
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" タブ文字、行末など不可視文字を表示しない
set nolist
" タイプ途中のコマンドを画面最下行に表示
set showcmd
" 現在のモードを表示
set showmode
" ステータスラインを常に表示する
set laststatus=2
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" matchpairsで指定したペアのマッチを表示する時間
set matchtime=2
" 行番号の表示
set number
" カーソル行に下線
set cursorline
" 補完候補を表示する
set wildmenu

"----------
" 不可視文字
"----------
" 不可視文字を表示
"set list
" 不可視文字の表示方法
"set listchars=tab:>\
hi ZenkakuSpace guibg=DarkBlue gui=underline ctermfg=LightBlue cterm=underline
" 全角文字
match ZenkakuSpace /　/

"----------
" status line
"----------
" ステータスラインのハイライト
" normal mode: blue
" insert mode: yellow
hi StatusLine ctermfg=White ctermbg=Blue cterm=none
au InsertEnter * hi StatusLine ctermfg=Black ctermbg=yellow cterm=none
au InsertLeave * hi StatusLine ctermfg=White ctermbg=Blue cterm=none
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"set statusline=%F:\ \ %{GetFunc()}%=%l/%L%11p%%
" syntax check
"autocmd BufEnter,BufWritePost * call ErrorCheckStatusline()


"----------
" filetype
"----------
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType tf         setlocal sw=2 sts=2 ts=2 et
endif


"----------
" mapping
"----------
" Ctrl+cでnormal modeへ(デフォルトでもなるけどInsertLeaveにならないため)
inoremap <C-c> <Esc>
