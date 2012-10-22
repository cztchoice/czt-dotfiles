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
    "Bundle 'tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'tpope/vim-rails.git'
    " vim-scripts repos
    "Bundle 'L9'
    "Bundle 'FuzzyFinder'
    " non github repos
    "Bundle 'git://git.wincent.com/command-t.git'

    Bundle 'kien/ctrlp.vim'
    "Bundle 'kana/vim-smartinput'
    Bundle 'Townk/vim-autoclose'
    Bundle 'carlobaldassi/ConqueTerm'
    "Bundle 'fholgado/minibufexpl.vim'
    " ...
    Bundle 'majutsushi/tagbar'
    nmap <leader>tb :TagbarToggle<CR>

    Bundle 'Lokaltog/vim-powerline'
    "let g:Powerline_symbols = 'fancy'
    let g:Powerline_cache_enabled = 1

    Bundle 'klen/python-mode'
    "Bundle 'ervandew/supertab'
    "Bundle 'c9s/bufexplorer'
    Bundle 'mileszs/ack.vim'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-markdown'
    Bundle 'tpope/vim-fugitive'
    nmap <leader>g :Ggrep
    " ,f for global git serach for word under the cursor (with highlight)
    nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
    " same in visual mode
    :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

    Bundle 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
    Bundle 'Shougo/neocomplcache'
    "Bundle 'kakkyz81/evervim'
    Bundle 'kshenoy/vim-signature'

    "Bundle 'msanders/snipmate.vim'
    Bundle 'Shougo/neocomplcache-snippets-complete'

    Bundle 'scrooloose/nerdcommenter'
    "Bundle 'vim-scripts/fcitx.vim'

    Bundle 'scrooloose/nerdtree'
    Bundle 'vim-scripts/sessionman.vim'
    nmap <C-u> :NERDTreeToggle<CR>

    "Bundle 'mattn/webapi-vim'
    "Bundle 'mattn/googletasks-vim'
    Bundle 'cztchoice/matchit'
    Bundle 'vim-scripts/YankRing.vim'
    Bundle 'sjl/gundo.vim'

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
    set vb
    set t_vb=
    autocmd GUIEnter * set visualbell t_vb=
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
    let NERDTreeIgnore=['\.pyc$[[file]]', '\~$[[file]]']
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
    set gdefault  " make the search with global default, If you want to replace only one, just add g
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
    set smarttab 
    set formatoptions=rq " Automatically insert comment leader on return, 
                            " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    "set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, 
                        " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces 
                        "should a tab be (see expandtab)
    set tabstop=4 " real tabs should be 8, and they will show with 
                    " set list on
    set wrap
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    let g:tagbar_autofocus = 1
    let g:tagbar_width = 30
    let g:pymode_folding = 0
    let g:pymode_lint = 0
    let NERDTreeWinSize = 30
" }"}

" Neocomplcache Settings {
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    "Comment the line behind because of the imcompat with vim-smartinput plugin
    "inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
    "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }

" Mappings {"{

    " space / shift-space scroll in normal mode
    noremap <s-space> <C-b>
    noremap <space> <C-f>
    noremap <c-h> <C-w>h
    noremap <c-j> <C-w>j
    noremap <c-k> <C-w>k
    noremap <c-l> <C-w>l
    noremap <c-q> <C-w>q
    map <leader>pb :CtrlPBuffer<Enter>
    map <leader>pl :PyLintAuto<Enter>
    map <Leader>ps :ConqueTermSplit bash<Enter>
    nnoremap / /\v
    cnoremap %s/ %s/\v
    nnoremap <tab> %
    vnoremap <tab> %
    "press <F2> before you paste! You will find it most useful!!
    set pastetoggle=<F2>
    "Select the text you paste right before
    nnoremap <leader>v V`]
    "Open a right split window and switch to it
    nnoremap <leader>w <C-w>v<C-w>l
    "YankRing Mappings
    nnoremap <silent> <F3> :YRShow<cr>
    inoremap <silent> <F3> <ESC>:YRShow<cr>

    "Gundo Mappings
    nnoremap <F5> :GundoToggle<CR>
    "inoremap <C-P> <Home>
    "inoremap <C-E> <End>
    "map <C-Q> <C-W>q
" }"}
" AutoCommands {
    au FocusLost * :wa
" }

" GUI Settings {"{
if has("gui_running")
    " Basics {
        colorscheme evening " my color scheme (only works in GUI)
        set columns=120 " perfect size for me
        if has('win32')
            set guifont=Consolas:h12 " My favorite font
        else
            set guifont=Monospace\ 12
        endif
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
        set visualbell
        set t_vb=
    " }
    " Pyflakes {
        "highlight SpellBad term=underline gui=undercurl guisp=Orange
    " }

endif
" }"}
