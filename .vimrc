" Bundle {
    set nocompatible               " be iMproved
    filetype off                   " required!

    let mapleader = ","
    let g:mapleader = ","
    map ; :

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    " My Bundles here:
    "
    " original repos on github
    Bundle 'tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'tpope/vim-rails.git'
    " vim-scripts repos
    "Bundle 'L9'
    "Bundle 'FuzzyFinder'
    " non github repos
    "Bundle 'git://git.wincent.com/command-t.git'

    Bundle 'kien/ctrlp.vim'
    Bundle 'fholgado/minibufexpl.vim'
    " ...
    Bundle 'majutsushi/tagbar'
    nmap <leader>tb :TagbarToggle<CR>

    Bundle 'Lokaltog/vim-powerline'
    "let g:Powerline_symbols = 'fancy'
    let g:Powerline_cache_enabled = 1

    "Bundle 'c9s/bufexplorer'

    "Bundle 'tpope/vim-fugitive'
    "nmap <leader>g :Ggrep
    " ,f for global git serach for word under the cursor (with highlight)
    "nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
    " same in visual mode
    ":vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

    Bundle 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1

    Bundle 'msanders/snipmate.vim'

    Bundle 'scrooloose/nerdcommenter'

    Bundle 'tpope/vim-markdown'

    Bundle 'scrooloose/nerdtree'
    nmap <C-u> :NERDTreeToggle<CR>

    filetype plugin indent on     " required!
    "
    " Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Bundle command are not allowed..
" }

" Modeline and Notes {"{

" }"}

" Basics {"{
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark " we plan to use a dark background
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor 
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch) 
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the 
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line 
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match 
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
    " 重启后撤销历史可用 persistent undo 
    set undofile
    set undodir=~/.vim/tmp/undo// " undo files
    set backupdir=~/.vim/tmp/backup// " backups
    set directory=~/.vim/tmp/swap// " swap files
    set backup
    set noswapfile 
    set undolevels=1000 "maximum number of changes that can be undone
" }"}


" General {"{
    filetype plugin indent on " load filetype plugins/indent settings
    set autochdir " always switch to the current file directory 
    set autoread  "Set to auto read when a file is changed from the outside
    set backspace=indent,eol,start " make backspace a more flexible
    " set backup " make backup files
    " set backupdir=~/.vim/backup " where to put backup files
    set clipboard+=unnamed " share windows clipboard
    " set directory=~/.vim/tmp " directory to place swap files in
    set encoding=utf-8
    set fileencodings=utf-8,cp936 " support all three, in this order
    set fileformats=dos,unix,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers 
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildignore+=.svn,CVS,.git,.hg,*.a,*.class,*.mo,*.la,*.so,*.swp,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
    set wildmode=list:longest " turn on wild mode huge list
" }"}

" Vim UI {"{
    let $LANG="zh_CN.utf-8"
    "set cursorcolumn " highlight the current column
    "set cursorl>ine " highlight current line
    set incsearch " BUT do highlight as you type you 
                   " search phrase
    set langmenu=zh_CN.utf-8
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines 
                     " betweens rows
    set list " we do what to show tabs, to ensure we get them 
              " out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing 
    set matchtime=5 " how many tenths of a second to blink 
                     " matching brackets for
    set nohlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 9999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%<%F\ [%{&fenc}][%{&ff}]%=%l,%v\ %P
    "                |     |         |       |  |   |
    "                |     |         |       |  |   + percentage
    "                |     |         |       |  + current column
    "                |     |         |       +-- current line
    "                |     |         +-- current fileformat
    "                |     +-- current fileencoding
    "                +-- full path to file in the buffer
" }"}

" Text Formatting/Layout {"{
    "set completeopt= " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, 
                          " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, 
                      " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces 
                       "should a tab be (see expandtab)
    set tabstop=4 " real tabs should be 8, and they will show with 
                   " set list on
    set wrap
" }"}

" Mappings {"{

    " space / shift-space scroll in normal mode
    noremap <s-space> <C-b>
    noremap <space> <C-f>
    nnoremap / /\v
    cnoremap %s/ %s/\v

" }"}

" GUI Settings {"{
if has("gui_running")
    " Basics {
        colorscheme evening " my color scheme (only works in GUI)
        set columns=120 " perfect size for me
        set guifont=LiberationMono-Regular-Powerline\ 12 " My favorite font
        set guioptions=ce
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set lines=35 " perfect size for me
        set mousehide " hide the mouse cursor when typing
        " 下面5行用来解决gVim菜单栏和右键菜单乱码问题  
        set encoding=utf8  
        set imcmdline  
        source $VIMRUNTIME/delmenu.vim  
        source $VIMRUNTIME/menu.vim  
        " 解决gVim中提示框乱码  
        language message zh_CN.UTF-8  
    " }
    " Pyflakes {
        highlight SpellBad term=underline gui=undercurl guisp=Orange
    " }

endif
" }"}
