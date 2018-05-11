execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
set showcmd
set cursorline
:let mapleader = ","

syntax on
colorscheme gruvbox
set background=dark

filetype plugin indent on
set number " показывать номера строк в редакторе
set colorcolumn=120 " вертикальная линия после 120 символов
set tabstop=4 " ширина табуляции
set softtabstop=4 " ширина таба при использовании всесто него пробелов
set shiftwidth=4 "  when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces

set backspace=indent,eol,start
let g:go_version_warning = 0
set autowrite

" map <C-S-b> :NERDTreeFocus<CR>

nmap <leader>n  :bnext<CR>
nmap <leader>m  :bprev<CR>
nmap <leader>D  :bdelete<CR>

autocmd FileType go nmap <leader>b  :GoBuild<CR>
autocmd FileType go nmap <leader>r  :GoRun<CR>
autocmd FileType go nmap <leader>f  :GoFmt<CR>
autocmd FileType go nmap <leader>p  :GoInfo<CR>
autocmd FileType go nmap <leader>d  :GoDecls<CR>
autocmd FileType go nmap <leader>l  :GoLint<CR>
autocmd FileType go nmap <leader>w  :GoReferrers<CR>
nmap <leader>a  :Gblame<CR>

let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1

let g:go_metalinter_enabled = ['golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_metalinter_deadline = "5s"

set updatetime=100
let g:go_auto_sameids = 1
autocmd BufRead /home/sah4ez/go/src/*.go silent :GoGuruScope /home/sah4ez/go/src

autocmd BufNewFile,BufRead,BufReadPost *.erl set runtimepath^=~/.vim/bundle/vim-erlang-runtime
autocmd BufNewFile,BufRead,BufReadPost *.erl set runtimepath^=~/.vim/bundle/vim-erlang-omnicomplete
autocmd BufNewFile,BufRead,BufReadPost *.erl set runtimepath^=~/.vim/bundle/vim-erlang-compiler

let g:polyglot_disabled = ['go']

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
