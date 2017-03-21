"""""""""""""""""""""""""""
"          COLOR          "
"""""""""""""""""""""""""""

"colorscheme nofrils-dark
"set background=dark
colorscheme onedark

"""""""""""""""""""""""""""
"        COMPLETION       "
"""""""""""""""""""""""""""

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

let g:autotagTagsFile="./.git/tags"
let g:deoplete#enable_at_startup=1
let g:deoplete#tag#cache_limit_size=50000000
let g:deoplete#skip_chars = ['(', ')']


let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:tern_request_timeout=1
"let g:tern_show_signature_in_pum='0'
let g:tern#filetypes=[
  \ 'jsx',
  \ 'javascript.jsx'
  \ ]

let g:slimv_swank_cmd =
  \ '!sbcl --load ~/code/lsp/start-swank.lisp &'

