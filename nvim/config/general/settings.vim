" General settings for Neovim out of the box.
"
" @author Leandro Francucci

" Enable syntax highlighting
syntax enable

" Keep multiple buffers open
"set hidden

" Long lines not wrapped
set nowrap

" Default encoding
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix

" Smaller pop up menu
"set pumheight=10

" Show cursor position all the time
"set ruler

" More space for messages
"set cmdheight=2

" Treat dash separated words as a word text object
"set iskeyword+=-

" Enable mouse
"set mouse=a

" 256 colors support
"set t_Co=256

" Enables 24-bit RGB color
set termguicolors

" More visible '`' character
set conceallevel=0

" Spaces for TAB
set tabstop=4

" Spaces for indention
set shiftwidth=4

" Smart TAB's
set smarttab

" Convert TAB's to Spaces
set expandtab

" Smart indents
set smartindent

" Support auto indent
set autoindent

" Status line
set laststatus=0

" Line numbers
set number relativenumber

" Highlight current line
set cursorline

" Smooth scroll
set so=999

" Max line length
"set colorcolumn=120

" Background color
"set background=dark

" Transparent background
"autocmd VimEnter * hi Normal ctermbg=none

" Disable backup
set nobackup
set nowritebackup

" Faster completion
set updatetime=250

" Short timeout
set timeoutlen=500

" Stop new line comment continuation
set formatoptions-=cro 

" Shared clipboard
set clipboard=unnamedplus

" Spell check
"set spell spelllang=en_us

" Auto source while writing to init.vim
au! BufWritePost $MYVIMRC source %      

" save as sudo
ca w!! w !sudo tee %

" Grep
set grepprg=rg\ --vimgrep\ --no-heading\ --hidden\ --smart-case\ --no-ignore-vcs

" Remove ugly vertical lines on window division
set fillchars+=vert:\ 

" When scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" Autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=full
set wildmenu

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" init.lua
lua require('init')
