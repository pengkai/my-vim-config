set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

if has("gui_running") 
  if has("gui_gtk2") 
    set guifont=Inconsolata\ 12 
  elseif has("gui_macvim") 
    set guifont=Menlo\ Regular:h14 
    "set guifont=Hack\ Regular:h14 
  elseif has("gui_win32") 
    set guifont=Consolas:h11:cANSI
  endif 
endif

" Settings
set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf-8,cp939

set backspace=indent,eol,start
set history=100
set hlsearch
set incsearch
set ruler
set keymodel=startsel,stopsel
set selectmode=mouse,key
set selection=exclusive
set whichwrap=b,s,<,>,[,]

set wrapscan
set number
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set cinoptions=j0

set showmatch
set linebreak
set ignorecase smartcase
set columns=100
set lines=30

"set nobackup
"set nowritebackup
set backupcopy=auto

map <Down> gj
map <Up> gk

set autochdir

"user interface
colorscheme smyck
set transparency=30
set guioptions=no


"session
"set sessionoptions+=winsize,buffers,options,folds,help,curdir
"nmap <F2> :mks! ~/Documents/.sessions/x.vim
"nmap <F3> :so ~/Documents/.sessions/

"plugins

"emmet-vim
"enable just for html/css
let g:user_emmet_mode = "a"
"let g:user_emmet_install_global = 0
"autocmd FileType css imap <tab> <plug>(emmet-expand-abbr)
"let g:user_emmet_expandabbr_key="<Tab>"
"autocmd FileType html,css,scss imap <tab> <plug>(EmmetExpandAbbr)
"set ctrl + alt as leader key
"set macmeta
"let g:user_emmet_leader_key = "<C-M>"
"let g:user_emmet_togglecomment_key = "<C-M-m>"
"let g:user_emmet_balancetaginward_key = "<C-M-d>"
"let g:user_emmet_codepretty_key = "<C-M-c>"
"autocmd FileType html,css,xml,wxml,wxss EmmetInstall
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"define key
"let g:user_emmet_expandabbr_key="<C-enter>"
"let g:user_emmet_expandabbr_key = '<C-y>,'
"let g:user_emmet_expandword_key = '<C-y>;'
"let g:user_emmet_update_tag = '<C-y>u'
"let g:user_emmet_balancetaginward_key = '<C-y>d'
"let g:user_emmet_balancetagoutward_key = '<C-y>D'
"let g:user_emmet_next_key = '<C-y>n'
"let g:user_emmet_prev_key = '<C-y>N'
"let g:user_emmet_imagesize_key = '<C-y>i'
"let g:user_emmet_togglecomment_key = '<C-y>/'
"let g:user_emmet_splitjointag_key = '<C-y>j'
"let g:user_emmet_removetag_key = '<C-y>k'
"let g:user_emmet_anchorizeurl_key = '<C-y>a'
"let g:user_emmet_anchorizesummary_key = '<C-y>A'
"let g:user_emmet_mergelines_key = '<C-y>m'
"let g:user_emmet_codepretty_key = '<C-y>c'

"map <c-r> :call ReloadAllSnippets()<CR>

"indent-guides
"let g:html_indent_inctags = "script"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:html_indent_script1 = "zero"
let g:html_indent_style1 = "inc"
let g:html_indent_autotags = "html,script,xml"


let g:user_emmet_settings={
\ 'javascript.jsx' : {
\   'extends' : 'jsx',
\    'default_attributes' : {
\      'label': [{'htmlFor': ' '}],
\      'class': { 'className': ' '},
\    },
\  },
\}




"VimIM
"let g:Vimim_cloud = "";
"let g:Vimim_plugin = 0;
let g:Vimim_toggle='wubi' 


"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_args = "'indent': ['error', 2]"

"NERDTree
map <C-n> :NERDTreeToggle<CR>



"ale
let g:ale_linters = {
      \   'javascript': ['standard'],
      \}

"\'*': ['remove_trailing_lines', 'trim_whitespace'],
let g:ale_fixers = {
      \   'javascript': ['standard'],
      \}

"let g:ale_change_sign_column_color = 1
hi! link SignColumn LineNr
let g:ale_sign_column_always = 1
let g:ale_sign_error = '*'
let g:ale_sign_warning = '!'

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

let b:ale_javascript_standard_options = '--parser babel-eslint'

"jsx and tsx
au BufRead,BufNewFile *.jsx set filetype=javascript
au BufRead,BufNewFile *.tsx set filetype=javascript

"fzf
set rtp+=/usr/local/opt/fzf
nnoremap <silent> <C-p> :Files<CR>
let g:fzf_layout = { 'left': '~80%'}
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

au BufReadPost *.wxml set filetype=xml
au BufReadPost *.wxss set filetype=css

"Vim 8 pack help files
packloadall
silent! helptags ALL

