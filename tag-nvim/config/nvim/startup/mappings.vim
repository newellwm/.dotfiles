let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>

nnoremap <CR> :noh<CR>

no <left> <Nop>
no <right> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

imap jj <Esc>
noremap : ;
noremap ; :
noremap q! Q

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"fixes ctrl u undo in insert mode
inoremap <c-u> <c-g>u<c-u>

"Enable screen scrolling with 'showmatch'
"NOTE: Honestly don't remember what this does
"inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
