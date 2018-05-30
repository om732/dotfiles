" plugin
" ale
" -------------------
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" 左のバーの表示/非表示を切り替える (1: 常に表示 2: error/warningのみ)
let g:ale_sign_column_always = 0
" ファイルオープン時のチェックの有効化 (1:有効化 2: 無効化)
let g:ale_lint_on_enter = 0
" errorとwarningが出たら常にウィンドウを開いておく
let g:ale_open_list = 1
" errorとwarningがなくなったら閉じる
let g:ale_keep_list_window_open = 0
" for go
let g:ale_linters = {
  \'go': ['gometalinter'],
  \}
let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'
