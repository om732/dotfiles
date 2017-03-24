" plugin
" NeoBundle
" -------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"" use plugins
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
    \ },
\ }
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'QuickBuf'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kana/vim-smartinput'
NeoBundle "cohama/vim-smartinput-endwise"
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'git://github.com/kmnk/vim-unite-giti.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'hashivim/vim-terraform'


call neobundle#end()
call smartinput_endwise#define_default_rules()

filetype plugin indent on

NeoBundleCheck
