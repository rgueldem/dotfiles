set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'mhinz/vim-grepper'
Plugin 'ervandew/supertab'
Plugin 'tsandall/vim-rego'
Plugin 'rhysd/vim-grammarous'
Plugin 'neoclide/coc.nvim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on
" vundle end

" general settings
syntax enable
set tabstop=2 shiftwidth=2 expandtab
set ignorecase incsearch
set ruler
set showcmd
set number
set nohlsearch
" allow backspace over any text
set backspace=2
" use system clipboard
"""" set clipboard=unnamed
" no need for swapfiles
set noswapfile
" mouse suport
set mouse=a
set ttymouse=xterm2

" color scheme
colorscheme solarized
set t_Co=16
set background=light

" leader mappings
nnoremap <Leader>q :qa<CR>
nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>g :Grepper<CR>
nnoremap <Leader>p :CtrlPClearAllCaches<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>

call togglebg#map("<F5>") " needed for the next line to work
nnoremap <Leader>b :ToggleBG<CR>

" remove extra whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Grepper
" use git grep by default
" open in quickfix
let g:grepper = {
      \ 'tools': ['git', 'ag', 'ack', 'grep'],
      \ 'quickfix': 1,
      \ 'open': 1,
      \ 'switch': 1,
      \ 'jump': 0,
      \ }

" ctrlp
let g:ctrlp_max_files = 0
" don't reuse buffers
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']

" file types
autocmd BufNewFile,BufReadPost *.hdbs set syntax=mustache
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.sbt set filetype=scala
autocmd BufNewFile,BufReadPost *.md setlocal spell

" esc
:imap jk <Esc>

" make c-u undoable
inoremap <c-u> <c-g>u<c-u>
" support window switching directly out of insert mode
inoremap <c-w> <Esc><c-w>

" tab to alternate buffer
nnoremap <tab> :bn<cr>
nnoremap <s-tab> :bp<cr>

" statusline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline_theme='solarized'
