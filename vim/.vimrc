" general
syntax on
filetype plugin on
filetype indent on

" normal mode
nnoremap ; :
nnoremap : ;
map 0 ^

" insert mode
inoremap jk <Esc>
inoremap <C-u> <C-g>u<C-u>
set pastetoggle=<F2>

" visuals
set number
set relativenumber
set wildmenu
set scrolloff=3

" tabs, windows, buffers
set hidden
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprev<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>c :close<cr>
nnoremap <leader>d :bd<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" indentation and formatting
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set list
set listchars=tab:<-,trail:~

" spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" search
set incsearch
set nohlsearch

" helpers
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" vimdiff
hi DiffAdd      ctermfg=NONE          ctermbg=DarkGreen
hi DiffChange   ctermfg=NONE          ctermbg=NONE
hi DiffDelete   ctermfg=LightBlue     ctermbg=Red
hi DiffText     ctermfg=Yellow        ctermbg=Red

" plugins
let g:vimwiki_list=[{'path': $VIMWIKI_PATH, 'syntax': 'markdown', 'ext': '.md'}]

if !empty($VIMWIKI_PATH)
  let g:vimwiki_list=[{'path': $VIMWIKI_PATH, 'syntax': 'markdown', 'ext': '.md'}]
else
  let g:vimwiki_list=[{'syntax': 'markdown', 'ext': '.md'}]
endif
