nnoremap <silent>gM :Gcommit --amend<CR>
nnoremap <silent>gb :Gblame<CR>
nnoremap <silent>gB :Gbrowse<CR>
nnoremap <silent>gm :Gcommit<CR>
let hooks = neobundle#get_hooks('vim-fugitive')
function! hooks.on_source(bundle)
  augroup MyGitCmd
    autocmd!
    autocmd FileType fugitiveblame vertical res 25
    autocmd FileType gitcommit,git-diff nnoremap <buffer>q :q<CR>
  augroup END

  let g:fugitive_git_executable = executable('hub') ? 'hub' : 'git'
endfunction
function! hooks.on_post_source(bundle)
  call fugitive#detect(expand('<amatch>:p'))
endfunction
command! FugitiveReload call fugitive#detect(expand('<amatch>:p'))
unlet hooks
