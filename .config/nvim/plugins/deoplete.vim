let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" tab補完
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
" enterで確定
inoremap <expr><CR>  pumvisible() ? deoplete#mappings#close_popup() : "<CR>"
