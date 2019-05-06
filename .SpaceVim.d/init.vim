" my config
let g:spacevim_custom_plugins = [
  \ ['fatih/vim-go',               { 'on_ft' : 'go'}],
  \ ['keith/swift.vim',            { 'on_ft' : 'swift'}],
  \ ['leafgarland/typescript-vim', { 'on_ft' : 'typescript' }],
  \ ['pangloss/vim-javascript',    { 'on_ft' : 'js' }],
  \ ['moll/vim-node',              { 'on_ft' : 'js' }],
  \ ['scrooloose/vim-slumlord',    { 'on_ft' : 'plantuml' }],
  \ ['cespare/vim-toml',           { 'on_ft' : 'toml' }],
  \ ['ensime/ensime-vim',          { 'on_ft' : 'scala' }],
  \ ['derekwyatt/vim-scala',       { 'on_ft' : 'scala' }],
  \ ['racer-rust/vim-racer',       { 'on_ft' : 'rust' }],
  \ ['rust-lang/rust.vim',         { 'on_ft' : 'rust' }],
  \ ['aklt/plantuml-syntax'],
  \ ['airblade/vim-gitgutter'],
  \ ['terryma/vim-multiple-cursors'],
  \ ['ekalinin/dockerfile.vim'],
  \ ['junegunn/gv.vim'],
  \ ['tpope/vim-fugitive'],
  \ ['chr4/nginx.vim'],
  \ ['will133/vim-dirdiff'],
  \ ['bumaociyuan/vim-swift'],
  \ ['tell-k/vim-autopep8'],
  \ ['apple/apple-swift-vim'],
  \ ['sah4ez/vim-bitbucket-comments'],
  \ ['natebosch/vim-lsc',         { 'on_ft' : 'c' }],
  \ ['dbeniamine/cheat.sh-vim'],
  \ ['justinmk/vim-sneak'],
  \ ['tpope/vim-repeat'],
  \ ]

let g:spacevim_filemanager = 'nerdtree'
"set autochdir
"autocmd BufEnter * silent! lcd %:p:h
set viminfo='100,n$HOME/.vim/files/info/viminfo
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <leader>a <F9> :TagbarToggle<CR>
nnoremap <space>lga :Gblame<CR>

autocmd FileType golang nested :GoGuruScope /home/sah4ez/go/src/...
"autocmd BufRead /home/sah4ez/go/src/*.go silent :TagbarOpen

autocmd VimEnter * nested :call tagbar#autoopen(1)
set updatetime=100
set colorcolumn=120
autocmd VimEnter * nested :set wrap
let g:spacevim_windows_smartclose = 'Q'

" golang
let g:go_guru_scope = ["..."]
let g:go_highlight_functions = 1
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

let g:go_auto_sameids = 1
let g:go_def_mode='gopls'

nnoremap <space>lbr :GoReferrers<CR>
nnoremap <space>lbf :GoFmt<CR>
nnoremap <space>ltf :GoTestFunc<CR>

" PLANTUML settings
if exists("g:loaded_plantuml_plugin")
    finish
endif
let g:loaded_plantuml_plugin = 1

if !exists("g:plantuml_executable_script")
        let g:plantuml_executable_script = 'java -jar /home/sah4ez/.opt/plantuml.1.2018.11.jar'
endif
let s:makecommand=g:plantuml_executable_script." %"

" define a sensible makeprg for plantuml files
autocmd BufWrite plantuml,uml let 'java -jar /home/sah4ez/.opt/plantuml.1.2018.11.jar %'

let g:spacevim_default_indent = 4
let g:spacevim_expand_tab =0
set expandtab

set spell spelllang=en_us

" scala
" autocmd BufWritePost *.scala silent :EnTypeCheck
" nnoremap <localleader>t :EnType<CR>


" rust
let g:rustfmt_autosave = 1
nnoremap <space>lrf :RustFmt<CR>

" swift
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
let g:tagbar_type_swift = {
  \ 'ctagstype': 'swift',
  \ 'kinds' : [
    \ 'n:Enums',
    \ 't:Typealiases',
    \ 'p:Protocols',
    \ 's:Structs',
    \ 'c:Classes',
    \ 'f:Functions',
    \ 'v:Variables',
    \ 'e:Extensions'
  \ ],
  \ 'sort' : 0
\ }


" python
autocmd FileType python set equalprg=autopep8\ -
let g:autopep8_on_save = 1
let g:autopep8_ignore="E501"
let g:autopep8_pep8_passes=100

let g:lsc_server_commands = {
  \ 'c': 'cquery --init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"',
  \ 'cpp': 'cquery --init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"',
  \ 'python' : 'pyls',
  \ }

autocmd BufReadPre *.{c,cpp,h} nnoremap gd :LSClientGoToDefinition<CR>
autocmd BufReadPre *.{c,cpp,h} nnoremap gD :vertical LSClientGoToDefinitionSplit<CR>
autocmd BufReadPre *.{c,cpp,h} nnoremap <space>gr :LSClientFindReferenc<CR>
autocmd BufReadPre *.{c,cpp,h} nnoremap <space>gR :LSClientRename<CR>
autocmd BufReadPre *.{c,cpp,h} nnoremap <space>gi :LSClientFindImplementations<CR>
autocmd BufReadPre *.{c,cpp,h} nnoremap <space>gS :LSClientWorkspaceSymbol<CR>

nmap <space>jF <plug>(easymotion-F)
nmap <space>jf <plug>(easymotion-f)
nmap ; <plug>(easymotion-next)
nmap <space>; <plug>(easymotion-prev)
