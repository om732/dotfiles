" plugin
" unite
" -------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" buffer limit
let g:unite_source_file_mru_limit = 200
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-L> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" .で始まるファイルを表示する
call unite#custom#source('file', 'matchers', "matcher_default")
" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" vim-unite-giti
"nnoremap <silent>gl :Unite giti/log -no-start-insert -horizontal<CR>
"nnoremap <silent>gP :Unite giti/pull_request/base -no-start-insert -horizontal<CR>
"nnoremap <silent>gs :Unite giti/status -no-start-insert -horizontal<CR>
"nnoremap <silent>gh :Unite giti/branch_all -no-start-insert<CR>
