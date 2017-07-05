"          vundle configuration
set nocompatible
filetype off
source ~/.vimrc.plugins

"          vundle configuration

"          Basic configure

syntax on
filetype plugin indent on
set t_Co=256
set lines=80 columns=100
set directory=~/.vim/tmp/swap
set backupdir=~/.vim/tmp/backup
color neodark
let g:neodark#use_256color = 1
let g:neodark#terminal_transparent = 1
let g:neodark#solid_vertsplit = 1

let mapleader = ","
set mouse=a
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P
set laststatus=2
set wildignore=*.swp,*.bak,*.pyc,*.pyo,*.class,*.tmp,*~
set number
set list

"          Basic configure

"          Text distribution
set ai
set si
set wrap
set autoindent
set tabstop=2
set shiftwidth=2
set smartindent

"          Text distribution

set showcmd
set cursorcolumn cursorline
set history=1000
set backspace=eol,start,indent

"          Seach

set ignorecase
set smartcase
set hlsearch
set incsearch
set expandtab
set listchars=tab:>.,trail:.,extends:#
set foldmethod=syntax
set foldlevel=1

"          Seach

"          Expecial plugins configurations

let g:neocomplcache_enable_at_startup = 1
let g:used_javascript_libs = 'jquery,underscore,backbone,prelude,angularjs,requirejs,sugar'
let NERDTreeShowHidden=1
let g:tagbar_usearrows = 1
let g:airline_powerline_fonts = 1

"          Expecial plugins configurations

"          Shotcuts

map <leader>q :q!<CR>
map <leader>w :w!<CR>
map <leader>wq :wq<CR>
imap jj <ESC>:w!<CR>
imap jja <ESC>A;<ESC>o

map <F2> :let NERDTreeWinPos = "left"<ESC>:NERDTreeToggle<RETURN>
map <F3> :let NERDTreeWinPos = "right"<ESC>:NERDTreeToggle<RETURN>
map <F4> :TagbarToggle<CR>
set pastetoggle=<leader>p
noremap <leader>m :call <SID>ToggleMouse()<CR>
inoremap <leader>m <Esc>:call <SID>ToggleMouse()<CR>a
noremap <Leader>r <C-^>

map <C-a> ggVG
map <leader>a VG

noremap <Leader>v :vsplit
noremap <Leader>h :split
map <leader>Q :only<CR>

map <leader>es :set spell spelllang=es_MX<CR>
map <leader>en :set spell spelllang=en_us<CR>
map <leader>n ]s

map <leader>e :Errors<CR>
map <leader>gs :Gstatus<CR>
map <leader>b :!bundle install<CR>
map <leader>ra :!rake db:create db:migrate db:test:prepare
map <leader>rm :!rake db:migrate
map <leader>t :!rspec

"          Shotcuts

"          Metods

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        set number
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        set nonumber
        echo "Mouse is for terminal"
    endif
endfunction

"          Metods

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
