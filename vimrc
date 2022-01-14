echo ">^.^<"

exec "nohlsearch"
" vscode-vim配置：https://github.com/VSCodeVim/Vim 

set nocompatible
filetype plugin on
syntax on
syntax enable
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 快捷键映射
let mapleader=" "
noremap <leader>s 5j
noremap n nzz
noremap N Nzz
noremap <C-j> 5j
noremap <C-k> 5k
noremap <C-l> :tabnext<CR>
noremap <C-h> :tabprevious<CR>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <Delete>
inoremap <D-z> :undo\n
noremap <D-z> :undo\n

" 分屏模式
map s <nop>
map S :w<CR>
map sv :set splitright<CR>:vsplit<CR>
map snv :set nosplitright<CR>:vsplit<CR>
map sb :set splitbelow<CR>:split<CR>
map snb :set nosplitbelow<CR>:split<CR>
map <C-UP> :res +5<CR>
map <C-DOWN> :res -5<CR>
map <C-left> :vertical resize -5<CR>
map <C-right> :vertical resize +5<CR>
" 标签栏使用
map tt :tabe<CR>
map <leader><tab> :tabnext<CR>
map <leader>` :-tabnext<CR>
" map > <C-w>5>
" map < <C-w>5<


" 配置文件
set hlsearch
set incsearch
set ignorecase
set smartcase
set termguicolors
set write
set number
set ruler
set history=1000
set mouse=a
set showcmd
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileformat=unix
set encoding=utf-8
set wildmenu
set relativenumber
set nocompatible
set backspace=indent,eol,start
set backspace=2
" 共享剪贴板
set clipboard=autoselect
" 文件被改动时自动载入
set autoread
set autowriteall
" 顶部底部保持3行距离
set scrolloff=5

" 启用自动对齐功能，把上一行的对齐格式应用到下一行
set autoindent
set autochdir

" vim禁用自动备份
set nobackup
set nowritebackup
set noswapfile

" 用空格代替tab
set expandtab

" 设置帮助文件为中文(需要安装vimcdoc文档)
set helplang=cn

" 显示匹配的括号
set showmatch

" 文件缩进及tab个数
set tabstop=2
" 统一缩进为4，方便在开启了et后使用退格(backspace)键，每次退格将删除X个空格
set softtabstop=2
" 设定自动缩进为4个字符，程序中自动缩进所使用的空白长度
set shiftwidth=2
au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4

"===
"=== GVIM setting
"===
set guifont=*

" 检测文件的类型
filetype on
filetype plugin on
filetype indent on

" 自动保存
set autowrite

"if $TERM_PROGRAM =~ "iTerm"
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"endif


" ===
" === 插件 
" ===
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'lyokha/vim-xkbswitch'

" Vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'piec/vim-lsp-gopls'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

call plug#end()

" ---------------------------
" plug setting

colorscheme darcula
" ===
" === NERDTree
" ===
map tf :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:vimwiki_list = [{'path': '~/Vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'template_path': '', 'custom_wiki2html': '$HOME/.bin/wiki2html.sh' }]


" ===
" === Vim-lsp 配置
" === https://github.com/prabirshrestha/vim-lsp/wiki/Servers
if executable('vim-language-server')
  augroup LspVim
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'vim-language-server',
          \ 'cmd': {server_info->['vim-language-server', '--stdio']},
          \ 'whitelist': ['vim'],
          \ 'initialization_options': {
            \   'vimruntime': $VIMRUNTIME,
            \   'runtimepath': &rtp,
            \ }})
  augroup END
endif

if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'javascript support using typescript-language-server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
        \ })
  endif

if executable('css-languageserver')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

if executable('bash-language-server')
  augroup LspBash
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  augroup END
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
  endif

if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
  endif
