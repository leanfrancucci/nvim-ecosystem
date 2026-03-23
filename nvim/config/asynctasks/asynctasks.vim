" Configuration for asynctasks.
"
" @author Leandro Francucci

" Above zero to open quickfix window at given height after command starts
let g:asyncrun_open = 6

" Close quickfix window if there is no errors
function MaybeScheduleQfClose()
  if empty(filter(getqflist(), 'v:val.valid'))
    call timer_start(2000, {-> execute('cclose')})
  endif
endfunction

let g:asyncrun_exit = 'call MaybeScheduleQfClose()'

