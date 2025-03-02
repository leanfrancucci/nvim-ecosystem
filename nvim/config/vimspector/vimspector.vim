" Configuration for Neovim debugger.
"
" @author Maciej Bedra

" Enable HUMAN key bindings for debugging.
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nnoremap <leader>dT :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nmap <leader>ds <Plug>VimspectorStop
nmap <leader>dk <Plug>VimspectorRestart
nmap <leader>dp <Plug>VimspectorPause
nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dr <Plug>VimspectorRunToCursor
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dh <Plug>VimspectorStepOut
nmap <leader>di <Plug>VimspectorBalloonEval
xmap <leader>db <Plug>VimspectorBreakpoints
xmap <leader>df <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>do <Plug>VimspectorToggleConditionalBreakpoint
