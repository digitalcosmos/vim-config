set nocompatible
set hidden
set hlsearch
set ignorecase
set smartcase
set pastetoggle =<F11>
set lines=50 columns=130
filetype indent on
:cd ~
set directory=.,$TMP,$TEMP
set backupdir=~/vimfiles/backup "dont forget to create the folder

"appearance
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set nu
set visualbell
set incsearch

set background=dark
set guifont=Dina:h9:cANSI
"set colorcolumn=80
set relativenumber
set numberwidth=1
set scrolloff=5

"mappings
map Y y$
map 0 ^
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+
map <C-n> :NERDTreeToggle<CR>
map <C-s> :w<CR>
nnoremap <TAB>   :MBEbn<CR>
noremap <S-TAB> :MBEbp<CR>
nnoremap <silent> <A-q> :MBEbd<CR>
nnoremap <F5> :exe ':silent !"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %'<CR>
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen",0)<CR>

"plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'altercation/vim-colors-solarized'
Plug 'leafgarland/typescript-vim'
Plug 'clausreinke/typescript-tools.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'omnisharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'
Plug 'fholgado/minibufexpl.vim'
"visit omnisharp/YCM page for additional info how to build & config
Plug 'moll/vim-node', { 'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript'}
Plug 'ejamesc/JavaScript-Indent', { 'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript'}
Plug 'mattn/emmet-vim', { 'for': ['html','xml']}
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular', { 'on': ['Tab','Tabularize']}
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --omnisharp--completer
  endif
endfunction
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern')} 
Plug 'valloric/youcompleteme', { 'do': function('BuildYCM'),'on': [] }
"only load youcompleteme on entering insert mode:
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('youcompleteme')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END
call plug#end()

filetype plugin indent on 
"let g:user_emmet_leader_key='<C-Y>'
let g:miniBufExplCycleArround=1
"let g:miniBufExplBRSplit = 0
let g:airline_theme="wombat"
let g:airline_powerline_fonts=1
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,jasmine'
let g:ctrl_pmap = '<c-p>'
let g:ctrl_cmd = 'CtrlP'
let g:plug_timeout = 120 "Workaround for timeout when installing YCM
set noshowmode

set splitright

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
colorscheme solarized

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_aggregate_errors = 1
