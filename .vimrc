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
" fork with custom import sorting
Plugin 'rgueldem/vim-scala'
Plugin 'derekwyatt/vim-sbt'
Plugin 'w0rp/ale'
Plugin 'ervandew/supertab'
Plugin 'tsandall/vim-rego'
Plugin 'rhysd/vim-grammarous'

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
" always show status line
set laststatus=2
" use system clipboard
set clipboard=unnamed
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
nnoremap <Leader>f :setlocal foldmethod=syntax<CR>
nnoremap <Leader>F :setlocal nofoldenable<CR>
nnoremap <Leader>t :EnTypeCheck<CR>
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

" use fast scala compile or syntastic checks
let g:syntastic_scala_checkers = ['fsc']

" SortScalaImports across groups of imports
let g:scala_sort_across_groups = 1
" use scala doc recommended indentation
let g:scala_scaladoc_indent = 1

" ctrlp
let g:ctrlp_max_files = 0
" don't reuse buffers
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']

" netrw
" preview in vertical split (70%)
let g:netrw_preview = 1
let g:netrw_winsize = 30

" file types
autocmd BufNewFile,BufReadPost *.hdbs set syntax=mustache
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
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

" Force hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" red status line in insert mode
autocmd InsertEnter * hi StatusLine ctermfg=1 ctermbg=15
autocmd InsertLeave * hi StatusLine ctermfg=10 ctermbg=15
