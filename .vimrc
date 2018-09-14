set bg=dark
set history=1000
set ignorecase
set smartcase
set title
set scrolloff=3
set ruler
set showmatch
set incsearch
set hlsearch
set noai
set tabstop=4
set shiftwidth=4
set list
set list listchars=tab:»\ ,trail:-,extends:>,precedes:<,eol:¬
set expandtab
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


syntax on
filetype on
filetype plugin on
filetype indent on

"" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

set laststatus=2
let g:buftabs_in_statusline=1

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%94v.*/

map ,pt <ESC>:%! perltidy<CR>
map ,ptv <ESC>:'<,'>! perltidy<CR>

runtime macros/matchit.vim
