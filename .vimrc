" Plugin {
    set nocompatible               " be iMproved
    filetype off                   " required!

    set rtp+=~/.vim/bundle/Vundle.vim
    set runtimepath+=~/.dotfiles
    call vundle#begin()

    " let Vundle manage Vundle
    " required! 
    Plugin 'gmarik/Vundle.vim'

    let mapleader = ","
    let g:mapleader = ","
    map ; :

    Plugin 'kien/ctrlp.vim'
    Plugin 'kana/vim-smartinput'
    "Plugin 'fholgado/minibufexpl.vim'
    " ...
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-easytags'
    let g:easytags_async=1
    Plugin 'xolox/vim-session'
    let g:session_autoload='no'
    Plugin 'majutsushi/tagbar'
    nmap <leader>tb :TagbarToggle<CR>

    Plugin 'linktohack/vim-space'
    let g:space_no_character_repeat_movements = 1

    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'bling/vim-airline'
    let g:airline#extensions#tabline#enabled = 1

    Plugin 'mileszs/ack.vim'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-markdown'
    Plugin 'tpope/vim-fugitive'
    nmap <leader>g :Ggrep
    " ,f for global git serach for word under the cursor (with highlight)
    nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
    " same in visual mode
    :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

    Plugin 'scrooloose/syntastic'
    "let g:syntastic_enable_signs=1
    "let g:syntastic_auto_loc_list=1
    "let g:syntastic_mode_map={'mode': 'passive'}
    Plugin 'Shougo/vimshell'
    
    Plugin 'xuhdev/SingleCompile'
    nmap <F5> :SCCompile<cr>
    nmap <F6> :SCCompileRun<cr>

    Plugin 'Valloric/YouCompleteMe'
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    " Track the engine.
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    let g:UltiSnipsSnippetsDir='~/.dotfiles/mysnippets'
    let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']

    Plugin 'kshenoy/vim-signature'

    Plugin 'scrooloose/nerdcommenter'

    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    "Plugin 'vim-scripts/sessionman.vim'
    "the next line is session auto save 
    set viminfo='100,<500,s10,h,!
    Plugin 'vim-scripts/a.vim'
    nmap <C-u> :NERDTreeTabsToggle<CR>
    nmap <leader>u :NERDTreeToggle<CR>
    let NERDTreeDirArrows = 0
    let NERDTreeWinSize = 18
    let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.d$']

    Plugin 'vim-scripts/matchit.zip'

    Plugin 'sjl/gundo.vim'
    nnoremap <F7> :GundoToggle<CR>

    call vundle#end()
    filetype plugin indent on     " required!
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

" }

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
    set undodir=~/.vim/tmp/undo/ " undo files
    set backupdir=~/.vim/tmp/backup/ " backups
    set directory=~/.vim/tmp/swap/ " swap files
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
                    \*.jpg,*.gif,*.png,tags,.tags
    set wildignore+=.svn,CVS,.git,.hg,*.a,*.class,*.mo,*.la,*.so,*.swp,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
    set wildmode=list:longest " turn on wild mode huge list
    set tags=./tags,tags,.tags;
" }"}

" Vim UI {"{
    let $LANG="en_US.utf-8"
    "set cursorcolumn " highlight the current column
    "set cursorl>ine " highlight current line
    set incsearch " BUT do highlight as you type you 
                   " search phrase
    "set langmenu=zh_CN.utf-8
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines 
                     " betweens rows
    "set list " we do what to show tabs, to ensure we get them 
              " out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing 
    
    set matchtime=5 " how many tenths of a second to blink 
                     " matching brackets for
    set nohlsearch " do not highlight searched for phrases
    set gdefault  " make the search with global default, If you want to replace only one, just add g
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set relativenumber
    set numberwidth=3 " We are good up to 9999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=5 " Keep 10 lines (top/bottom) for scope
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
" }"}
" Cscope Settings {
    if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help

    "command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
    endif
" }

" YCM and UltiSnips compatability {
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    function! g:UltiSnips_Complete()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
            if pumvisible()
                return "\<C-n>"
            else
                call UltiSnips#JumpForwards()
                if g:ulti_jump_forwards_res == 0
                    return "\<TAB>"
                endif
            endif
        endif
        return ""
    endfunction

    au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsListSnippets="<c-e>"
    let g:UltiSnipsExpandTrigger="<c-k>"
    " this mapping Enter key to <C-y> to chose the current highlight item 
    " and close the selection list, same as other IDEs.
    " CONFLICT with some plugins like tpope/Endwise
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }

" Mappings {"{

    " space / shift-space scroll in normal mode
    "noremap <s-space> <C-b>
    "noremap <space> <C-f>
    noremap <c-h> <C-w>h
    noremap <c-j> <C-w>j
    noremap <c-k> <C-w>k
    noremap <c-l> <C-w>l

    map <leader>pp :CtrlP<Enter>
    map <leader>pb :CtrlPBuffer<Enter>
    map <leader>pl :PyLintAuto<Enter>
    let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll|o|html)$',
      \ 'link': '',
    \ }
    "map <Leader>ps :ConqueTermSplit bash<Enter>
    nnoremap / /\v
    cnoremap %s/ %s/\v
    "press <F2> before you paste! You will find it most useful!!
    set pastetoggle=<F2>
    "Select the text you paste right before
    nnoremap <leader>v V`]
    "Open a right split window and switch to it
    nnoremap <leader>w <C-w>v<C-w>l

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
            set guifont=Consolas:h16 " My favorite font
        else
            "set guifont=Monospace\ 16
            "set guifont=Monaco18
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
        language message en_US.UTF-8  
        set visualbell
        set t_vb=
    " }
    " Pyflakes {
        "highlight SpellBad term=underline gui=undercurl guisp=Orange
    " }

endif
" }"}
