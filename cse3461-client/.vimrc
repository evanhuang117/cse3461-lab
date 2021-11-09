set expandtab
set tabstop=4
set shiftwidth=4
set background=dark
set autoindent
set smartindent
set number
set ruler
"display full filepath all the time
set statusline+=%F
"display path in last command box
set laststatus=2
set title
syntax on
filetype indent plugin on
set encoding=UTF-8

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:deepspace_italics=1
set nocompatible

"syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"resize syntastic window automatically
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction



if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


"assembly syntax highlighting
Plug 'shirk/vim-gas'

"autoindent for php and html
"Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug '2072/vim-syntax-for-PHP'

Plug 'sheerun/vim-polyglot'

"auto close tag for html
"Plug 'alvan/vim-closetag'
"let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
"let g:closetag_filetypes = 'html,xhtml,phtml'

"auto parenthese etc
"Plug 'jiangmiao/auto-pairs'
"let g:AutoPairsShortcutToggle = '<C-k>'
let g:AutoPairs = {'(':')', '[':']', '{':'}', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" Utility
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'wesQ3/vim-windowswap'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'benmills/vimux'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'gilsondev/searchtasks.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'

" Generic Programming Support 
Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'tobyS/vmustache'
Plug 'janko-m/vim-test'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'tpope/vim-rails'

"python highlighting
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'jaxbot/github-issues.vim'


"visual stuff
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'joshdick/onedark.vim'

"color scheme for non 256bit
Plug 'rakr/vim-one' 
call plug#end()

"use vim gas for asm highlighting
let asmsyntax="gas"

colorscheme onehalfdark
