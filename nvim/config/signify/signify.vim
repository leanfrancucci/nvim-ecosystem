" Configuration for vim-signify.
"
" @author Leandro Francucci

" This first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']

" Open a new tab with two windows using |diff-mode| to show the differences
" between the current file and its version that was last checked in.
nmap <leader>sd :SignifyDiff<CR>

" Used on a line with a change, this will show a diff of the hunk in a floating
" window
nmap <leader>sh :SignifyHunkDiff<CR>

"Used on a line with a change, this will restore the hunk to the base version.
nmap <leader>su :SignifyHunkUndo<CR>

" Jump to the next hunk.
nmap <leader>sn <plug>(signify-next-hunk)

" Jump to the previous hunk.
nmap <leader>sp <plug>(signify-prev-hunk)

" Jump to the last hunk.
nmap <leader>sJ 9999<leader>sn
nmap <leader>sP 9999<leader>sp

" Nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
