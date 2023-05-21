if has('termguicolors')
    set termguicolors
endif

set nocompatible            " disable compatibility to old-time vi
" set showmatch               " show matching
set ignorecase              " case insensitive
"set hlsearch                " highlight search
set nohlsearch
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=120                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=                  " disable mouse click
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set clipboard=
set fillchars=eob:\ ,fold:\ ,vert:\│ " remove unnecessary tildas at empty lines
let &scrolloff = 5

" set backupdir=~/.cache/vim " Directory to store backup files.


au TextYankPost * silent! lua vim.highlight.on_yank()
autocmd TermOpen * setlocal nonumber norelativenumber


" Should install
" https://github.com/sharkdp/fd
" https://github.com/BurntSushi/ripgrep


call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kylechui/nvim-surround'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'mhartington/formatter.nvim'
Plug 'alvarosevilla95/luatab.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

Plug 'sainnhe/everforest'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rebelot/kanagawa.nvim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'olimorris/onedarkpro.nvim'
Plug 'kkga/vim-envy'
Plug 'savq/melange-nvim'
Plug 'w0ng/vim-hybrid'
Plug 'Alexis12119/nightly.nvim'
Plug 'echasnovski/mini.base16'
Plug 'nelstrom/vim-mac-classic-theme'
Plug 'yorickpeterse/vim-paper'
Plug 'chomosuke/term-edit.nvim', {'tag': 'v1.*'}
call plug#end()

set background=light
colorscheme hybrid
