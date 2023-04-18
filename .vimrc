set nocp
filetype plugin indent on
syntax on

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'pengkai/VimIM'
Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
"Plug 'github/copilot.vim'
Plug 'Exafunction/codeium.vim'
call plug#end()

set ruler
set number
set autochdir
set incsearch
set hlsearch
set ignorecase
set smartcase
"set paste
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set guioptions=no
set transparency=30
set foldmethod=indent
"set guifont=Source_Code_Pro:h14
set guifont=MonoLisa:h16
set cursorline
colorscheme smyck

"Backup
"set patchmode=.orig
"set backup
"set writebackup
"silent execute '!mkdir ~/.vim_backup'
"set backupdir=~/.vim_backup//
"set backupext=.bak
":au BufWritePre * let &bex = '-' .. strftime("%Y%b%d%X") .. '.bak'


"VimIM
let g:Vimim_toggle='wubi'


"Emmet
let g:user_emmet_leader_key='<C-A>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,javascript.jsx,typescriptreact,xml,scss EmmetInstall
autocmd FileType html,css,javascript,javascript.jsx,typescriptreact,xml,scss imap <tab> <plug>(emmet-expand-abbr)
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

imap   <D-/>  <plug>(emmet-toggle-comment)


autocmd BufNewFile,BufRead *.wxml set filetype=xml
autocmd BufNewFile,BufRead *.wxss set filetype=css

"ALE
let g:ale_completion_enabled = 1
"let g:ale_linters_explicit = 1

"let g:ale_javascript_prettier_executable = 'prettier'
"let g:ale_javascript_prettier_use_global = 1
"   'typescript': ['tsserver'],
"\   'typescriptreact': ['tsserver'],
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['tsserver','eslint'],
\   'css': ['vscodecss'],
\   'scss': ['stylelint'],
\   'html': ['htmlhint'],
\}
let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'typescript': ['prettier'],
\  'typescriptreact': ['prettier'],
\  'css': ['vscodecss','prettier'],
\  'scss': ['stylelint','prettier'],
\  'html': ['prettier'],
\}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

"Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

let g:ale_sign_column_always = 1
let g:ale_sign_error = '*'
let g:ale_sign_warning = '!'


"FZF
"set rtp+=~/.fzf
"set rtp+=/usr/local/opt/fzf
"nnoremap <silent> <C-p> :Files<CR>
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

"let g:fzf_layout = { 'left': '~80%'}
let g:fzf_layout = { 'window': {'width': 0.9, 'height': 0.7}}
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"IndentLine
let g:indentLine_enabled = 1

"Typescript
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'



"au BufRead,BufNewFile *.scss set filetype=css

"AirlineTheme
let g:airline_theme='ayu_mirage'
"let g:airline_theme='biogoo'

"NERDTree
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

"Copilot
"imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
"let g:copilot_no_tab_map = v:true
