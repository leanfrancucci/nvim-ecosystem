" Key binding for Neovim out of the box.
"
" @author Leandro Francucci

" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" clear search results
nnoremap <silent> // :noh<CR>

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash 

" Quickfix navigation
nnoremap + :cnext<CR> :norm! zz<CR> :copen<CR>
nnoremap - :cprev<CR> :norm! zz<CR> :copen<CR>
