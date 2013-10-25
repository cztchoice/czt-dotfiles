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
    "Bundle 'Lokaltog/vim-easymotion'
    "Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    "Bundle 'tpope/vim-rails.git'
    " vim-scripts repos
    "Bundle 'L9'
    "Bundle 'FuzzyFinder'
    " non github repos
    "Bundle 'git://git.wincent.com/command-t.git'

    Bundle 'kien/ctrlp.vim'
    Bundle 'kana/vim-smartinput'
    "Bundle 'fholgado/minibufexpl.vim'
    " ...
    Bundle 'xolox/vim-misc'
    Bundle 'xolox/vim-easytags'
    Bundle 'majutsushi/tagbar'
    nmap <leader>tb :TagbarToggle<CR>

    "Bundle 'Lokaltog/powerline'
    "let g:Powerline_symbols = 'fancy'
    "let g:Powerline_cache_enabled = 1
    Bundle 'bling/vim-airline'
    let g:airline#extensions#tabline#enabled = 1

    "Bundle 'klen/python-mode'
    "Bundle 'ervandew/supertab'
    "Bundle 'c9s/bufexplorer'
    "Bundle 'mileszs/ack.vim'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'
    "Bundle 'tpope/vim-unimpaired'
    Bundle 'tpope/vim-markdown'
    Bundle 'tpope/vim-fugitive'
    nmap <leader>g :Ggrep
    " ,f for global git serach for word under the cursor (with highlight)
    nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
    " same in visual mode
    :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

    Bundle 'scrooloose/syntastic'
    "let g:syntastic_enable_signs=1
    "let g:syntastic_auto_loc_list=1
    "let g:syntastic_mode_map={'mode': 'passive'}
    "Bundle 'Shougo/vimproc'
    "Bundle 'Shougo/vimshell'
    Bundle 'Shougo/neocomplcache'
    Bundle 'Shougo/neosnippet'
    Bundle 'kshenoy/vim-signature'


    Bundle 'scrooloose/nerdcommenter'
    "Bundle 'vim-scripts/fcitx.vim'

    Bundle 'scrooloose/nerdtree'
    Bundle 'vim-scripts/sessionman.vim'
    "the next line is session auto save 
    set viminfo='100,<500,s10,h,!
    Bundle 'vim-scripts/a.vim'
    nmap <C-u> :NERDTreeToggle<CR>

    "Bundle 'mattn/webapi-vim'
    "Bundle 'mattn/googletasks-vim'
    Bundle 'vim-scripts/matchit.zip'
    "Bundle 'vim-scripts/YankRing.vim'
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
    "set cpoptions=aABceFsmq
    set cpoptions=aABceFsq
    "             ||||||||
    "             ||||||||+-- When joining lines, leave the cursor 
    "             |||||||      between joined lines
    "             |||||||
    "             ||||||
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
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    "set iskeyword+=_,$,@,%,# " none of these are word dividers 
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
    set tags=./tags,tags;
    let NERDTreeIgnore=['\.pyc$[[file]]', '\~$[[file]]']
" }"}

" Vim UI {"{
    let $LANG="en_US.utf-8"
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
    "set statusline=%<%F\ [%{&fenc}][%{&ff}]%=%l,%v\ %P
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
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!


    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
    set conceallevel=2 concealcursor=i
    endif

    " Enable snipMate compatibility feature.
    "let g:neosnippet#enable_snipmate_compatibility = 1

    " Tell Neosnippet about the other snippets
    "let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
    

    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

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
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    "Attentions: This make smartinput {} not work with <Enter>
    "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" }

" Mappings {"{

    " space / shift-space scroll in normal mode
    noremap <s-space> <C-b>
    noremap <space> <C-f>
    noremap <c-h> <C-w>h
    noremap <c-j> <C-w>j
    noremap <c-k> <C-w>k
    noremap <c-l> <C-w>l

    "Some exit shorcuts
    map <leader>qq  :q<Enter>
    map <leader>qa  :qa<Enter>
    map <leader>x   :x<Enter>
    map <leader>qa  :xa<Enter>
    map <leader>pp :CtrlP<Enter>
    map <leader>pb :CtrlPBuffer<Enter>
    map <leader>pl :PyLintAuto<Enter>
    "map <Leader>ps :ConqueTermSplit bash<Enter>
    nnoremap / /\v
    cnoremap %s/ %s/\v
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
    "Goto your last edit line when open a file
    if has("autocmd")
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    endif
    au BufRead,BufNewFile *.cuh            set filetype=cuda
    au BufRead,BufNewFile *.cuh            set tabstop=2
    au BufRead,BufNewFile *.graph          set syntax off
    "let g:LargeFile = 1024 * 1024 * 10
    "autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
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
