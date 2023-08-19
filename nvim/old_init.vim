" Should install
" https://github.com/sharkdp/fd
" https://github.com/BurntSushi/ripgrep
" https://github.com/universal-ctags/ctags
" https://github.com/junegunn/fzf


call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'kylechui/nvim-surround'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'mhartington/formatter.nvim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nvim-lualine/lualine.nvim'
Plug 'chomosuke/term-edit.nvim'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'samjwill/nvim-unception'

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
Plug 'phha/zenburn.nvim'
Plug 'Mofiqul/vscode.nvim'
call plug#end()

set background=light
colorscheme hybrid

if has('termguicolors')
    set termguicolors
endif

set nocompatible            " disable compatibility to old-time vi
" set showmatch             " show matching
set ignorecase              " case insensitive
"set hlsearch               " highlight search
set nohlsearch
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=120                " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=                  " disable mouse click
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile              " disable creating swap file
set clipboard=
set fillchars=eob:\ ,fold:\ ,vert:\│ " remove unnecessary tildas at empty lines
let &scrolloff = 5
set showtabline=0
set relativenumber
" let g:clang_format#command="ya tool clang-format"

" set backupdir=~/.cache/vim " Directory to store backup files.
"

let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root=['.clang-tidy']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*sites/*/files/*',
      \ 'node_modules',
      \ 'bower_components',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ 'frontend',
      \ 'analytics',
      \ ]
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

au TextYankPost * silent! lua vim.highlight.on_yank()
autocmd TermOpen * setlocal nonumber norelativenumber
