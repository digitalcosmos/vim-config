set hidden
set hlsearch
set ignorecase
set smartcase
set noswapfile
set nobackup
set encoding=utf-8

"appearance
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set nu

set background=dark
set relativenumber
set numberwidth=1
set scrolloff=5

"mappings
map Y y$
map 0 ^
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+
map <C-s> :w<CR>
nnoremap <TAB>   :bn<CR>
noremap <S-TAB> :bp<CR>
nnoremap <silent> <A-q> :bd<CR>
nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-,> :FuzzyOpen<CR>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'akz92/vim-ionic2'
Plug 'tpope/vim-surround'
Plug 'ternjs/tern_for_vim'
Plug 'cloudhead/neovim-fuzzy'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/seoul256.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neopairs.vim'
Plug 'mhartington/deoplete-typescript'
Plug 'moll/vim-node', { 'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript'}
Plug 'ejamesc/JavaScript-Indent', { 'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript'}
Plug 'mattn/emmet-vim', { 'for': ['html','xml']}
Plug 'scrooloose/syntastic'
Plug 'janko-m/vim-test'
Plug 'godlygeek/tabular', { 'on': ['Tab','Tabularize']}
call plug#end()

let g:user_emmet_leader_key='<C-Y>'
let g:airline_theme="wombat"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
set noshowmode
"Preview autocomplete window:
set splitbelow
autocmd CompleteDone * pclose!

colorscheme seoul256
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#tss#javascript_support = 1
let g:deoplete#enable_ignore_case = 1
"let g:deoplete#auto_complete_start_length = 0
"let g:auto_complete_start_length = 0
"let g:deoplete#enable_refresh_always = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"
set t_Co=256

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd FileType typescript syn clear foldBraces
autocmd FileType typescript JsPreTmpl html
"syntastic integration
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
"stuff I found on the internet
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>
