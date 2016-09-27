set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'mhinz/vim-grepper'
Plugin 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
"
syntax enable

colorscheme solarized
set t_Co=16
set background=light
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

nnoremap <Leader>q :qa<CR>
nnoremap <Leader>e :Explore<CR>

" highlight extra spaces
let c_space_errors = 1
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" autocmd QuickFixCmdPost *grep* cwindow
" Grepper
let g:grepper = {
      \ 'tools': ['git', 'ag', 'ack', 'grep'],
      \ 'quickfix': 1,
      \ 'open': 1,
      \ 'switch': 1,
      \ 'jump': 0,
      \ }
nnoremap <Leader>g :Grepper<CR>

nnoremap <Leader>f :setlocal foldmethod=syntax<CR>
nnoremap <Leader>F :setlocal nofoldenable<CR>

" scala
let g:syntastic_scala_checkers = ['fsc']
"autocmd BufWritePost *.scala :EnTypeCheck
nnoremap <localleader>t :EnTypeCheck<CR>

" ctrlp
let g:ctrlp_max_files = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
nnoremap <Leader>p :CtrlPClearAllCaches<CR>

" netrw
" let g:netrw_preview = 1
let g:netrw_winsize = 30

autocmd BufReadPost *.hdbs set syntax=mustache
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" remove extra whitespace on save
autocmd FileType ruby,eruby,html,javascript,scala,java autocmd BufWritePre <buffer> :%s/\s\+$//e

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <Esc><c-w>

" red status line in insert mode
autocmd InsertEnter * hi StatusLine ctermfg=1 ctermbg=15
autocmd InsertLeave * hi StatusLine ctermfg=10 ctermbg=15

" tab to alternate buffer
nnoremap <tab> :bn<cr>
nnoremap <s-tab> :bp<cr>

" Force hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

if has('nvim')
  " cursor as pipe in insert mode
  :let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
