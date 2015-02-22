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
nnoremap <F1> :noh<return><esc>
colorscheme elflord
set noai
set tabstop=4
set shiftwidth=4
set list
set list listchars=tab:»\ ,trail:-,extends:>,precedes:<,eol:¬


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
