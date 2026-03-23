" Configuration for notify.
"
" @author Leandro Francucci
"
lua << EOF
require('noice').setup({
  views = {
    popupmenu = {
      size = {
        max_height = 24,
      },
    },
  },
})
EOF
