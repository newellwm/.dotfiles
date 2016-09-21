set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"dein plugin manager config
set runtimepath+=/Users/nyxnaut/.config/nvim/repos/github.com/Shougo/dein.vim
call dein#begin('/Users/nyxnaut/.config/nvim/')
call dein#add('Shougo/unite.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('robertmeta/nofrils')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('neomake/neomake')
call dein#end()
filetype plugin indent on

"Install missing plugins on startup
if dein#check_install()
	call dein#install()
endif

set showmatch "shows matching brace on completion
set matchtime=3 "speeds up showing matching brace
set showcmd "show incomplete commands
set scrolloff=5 "keep 5 lines between edge of editor and cursor

"set cul "highlight current line
set ruler "show cursor coords in status bar

"show relative line numbers and set number column width
set number
set relativenumber
set numberwidth=5
set shiftround "indents to nearest tabstop

"spaces...
"set ts=2 sts=2 sw=2 expandtab
"but tabs are better =)
set ts=2 sts=2 sw=2 noexpandtab

"display whitespace
set list listchars=tab:\|\ ,trail:·,nbsp:·

"allow buffer switch w/o saving
set hidden

"change default split direction
set splitbelow
set splitright

"stop at 80 char
set nowrap
set textwidth=80
set colorcolumn=+1

set background=dark
colorscheme nofrils-dark
"colorscheme solarized
let g:airline_theme='raven'

" Run NeoMake on read and write operations
"autocmd! BufReadPost,BufWritePost * Neomake
"let g:neomake_javascript_xo_maker = {}
"let g:neomake_javascript_enabled_makers = ['xo']

source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/vim_to_tmux.vim
source ~/.config/nvim/startup/unite.vim
