set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'

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
set ic is
set ruler
set showcmd
set number
#set hidden
set clipboard=unnamed
let c_space_errors = 1

au QuickFixCmdPost *grep* cwindow

" ctrlp
let g:ctrlp_max_files = 30000
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']

au BufReadPost *.hdbs set syntax=mustache
au BufNewFile,BufReadPost *.md set filetype=markdown

highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

au FileType rb,erb,html,js autocmd BufWritePre <buffer> :%s/\s\+$//e

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
