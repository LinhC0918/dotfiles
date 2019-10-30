call plug#begin('~/.config/nvim/plugged')
" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tyrannicaltoucan/vim-quantum'
" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'
" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'
" code navigation
Plug 'universal-ctags/ctags'
" Nerd tree
Plug 'scrooloose/nerdtree'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Comment
Plug 'scrooloose/nerdcommenter'
" Search file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

" Ruby on Rails Plugin
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'easymotion/vim-easymotion'

Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
" Vim Text Object
Plug 'kana/vim-textobj-user'
Plug 'tek/vim-textobj-ruby'
Plug 'kana/vim-textobj-line'
Plug 'whatyouhide/vim-textobj-erb'
Plug 'thoughtbot/vim-rspec'

" Auto insert or delete bracket, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
" Close all buffers except current buffer and nerdtree
Plug 'vim-scripts/BufOnly.vim'

" Indent
Plug 'Yggdroot/indentLine'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()

let mapleader=","

inoremap jj <Esc>
vnoremap jk <Esc>

syntax on

au FocusGained,BufEnter * checktime
set autoread 
set number 
set encoding=utf-8
set termguicolors
set textwidth=120
set colorcolumn=+1
set autoindent
set expandtab
set smartindent
set smarttab
set softtabstop=2
set clipboard+=unnamedplus
set mouse=a
set backspace=eol,start,indent
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set shiftwidth=2
set hid "undo when switch buffer

set splitbelow
set splitright

" Search
" set hlsearch
set ignorecase
set smartcase
set incsearch

set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

" Turn off search highlight
map <silent> <leader><cr> :noh<cr>

inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

colorscheme quantum
set background=dark
let g:quantum_italics=1

let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

map <leader>tc :tabnew<cr>
map <leader>tx :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>wv <C-W>v
map <leader>ws <C-W>s

map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <leader>nr :NERDTreeRefreshRoot<cr>

map <leader>rv :vertical resize 30<cr>

nmap <C-S> :up<cr>
imap <C-S> <Esc>:up<cr>
vmap <C-S> <Esc>:up<cr>
map <C-e> :q<cr>
map <C-x> :qa<cr>

let g:NERDTreeWinSize=30 
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git']
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

" NERDTree
autocmd VimEnter * set winfixwidth
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" NERDCommenter
let g:NERDSpaceDelims=1
map <leader>m <Plug>NERDCommenterToggle

" rename window tmux
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_auto_close = {
    \ "normal" : 1,
    \ "compact": 1
    \}

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers except current buffer
map <leader>bo :BufOnly<cr>

map <leader>l :bnext<cr>
map <leader>u :bprevious<cr>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping = 1
let g:multi_cursor_start_word_key = '<A-z>'
let g:multi_cursor_next_key = '<A-z>'
let g:multi_cursor_prev_key = '<A-p>'
let g:multi_cursor_skip_key = '<A-x>'
let g:multi_cursor_quit_key = 'jk' 

"\\ Force save file when I forgot run 'sudo vim file'
"\\ With Great Power Comes Great Responsibility
cmap w!! %!sudo tee > /dev/null %

" vim airline
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Floating window
map <leader>f :call OpenFloatTerm()<cr>
function! OpenFloatTerm()
  let height = float2nr((&lines - 2) / 1.5)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns / 1.5)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
    \ 'relative': 'editor',
    \ 'row': row - 1,
    \ 'col': col - 2,
    \ 'width': width + 4,
    \ 'height': height + 2,
    \ 'style': 'minimal'
    \ }
  let border_buf = nvim_create_buf(v:false, v:true)
  let s:border_win = nvim_open_win(border_buf, v:true, border_opts)
  " Main Window
  let opts = {
    \ 'relative': 'editor',
    \ 'row': row,
    \ 'col': col,
    \ 'width': width,
    \ 'height': height,
    \ 'style': 'minimal'
    \ }
  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)
  terminal
  startinsert
  " Hook up TermClose event to close both terminal and border windows
  autocmd TermClose * ++once :q | call nvim_win_close(s:border_win, v:true)
endfunction

" FZF
map <A-q> :FZF<cr>
map <C-f> :Rg<cr>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Git Gutter
map <leader>gh :GitGutterLineNrHighlightsToggle<cr>

" set complete to Tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
