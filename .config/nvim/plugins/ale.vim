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

let g:ale_linters = {
  \'go': ['gometalinter'],
  \'python': ['flake8'],
  \}

let g:ale_fixers = {
  \'python': ['autopep8', 'black', 'isort'],
  \}

" for go
let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'

" for python
" 各ツールをFixerとして登録

" 各ツールの実行オプションを変更してPythonパスを固定
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'

let g:ale_fix_on_save = 1
