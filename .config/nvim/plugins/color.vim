"plugin
"solarized dark
"
"
" 256color
set t_Co=256
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_contrast = "high""
colorscheme solarized
