"pip2 install --user --upgrade neovim
if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Perhaps moll/vim-node if relative paths in node are broken
" And look into vim-anzu to supplement denite
call plug#begin('~/.config/nvim/bundle')
"Next to add:
"Plug 'craigemery/vim-autotag'
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/neoinclude.vim' " Add with jsctags (ramitos/jsctags)
Plug 'sheerun/vim-polyglot', { 'do': './build' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Requires tern, currently global added via yarn
if executable('tern')
  Plug 'carlitux/deoplete-ternjs'
endif
"Plug 'junegunn/fzf.vim'
call plug#end()
filetype plugin indent on

set showmatch "shows matching brace on completion
set matchtime=2 "speeds up showing matching brace
set showcmd "show incomplete commands
set scrolloff=5 "keep 5 lines between edge of editor and cursor

" set cul "highlight current line
set ruler "show cursor coords in status bar

" show relative line numbers and set number column width
set number
set relativenumber
set numberwidth=5

set shiftround "indents to nearest tabstop
" spaces...
set ts=2 sts=2 sw=2 expandtab
" even though tabs are better =(
"set ts=2 sts=2 sw=2 noexpandtab

" display whitespace
set list listchars=precedes:<,extends:>,tab:\|\ ,trail:·,nbsp:·

" allow buffer switch w/o saving
set hidden

" keep them undos
set undodir=~/.config/nvim/undodir
set undofile

" change default split direction
set splitbelow
set splitright

" ignore case unless capitalized
set ignorecase smartcase

" Do not wrap long lines, move 7 characters on edge of screen
set nowrap
set sidescroll=7

" stop at 80 char
set textwidth=80
set colorcolumn=+1

"colorscheme nofrils-dark
colorscheme onedark
let g:airline_theme='raven'

let g:autotagTagsFile="./.git/tags"

let g:deoplete#enable_at_startup=1
let g:deoplete#tag#cache_limit_size=50000000
let g:deoplete#skip_chars = ['(', ')']

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

let g:tern_request_timeout=1
"let g:tern_show_signature_in_pum='0'
let g:tern#filetypes=[
      \ 'jsx',
      \ 'javascript.jsx'
      \ ]

source ~/.config/nvim/startup/project_locals.vim
source ~/.config/nvim/startup/lint_setups.vim
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/vim_to_tmux.vim
source ~/.config/nvim/startup/denite.vim
source ~/.config/nvim/startup/leader_mappings.vim
