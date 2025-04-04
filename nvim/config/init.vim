" Neovim initialization file.
"
" @author Maciej Bedra

" Configuration for Neovim out of the box
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/keys.vim

" Neovim extensions
call plug#begin('~/.config/nvim/plugins')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-telescope/telescope-fzf-native.nvim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'ap/vim-css-color'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'puremourning/vimspector'
  " Code commenter
  Plug 'scrooloose/nerdcommenter'
  " A couple of nice colorschemes
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'rafi/awesome-vim-colorschemes'
  " Pending tasks list
  Plug 'fisadev/FixedTaskList.vim'
  " Window chooser
  Plug 't9md/vim-choosewin'
  " Git/mercurial/others diff icons on the side of the file lines
  Plug 'mhinz/vim-signify'
  " Insert or delete brackets, parens, quotes in pair.
  Plug 'jiangmiao/auto-pairs'
  " Bookmarks
  Plug 'MattesGroeger/vim-bookmarks'
  " The generic way to handle building/running/testing/deploying tasks
  Plug 'skywind3000/asynctasks.vim'
  Plug 'skywind3000/asyncrun.vim'
  " Syntax highlighting for logs files
  Plug 'MTDL9/vim-log-highlighting'
  " Notifier
  Plug 'rcarriga/nvim-notify'
  " Code snippets
  Plug 'honza/vim-snippets'
  " Clang command extensions
  Plug 'p00f/clangd_extensions.nvim'
  " ?
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Dashboard
  Plug 'nvimdev/dashboard-nvim'
  " Indent
  "Plug 'lukas-reineke/indent-blankline.nvim'
  " AI
  Plug 'olimorris/codecompanion.nvim', { 'branch': 'master' }  
  " Improve markdown viewing
  Plug 'MeanderingProgrammer/render-markdown.nvim'
  " Highlight and search for todo comments
  Plug 'folke/todo-comments.nvim'
  "Single tabpage interface for easily cycling through diffs for all modified 
  "files for any git rev.
  Plug 'sindrets/diffview.nvim'
  "Remember your Neovim keymaps
  Plug 'folke/which-key.nvim'
  "Completely replaces the UI for messages, cmdline and the popupmenu
  Plug 'folke/noice.nvim'
  Plug 'MunifTanjim/nui.nvim'
  "Convert a piece of text to an indicated string case
  Plug 'johmsalas/text-case.nvim'
  "Intelligent prioritization when selecting files 
  Plug 'nvim-telescope/telescope-frecency.nvim'
  "Windows manager
  Plug 'anuvyklack/windows.nvim'
  Plug 'anuvyklack/middleclass'
  Plug 'anuvyklack/animation.nvim'
call plug#end()

" Extensions configuration
source ~/.config/nvim/airline/airline.vim
source ~/.config/nvim/nerdtree/nerdtree.vim
source ~/.config/nvim/nerdtree/nerdtree-git.vim
source ~/.config/nvim/telescope/telescope.vim
source ~/.config/nvim/fzf/fzf.vim
source ~/.config/nvim/git/fugitive.vim
source ~/.config/nvim/git/fzf-checkout.vim
source ~/.config/nvim/treesitter/treesitter.vim
source ~/.config/nvim/vimspector/vimspector.vim
source ~/.config/nvim/nerdcommenter/nerdcommenter.vim
source ~/.config/nvim/fixedtasklist/fixedtasklist.vim
source ~/.config/nvim/choosewin/choosewin.vim
source ~/.config/nvim/signify/signify.vim
source ~/.config/nvim/autopairs/autopairs.vim
source ~/.config/nvim/bookmarks/bookmarks.vim
source ~/.config/nvim/asynctasks/asynctasks.vim
source ~/.config/nvim/log-highlighting/log-highlighting.vim
source ~/.config/nvim/notify/notify.vim
source ~/.config/nvim/snippets/snippets.vim
source ~/.config/nvim/dashboard/dashboard.lua
source ~/.config/nvim/colorschemes/colorschemes.vim
source ~/.config/nvim/codecompanion/codecompanion.vim
source ~/.config/nvim/render-markdown/render-markdown.vim
source ~/.config/nvim/coc/coc.vim
source ~/.config/nvim/coc/extensions.vim
source ~/.config/nvim/todo-comments/todo-comments.vim
source ~/.config/nvim/diffview/diffview.vim
source ~/.config/nvim/which-key/which-key.vim
source ~/.config/nvim/noice/noice.vim
source ~/.config/nvim/testcase/testcase.vim
source ~/.config/nvim/frecency/frecency.vim
source ~/.config/nvim/windows/windows.vim
