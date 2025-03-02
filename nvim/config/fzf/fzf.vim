" Configuration for fuzzy finder.
"
" @author Maciej Bedra

" Search result on top
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"

" Fuzzy finder as pop up
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }

" Launch fuzzy finder (text occurrence)
nmap ,p :Rg<CR>
" the same, but with the word under the cursor pre filled
nmap ,wp :execute ":Rg " . expand('<cword>')<CR>

" File finder mapping
nmap ,e :Files<CR>

" Tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>

" Tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>

" General code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>

" General code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>

" Commands finder mapping
nmap ,c :Commands<CR>
