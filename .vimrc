set nocompatible               " ensure 'nocompatible' since VIM behavior can vary
set autoread                   " auto read when a file is changed from the outside
set hidden                     " buffer is hidden when abandoned
set lazyredraw                 " don't redraw while executing macros (performance, airline bug)
set number                     " display line numbers
set cursorline                 " highlight current line (slow)
set ruler                      " always show current position
set noshowmode                 " disable Insert, Replace, and Visual mode message on last line
set ignorecase                 " case insensitive when searching
set smartcase                  " case sensitive when searching if caps are used
set hlsearch                   " highlight search results
set incsearch                  " start searching when characters are typed
set showmatch                  " show matching brackets when text indicator is over them
set matchtime=2                " how many tenths of a second to blink when matching brackets
set encoding=utf8              " standard encoding
set autoindent                 " copy indent from current line when starting new line
set smartindent                " do smart autoindenting when starting a new line
set nowrap                     " disable lines from being displayed on the next line if too long
set linebreak                  " wrap long lines at character in 'breakat'
set textwidth=0
set wrapmargin=0
set showcmd                    " shows input of an incomplete command
set ttimeoutlen=10             " wait time in milliseconds for a key code or mapped key sequence to complete
set wildmenu                   " command-line completion enhanced mode
set wildmode=list:longest,full " command-line completion events
set laststatus=2               " always display status line
set noerrorbells               " disable error bell beep
set novisualbell               " disable visual bell
set visualbell                 " disable bell in Windows Linux Subsystem
set t_vb=                      " visual bell effect to nothing
set backspace=2                " same as backspace=indent,eol,start (backspace over autoindent, line breaks, start of insert)
set splitbelow
set colorcolumn=80

" saftey
set history=500                " number of lines that are remembered
set undofile                   " save undo history to undo file
set undolevels=1000            " maximum number of changes that can be undone
set backup                     " make a backup before overwriting file
set directory=~/.vim/swap//    " swap file location
set undodir=~/.vim/undo//      " undo file location
set backupdir=~/.vim/backup//  " backup file location

" terminal specific
"set termguicolors              " uses highlight-guifg and highlight-guibg attributes in the terminal
set t_Co=256
set t_ut=                      " disable Background Color Erase by clearing terminal option

" tabs
set expandtab                  " use spaces instead of tabs
set smarttab                   " <TAB> key inserts indentation according to 'shiftwidth' at the beginning of the line
set tabstop=2                  " width of TAB character
set shiftwidth=2               " size of an indent
set softtabstop=2              " affects what happens when pressing <TAB> or <BS> keys

autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" filetype detection
filetype on                    " filetype detection
filetype plugin on             " load plugin files for specific file types
filetype indent on             " load indent file for specific file types
syntax enable                  " syntax highlighting

" use xclip for copy and paste
vmap <F5> :!xclip -f -sel clip<CR>
map <F6> :-1r !xclip -o -sel clip<CR>

" load plugins
call plug#begin('~/.vim/plugged')
    Plug 'mbbill/undotree'
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'
    Plug 'w0rp/ale'
    Plug 'Valloric/YouCompleteMe'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-ruby/vim-ruby'
    Plug 'tpope/vim-rails'
    Plug 'vim-python/python-syntax'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'zakj/vim-mourning'
call plug#end()

" plugin 'mbbill/undotree'
nnoremap <F7> :UndotreeToggle<CR>

" plugin 'scrooloose/nerdtree'
nnoremap <F8> :NERDTreeToggle<CR>
augroup nerdtree
    autocmd!
    autocmd StdinReadPre * let s:std_in = 1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
augroup END

" plugin 'majutsushi/tagbar'
" install ctags (https://github.com/universal-ctags/ctags.git)
nnoremap <F9> :TagbarToggle<CR>

" plugin 'w0rp/ale'
" pip install vint flake8
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:aireline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" plugin 'Valloric/YouCompleteMe'
" ~/.vim/plugged/YouCompleteMe/install.py
let g:ycm_autoclose_preview_window_after_completion = 1

" plugin 'vim-python/python-syntax'
let g:python_highlight_all = 1

" plugin 'vim-airline/vim-airline'
" install fonts for powerline symbols (https://github.com/ryanoasis/nerd-fonts.git)
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_powerline_fonts = 1

" plugin 'vim-airline/vim-airline-themes'
let g:airline_theme = 'monochrome'
