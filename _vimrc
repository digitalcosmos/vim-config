set nocompatible
set hidden
set hlsearch
set ignorecase
set smartcase
set pastetoggle =<F11>
set lines=50 columns=130
filetype indent on
set directory=.,$TMP,$TEMP
set backupdir=~/vimfiles/backup

"appearance
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set nu
set visualbell
set incsearch

set background=dark
colorscheme codeschool
set guifont=Dina:h9:cANSI
"set colorcolumn=80
set relativenumber
set numberwidth=1
set scrolloff=5

"mappings
map Y y$
vnoremap <C-c> "+y
noremap <C-v> "+p
map <C-n> :NERDTreeToggle<CR>
map <C-s> :w<CR>
nnoremap <TAB>   :MBEbn<CR>
noremap <S-TAB> :MBEbp<CR>
nnoremap <silent> <A-q> :bd<CR>
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen",0)<CR>

"plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'moll/vim-node', { 'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript'}
Plug 'ejamesc/JavaScript-Indent', { 'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript'}
Plug 'mattn/emmet-vim', { 'for': ['html','xml']}
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP','CtrlPbuffer','CtrlPMixed']}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'godlygeek/tabular', { 'on': ['Tab','Tabularize']}
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern')}
call plug#end()

filetype plugin indent on 
let g:user_emmet_leader_key='<C-Y>'
let g:ctrlp_map = '<C-p>'
let g:miniBufExplCycleArround=1
let g:airline_theme="wombat"
let g:airline_powerline_fonts=1
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,jasmine'
set noshowmode

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

if &diff
        " equalize size of diffed file windows
        au VimResized * :execute "normal! \<C-W>="

        " toggle diff font
        function! DiffSmallFont1()
                set guifont=-misc-fixed-medium-r-normal--9-90-75-75-c-60-iso10646-1
                map :call DiffSmallFont2()<CR>
        endfunction
        function! DiffSmallFont2()
                set guifont=-misc-fixed-medium-r-normal--10-100-75-75-c-60-iso10646-1
                map <F5> :call DiffSmallFont3()<CR>
        endfunction
        function! DiffSmallFont3()
                set guifont=-misc-fixed-medium-r-normal--13-120-75-75-c-70-iso10646-1
                map <F5> :call DiffSmallFont1()<CR>
        endfunction
        call DiffSmallFont2()
endif

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
