"pip2 install --user --upgrade neovim
if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Perhaps moll/vim-node if relative paths in node are broken
" And look into vim-anzu to supplement denite
"Next to add:
"Plug 'craigemery/vim-autotag'
"Plug 'tpope/vim-fugitive'
"Plug 'Shougo/neoinclude.vim' " Add with jsctags (ramitos/jsctags)
call plug#begin('~/.config/nvim/bundle')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot', { 'do': './build' }
Plug 'itchyny/lightline.vim'
Plug 'neomake/neomake'
Plug 'kovisoft/slimv'
"Plug 'vim-scripts/Limp', { 'for': 'lisp' }
"requires tern, currently global added via yarn
if executable('tern')
  Plug 'carlitux/deoplete-ternjs'
endif
call plug#end()

filetype plugin indent on
set undodir=~/.config/nvim/undodir "set directory to save undos between sessions

set undofile                 "enable persistent undos
set ts=2 sts=2 sw=2          "set all tabbing to 2 spaces
set expandtab                "tab with spaces, even though tabs are better
set showmatch                "display matching brace on completion
set matchtime=2              "speed up display of matching brace
set showcmd                  "display incomplete commands
set scrolloff=5              "keep 5 lines between edge of editor and cursor
set sidescroll=7             "move 8 characters at screen edge
set nowrap                   "prevent line wrapping
"set cul                     "highlight current line
set ruler                    "show cursor coords in status bar
set number                   "show line numbers
set relativenumber           "make line numbers relative to cursor
set numberwidth=5            "width of line number column
set shiftround               "indents to nearest tabstop
set hidden                   "allow buffer swap without saving
set splitbelow               "change direction of default split
set splitright               "change direction of default vsplit
set ignorecase smartcase     "ignore case unless capitalized
set tw=80                    "stop at the 80th character
set colorcolumn=+1           "put a colored column at 81
set list listchars=precedes:<,extends:>,tab:\|\ ,trail:·,nbsp:· "whitespace
if !isdirectory($HOME."/.config/nvim/undodir")
  call mkdir($HOME."/.config/nvim/undodir", "", 0770)
endif

"create two commands to switch indentation from spaces to tabs
:command! -range=% -nargs=0 T2S execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 S2T execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts .')'

source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/plugin-configs.vim
"source ~/.config/nvim/startup/project-locals.vim
"source ~/.config/nvim/startup/lint-setups.vim
