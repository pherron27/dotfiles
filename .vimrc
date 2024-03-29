set nocompatible              " required
set shell=/bin/bash
if has('nvim')
    "set termguicolors
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
    set guicursor=
endif

filetype off                  " required
if has('nvim')
    let bundle_path = "~/.config/nvim/bundle"
else
    let bundle_path = "~/.vim/bundle"
endif

execute "set rtp+=".bundle_path.'/Vundle.vim'

call vundle#begin(bundle_path)
Plugin 'gmarik/Vundle.vim'

" general
Plugin 'tpope/vim-sensible'

" color schemes
Plugin 'lifepillar/vim-solarized8'

" Nerdtree for file browsing
Plugin 'scrooloose/nerdtree'

" UltiSnips for tab expansion to various constructs
Plugin 'SirVer/ultisnips'

" Snippets for UltiSnips
Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin indent on

set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
nnoremap <S-h> ^
vnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-l> $

" Basic usability
"set modelines=0
"set hidden
"set scrolloff=3
set autoindent
set wrapscan
set ttyfast
"set wildmode=list:full
"set wildignore+=*.pyc,*.o,*.obj.,*.d,.git,*.gcno,*.gcda,venv,*.class,*.jar
set number
set ruler
set expandtab
"set list
"let &listchars="tab:▸ ,trail:·,extends:…,precedes:…"
"set formatoptions-=t
"set noerrorbells novisualbell t_vb=
"set foldlevelstart=99
"autocmd GUIEnter * set visualbell t_vb=
"if &t_Co >= 256 || has("gui_running")
"    set cursorline
"else
"    set nocursorline
"endif

" Search customization
set hlsearch
" Press Spacebar to turn off highlighting and clear any message already displayed
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" ...except for git commits
autocmd FileType gitcommit execute "normal! ggm\""

set clipboard=unnamedplus

" Comments
let NERDSpaceDelims=1
autocmd FileType groovy set commentstring=//\ %s
nmap <C-/> gcc

" NerdTree
let NERDTreeShowHidden=1
nmap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Trigger configuration for UltiSnips. You need to change this to something other than
" <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

