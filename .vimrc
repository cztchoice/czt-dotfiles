" Plugin {
filetype off                   " required!

set runtimepath+=~/.dotfiles

if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  set nocompatible
  call plug#begin('~/.vim/plugged')
endif

let mapleader = ","
let g:mapleader = ","
"let mapleader = "\<Space>"
map <space> <leader>
"map <space><space> <leader><leader>

map ; :
map q: :q

Plug 'altercation/vim-colors-solarized'

Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPTag', 'CtrlPtjump', 'CtrlPtjumpVisual']}
Plug 'ivalkeen/vim-ctrlp-tjump', {'on': ['CtrlPtjump', 'CtrlPtjumpVisual']}
" The following line doesn't work becuase I enable lazy loading of CtrlP
" let g:ctrlp_map = '<c-p>'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

Plug 'bling/vim-airline'
" let g:airline#extensions#tabline#enabled = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

Plug 'weynhamz/vim-plugin-minibufexpl'

" This plugin switches the input method to the default keyboard (usually English)
" when leaving insert mode and switches back when you enter insert mode again
Plug 'ybian/smartim'

Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'

Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
"let g:easytags_async=1
Plug 'cztchoice/taghighlight', {'on': 'UpdateTypesFile'}
" Plug 'ludovicchabant/vim-gutentags'
Plug 'xolox/vim-session'
let g:session_autoload='no'
let g:session_autosave = 'no'
Plug 'majutsushi/tagbar'

"Plug 'linktohack/vim-space'
"let g:space_no_character_repeat_movements = 1

Plug 'vim-scripts/gitignore'

Plug 'Yggdroot/indentLine'

Plug 'terryma/vim-multiple-cursors'

" Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
" Plug 'gabesoft/vim-ags'
if !executable('ag')
  " let g:ackprg = 'ag --vimgrep'
  let g:ackprg = 'ack'
endif
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
" nmap <leader>g :Ggrep
" " ,f for global git serach for word under the cursor (with highlight)
" nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" " same in visual mode
" :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>
"
Plug 'asins/vimcdoc'

Plug 'maxbrunsfeld/vim-yankstack'

Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
"let g:syntastic_enable_signs=1
"let g:syntastic_mode_map={'mode': 'passive'}

" Plug 'klen/python-mode'

" Plug 'xuhdev/SingleCompile', { 'on': ['SCCompile', 'SCCompileRun']}
" nmap <leader>sc :SCCompile<cr>
" nmap <leader>sr :SCCompileRun<cr>

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'leafgarland/typescript-vim'


 "Track the engine.
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"let g:UltiSnipsSnippetsDir='~/.dotfiles/mysnippets'
"let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'


"display marks
Plug 'kshenoy/vim-signature'

Plug 'scrooloose/nerdcommenter'
" Plug 'tomtom/tcomment_vim'

Plug 'vim-scripts/a.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'jistr/vim-nerdtree-tabs'
"nmap <C-u> :NERDTreeTabsToggle<CR>
let NERDTreeDirArrows = 0
let NERDTreeWinSize = 25
let NERDTreeRespectWildIgnore=1

Plug 'vim-scripts/matchit.zip'

" Plug 'sjl/gundo.vim', { 'on': 'GundoToggle'}
Plug 'simnalamburt/vim-mundo', {'on': 'GundoToggle'}

Plug 'rhysd/vim-clang-format', {'on': 'ClangFormat'}

call plug#end()

" All map {
" Leader map
nmap <leader>cp :CtrlP<cr>
nmap <leader>cb :CtrlPBuffer<cr>
nmap <leader>ct :CtrlPTag<cr>
nnoremap <leader>cj :CtrlPtjump<cr>
vnoremap <leader>cj :CtrlPtjumpVisual<cr>

nmap <leader>fz :FZF<cr>


nmap <leader>th :UpdateTypesFile<CR>

nmap <leader>tb :TagbarToggle<CR>

nnoremap <leader>gu :GundoToggle<CR>

" Ctrl map below
nmap <c-p> :CtrlP<cr>

nmap <C-u> :NERDTreeToggle<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l
" nnoremap <leader>h <C-w>h
" nnoremap <leader>j <C-w>j
" nnoremap <leader>k <C-w>k
" nnoremap <leader>l <C-w>l

""Select the text you paste right before
nnoremap <leader>v V`]
nnoremap Y y$

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" neosnippet Plugin key-mappings.
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
" }

" neovim terminal relate shortcut
if has('nvim')
  nnoremap <leader>vt :vnew<CR>:terminal<CR>
  tnoremap <Esc> <C-\><C-n>
  tnoremap <leader>h <C-\><C-n><C-w>h
  tnoremap <leader>j <C-\><C-n><C-w>j
  tnoremap <leader>k <C-\><C-n><C-w>k
  tnoremap <leader>l <C-\><C-n><C-w>l

  set undodir=~/.config/nvim/tmp/undo/ " undo files
  set backupdir=~/.config/nvim/tmp/backup/ " backups
  set directory=~/.config/nvim/tmp/swap/ " swap files

else
  " nvim have auto detect bracketed-paste
  " set pastetoggle=<leader>p
  set pastetoggle=<F2>
  set encoding=utf-8
  set undodir=~/.vim/tmp/undo/ " undo files
  set backupdir=~/.vim/tmp/backup/ " backups
  set directory=~/.vim/tmp/swap/ " swap files
endif


" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


filetype plugin indent on
syntax on " syntax highlighting on
set background=dark
colorscheme solarized

""Goto your last edit line when open a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Open big size file with syntax off
autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
autocmd BufWritePre *.py :%s/\s\+$//e


" 重启后撤销历史可用 persistent undo
set undofile
set backup
set noswapfile
set undolevels=1000 "maximum number of changes that can be undone
" }"}

" General {"{
"set autochdir " always switch to the current file directory
set autoread  "Set to auto read when a file is changed from the outside
set backspace=indent,eol,start " make backspace a more flexible
"set clipboard+=unnamed " share windows clipboard
" set directory=~/.vim/tmp " directory to place swap files in
set fileencodings=utf-8,cp936 " support all three, in this order
set fileformats=unix,dos,mac " support all three, in this order
set hidden " you can change buffers without saving
set mouse=a " use mouse everywhere
set wildmenu " turn on command line completion wild style
" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc
set wildignore+=*.jpg,*.gif,*.png,*.a,*.class,*.mo
set wildignore+=*.la,*.so,*.swp,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildignore+=*/.svn/*,*/.git/,*/.hg/*
set wildignore+=tags
"set wildmode=list:longest " turn on wild mode huge list
set tags=./tags,tags,.tags,~/.tags_usr_include;
" }"}

" Vim UI {"{
let $LANG="en_US.utf-8"
set incsearch " BUT do highlight as you type you search phrase
set nohlsearch
set laststatus=2 " always show the status line
"set lazyredraw " do not redraw while running macros
"set linespace=0 " don't insert any extra pixel lines
                  " betweens rows
"set list " we do what to show tabs, to ensure we get them
          " out of my files
set listchars=tab:>-,trail:- " show tabs and trailing
"set showmatch " show matching brackets
"set matchtime=1 " how many tenths of a second to blink
                  " matching brackets for
set nostartofline " leave my cursor where it was
set novisualbell " don't blink
set number " turn on line numbers
"set relativenumber
set numberwidth=3 " We are good up to 9999 lines
set report=0 " tell us when anything is changed via :...
"set shortmess=aOstT " shortens messages to avoid
                      "" 'press a key' prompt
set showcmd " show the command being typed
set scrolloff=4 " Keep 8 lines (top/bottom) for scope
set sidescrolloff=8 " Keep 4 lines at the size
" }"}

" Text Formatting/Layout {"{
set expandtab " no real tabs please!
set smarttab
"set formatoptions=rq " Automatically insert comment leader on return,
                        " and let gq format comments
set ignorecase " case insensitive by default
"set infercase " case inferred by default
set smartcase " if there are caps, go case-sensitive
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set shiftwidth=2 " auto-indent amount when using cindent,
                    " >>, << and stuff like that
set softtabstop=2 " when hitting tab or backspace, how many spaces
                    "should a tab be (see expandtab)
set tabstop=2 " real tabs should be 8, and they will show with
                " set list on
set wrap

" Split new window in right and below(I'm comfortable with this)
set splitright
" Commet this because this will make MiniBufExplorer appear at the bottom of
" window, which is very ugly
"set splitbelow

" }"}
