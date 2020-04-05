let g:spacevim_custom_plugins = [
  \ ['fatih/vim-go',               { 'on_ft' : 'go'}],
  \ ['keith/swift.vim',            { 'on_ft' : 'swift'}],
  \ ['leafgarland/typescript-vim', { 'on_ft' : 'typescript' }],
  \ ['pangloss/vim-javascript',    { 'on_ft' : 'js' }],
  \ ['moll/vim-node',              { 'on_ft' : 'js' }],
  \ ['cespare/vim-toml',           { 'on_ft' : 'toml' }],
  \ ['ensime/ensime-vim',          { 'on_ft' : 'scala' }],
  \ ['derekwyatt/vim-scala',       { 'on_ft' : 'scala' }],
  \ ['ryanolsonx/vim-lsp-python',  { 'on_ft' : 'python' }],
  \ ['aklt/plantuml-syntax'],
  \ ['airblade/vim-gitgutter'],
  \ ['terryma/vim-multiple-cursors'],
  \ ['ekalinin/dockerfile.vim'],
  \ ['junegunn/gv.vim'],
  \ ['tpope/vim-fugitive'],
  \ ['nginx/nginx'],
  \ ['tbastos/vim-lua'],
  \ ['dbeniamine/cheat.sh-vim'],
  \ ['sah4ez/vim-bitbucket-comments'],
  \ ['prabirshrestha/async.vim'],
  \ ['natebosch/vim-lsc'], 
  \ ['prabirshrestha/vim-lsp'],
  \ ['scrooloose/syntastic'],
  \ ['c9s/helper.vim'],
  \ ['c9s/treemenu.vim'],
  \ ['c9s/vikube.vim'],
  \ ['justinmk/vim-sneak'],
  \ ['tpope/vim-repeat'],
  \ ['lilydjwg/colorizer'],
  \ ['whiteinge/diffconflicts'],
  \ ['l04m33/vlime'],
  \ ['neovimhaskell/haskell-vim'],
  \ ['bitc/vim-hdevtools'],
  \ ['alx741/vim-stylishask'],
  \ ['nbouscal/vim-stylish-haskell'],
  \ ['will133/vim-dirdiff'],
  \ ['tarekbecker/vim-yaml-formatter'],
  \ ['lambdalisue/vim-pyenv'],
  \ ['nvie/vim-flake8'],
  \ ['sah4ez/SQHell.vim'],
  \ ['vim-syntastic/syntastic'],
  \ ]

let g:spacevim_filemanager = 'nerdtree'
"set autochdir
"autocmd BufEnter * silent! lcd %:p:h
set viminfo='100,n$HOME/.vim/files/info/viminfo
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <leader>a <F9> :TagbarToggle<CR>
nnoremap <space>lga :Gblame<CR>

autocmd FileType golang nested :GoGuruScope /home/sah4ez/go/src
"autocmd BufRead /home/sah4ez/go/src/*.go silent :TagbarOpen

autocmd VimEnter * nested :call tagbar#autoopen(1)
" let g:tagbar_type_go = {
"     \ 'ctagstype': 'go',
"     \ 'kinds' : [
"         \'p:package',
"         \'f:function',
"         \'v:variables',
"         \'t:type',
"         \'c:const'
"     \]
"     \}
set updatetime=100
set colorcolumn=120
autocmd VimEnter * nested :set wrap
let g:spacevim_windows_smartclose = 'Q'

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" golang
" let g:go_guru_scope = ["..."]
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
" let g:go_gocode_propose_cache = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'structcheck', 'maligned', 'megacheck', 'dupl', 'interfacer', 'goconst']
let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['golint']
let g:go_metalinter_deadline = "5s"

let g:go_auto_sameids = 1
let g:go_null_module_warning = 1

autocmd BufReadPre *.{go} nnoremap <space>lbr :GoReferrers<CR>
autocmd BufReadPre *.{go} nnoremap <space>lbi :GoImplements<CR>
autocmd BufReadPre *.{go} nnoremap <space>lbf :GoFmt<CR>
autocmd BufReadPre *.{go} nnoremap <space>ltf :GoTestFunc<CR>

" PLANTUML settings
if exists("g:loaded_plantuml_plugin")
    finish
endif
let g:loaded_plantuml_plugin = 1

if !exists("g:plantuml_executable_script")
        let g:plantuml_executable_script = 'java -jar /home/sah4ez/.opt/plantuml.jar'
endif
let s:makecommand=g:plantuml_executable_script." %"

" define a sensible makeprg for plantuml files
autocmd BufWrite plantuml,uml let 'java -jar /home/sah4ez/.opt/plantuml.jar %'

let g:spacevim_default_indent = 4
let g:spacevim_expand_tab =0
set expandtab


" scala
" autocmd BufWritePost *.scala silent :EnTypeCheck
" nnoremap <localleader>t :EnType<CR>
"


" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" syntastic
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']
let g:syntastic_go_checkers = ['golint']

" cheat

let g:CheatSheetUrlGetter='curl --silent -H "User-Agent: curl"'

" lsp/lsc
" let g:lsc_server_commands = {
"   \ 'c': 'cquery --init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"',
"   \ 'cpp': 'cquery --init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"',
"   \ }

if executable('cquery')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'cquery',
        \ 'cmd': {server_info->['cquery', '--init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
        \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery_cache' },
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
        \ })
endif

if executable('pyls')
  au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'whitelist': ['python'],
          \ })
endif

"if executable('gopls')
"  au User lsp_setup call lsp#register_server({
"          \ 'name': 'gopls',
"          \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
"          \ 'whitelist': ['go'],
"          \ })
"endif

if executable('java') && filereadable(expand('/home/sah4ez/.opt/lsp/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'))
  au User lsp_setup call lsp#register_server({
          \ 'name': 'eclipse.jdt.ls',
          \ 'cmd': {server_info->[
          \     'java',
          \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          \     '-Dosgi.bundles.defaultStartLevel=4',
          \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
          \     '-Dlog.level=ALL',
          \     '-noverify',
          \     '-Dfile.encoding=UTF-8',
          \     '-Xmx1G',
          \     '-jar',
          \     expand('/home/sah4ez/.opt/lsp/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'),
          \     '-configuration',
          \     expand('/home/sah4ez/.opt/lsp/config_linux'),
          \     '-data',
          \     getcwd()
          \ ]},
          \ 'whitelist': ['java'],
          \ })
endif

autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap gd :LspDefinition<CR>
autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap gD :LspDeclaration<CR>
autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap <space>blf :LspDocumentFormat<CR>
autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap <space>gr :LspReferences<CR>
autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap <space>grn :LspNextReference<CR>
autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap <space>grp :LspPreviousReference<CR>
autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap <space>gR :LspRename<CR>
autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap <space>gi :LspImplementation<CR>
autocmd BufReadPre *.{c,cpp,h,java,objc,objcpp} nnoremap <space>gS :LspWorkspaceSymbol<CR>

nmap <space>jF <plug>(easymotion-F)
nmap <space>jf <plug>(easymotion-f)
nmap ; <plug>(easymotion-next)
nmap <space>; <plug>(easymotion-prev)

if filereadable("./syntax/ws-logs.vim") 
	source ./syntax/ws-logs.vim
endif
if filereadable("./syntax/nginx-auth.vim") 
	source ./syntax/nginx-auth.vim
endif
if filereadable("./spell/ru.utf-8.spl")
	source ./spell/ru.utf-8.spl
	source ./spell/ru.utf-8.sug
endif

autocmd BufReadPre *.ws set filetype=ws-logs
autocmd BufReadPre *.nginx-log set filetype=nginx-auth
autocmd BufReadPre *.ios set filetype=ios

" fucking hack, but I don't know why it not wokred
autocmd BufWritePost *.go silent set filetype=none | set filetype=go

set spell spelllang=en_us
nmap <space>ll :set spell spelllang=en_us,ru<CR>

" haskell
"
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1
let g:stylishask_on_save = 1
let g:stylish_haskell_command = 1 
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>

if $_ == '/opt/vertica/bin/vsql' 
	set filetype=sql 
endif

autocmd BufReadPre *.{py,go,c,cpp,h,java,go,yaml,json,sql,sh} nnoremap  <space>vmk :mkview<CR>
autocmd BufReadPre *.{py,go,c,cpp,h,java,go,yaml,json,sql,sh} nnoremap  <space>vml :silent loadview<CR>
