"pip2 install --user --upgrade neovim
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/unite.vim'
Plug 'sheerun/vim-polyglot', { 'do': './build' }
Plug 'robertmeta/nofrils'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'joshdick/onedark.vim', { 'dir': '~/.config/nvim/colors' }
Plug 'neomake/neomake'
Plug 'lambdatoast/elm.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()
filetype plugin indent on

set showmatch "shows matching brace on completion
set matchtime=2 "speeds up showing matching brace
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

"keep them undos
set undodir=~/.config/nvim/undodir
set undofile

"change default split direction
set splitbelow
set splitright

"ignore case unless capitalized
set ignorecase smartcase

"stop at 80 char
set nowrap
set textwidth=80
set colorcolumn=+1

"colorscheme nofrils-dark
colorscheme onedark
let g:airline_theme='raven'

" Run NeoMake on read and write operations
" I have no idea what most of this does. winner!
autocmd! BufReadPost,BufWritePost * Neomake
"auto open linter list on save
let g:neomake_open_list=2
"run one make checker at a time
"let g:neomake_serialize = 1
let g:neomake_javascript_enabled_makers = ['xo']
let g:neomake_c_enabled_makers = ['gcc']
"https://github.com/neovim/neovim/issues/2048 for info on these
"commands. Run in terminal if ctrl+h isn't working for mac term (& arch?)
"infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
"tic $TERM.ti
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/vim_to_tmux.vim
source ~/.config/nvim/startup/unite.vim
source ~/.config/nvim/startup/leader_mappings.vim
