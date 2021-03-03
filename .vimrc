" nnoremap <silent> <Leader>v :NERDTreeFind<CR>
"set nocompatible
"let g:coc_disable_startup_warning = 1
nmap <C-x> <esc>:NERDTreeToggle<CR>
"nmap <F7> :TagbarToggle<CR>
nmap <C-z> <esc>:TagbarToggle<CR>
packloadall
set smartcase
set ignorecase
filetype plugin indent on
syntax enable
"set foldmethod=indent
set foldmethod=indent
"set foldmethod=marker 
"set foldmarker={{{,}}}
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
set completeopt+=preview
set guioptions-=L
let mapleader=","
map <Leader>ga <esc>:!git add . <CR>
map <Leader>gc <esc>:!git commit -m ""
map <Leader>gs <esc>:!git status <CR>
map <Leader>gi <esc>:!git init . <CR>
map <Leader>gp <esc>:!git push <CR>
" =============================================================
" Alternate between buffers
" =============================================================
nnoremap <C-q> <esc>:bnext<CR> 
nnoremap <C-e> <esc>:bprevious<CR>
"nnoremap <C-2> <esc>:b
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"autocmd VimEnter * NERDTree
" =============================================================
" Custom startify
" =============================================================
" Update session automatically as you exit vim
let g:startify_session_persistence    = 1

" Simplify the startify list to just recent files and sessions
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ ]

let g:startify_custom_header = [
  \ "   ",
  \ '   ╻ ╻             ╻             ┏┳┓',
  \ '   ┃┏┛             ┃             ┃┃┃',
  \ '   ┗┛              ╹             ╹ ╹',
  \ '   ',
  \ ]
"nnoremap <C-z> <esc>:w!<CR>:SClose<CR>
" =============================================================
" set the defautl clipboard application
" =============================================================
set clipboard=unnamed,unnamedplus
set showmatch 
set list lcs=tab:\¦\ 
" =============================================================
" Make cursor a line in insert 
" =============================================================
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[2 q"
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"
" =============================================================
" Keep VisualMode after indent with > or <
" =============================================================
vmap < <gv
vmap > >gv
" =============================================================
" Move visual blocks with J and K
" =============================================================
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" =============================================================
" Autocmd to remember last editing position
" =============================================================
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
augroup END
" =============================================================
" Install a PLUGIN
" =============================================================
" Install vim-plug for vim and neovim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
" Plugins here !!!!
"Plug 'sjl/gundo.vim'
Plug 'vim-scripts/c.vim'
Plug 'shawncplus/phpcomplete.vim'
"Plug 'vim-scripts/taglist.vim'
Plug 'rust-lang/rust.vim'
"Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'szw/vim-tags'
Plug 'vim-scripts/java_getset.vim'
Plug 'lvht/phpcd.vim'
Plug 'scrooloose/syntastic'
Plug 'othree/jspc.vim'
Plug 'mhinz/vim-signify'
Plug 'bling/vim-bufferline'
"Plug 'mgee/lightline-bufferline'
"Plug 'junegunn/goyo.vim'
"Plug 'bryanjswift/vim-rust'
"Plug 'timonv/vim-cargo'
Plug 'airblade/vim-gitgutter'
"Plug 'majutsushi/tagbar'
"Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'  " Tab/Space trough projects
Plug 'sheerun/vim-polyglot'
call plug#end()
set list lcs=trail:·,tab:»· 
" =============================================================
" Syntastic config
" =============================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" =============================================================
" Coc-snippets
" =============================================================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" =============================================================
" Ale for C lang config
" =============================================================
"let g:ale_c_clang_options="-I/usr/lib/clang/7.0.1/include"
" =============================================================
" Gundo vim UNDO TREE
" =============================================================
nnoremap <F5> :GundoToggle<CR>
" =============================================================
" Xdebug config
" =============================================================
let g:dbgPavimBreakAtEntry = 1
" =============================================================
" COnfiguring php autocomplete
" =============================================================
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',
    \ 'coc-python',
	\ 'coc-diagnostic'
    \]
silent! helptags ALL
"config for coc ================================================
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  "number
  set signcolumn=yes
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"autocmd CursorHold * silent call CocActionAsync('highlight')
" Formatting selected code.
let mapleader=","
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"===============================================================
set cmdheight=2
set updatetime=100
let g:GitGutterLineHighlightsEnable = 1
let g:GitGutterLineHighlightsEnable = 1
let g:GitGutterSignsEnable = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
"let g:ale_completion_enabled = 1
"let g:ale_asyncomplete_integration = 1
"let g:ale_set_balloons = 1
"let g:ale_cursor_detail = 1
"let g:ale_echo_delay = 10
"let g:ale_floating_preview = 10
" Fix files with prettier, and then ESLint.
"let b:ale_fixers = ['prettier', 'eslint']
let g:ycm_autoclose_preview_window_after_completion = 1
" menu,menuone,popup
set completeopt=menu,longest,menuone
" ==============================================================
"let g:ale_cache_executable_check_failures = v:null
"let g:ale_change_sign_column_color = v:null
"let g:ale_command_wrapper = 1
"let g:ale_completion_delay = 1
"let g:ale_completion_enabled = 0
"let g:ale_completion_max_suggestions = 20
"let g:ale_disable_lsp = 0
"let g:ale_echo_cursor = 1
"let g:ale_echo_msg_error_str = 'Error'
"let g:ale_echo_msg_format = v:null
"let g:ale_echo_msg_info_str = 'Info'
"let g:ale_echo_msg_warning_str = 'Warning'
"let g:ale_enabled = 1
"let g:ale_fix_on_save = 0
"let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['eslint']}
"let g:ale_history_enabled = 1
"let g:ale_history_log_output = 1
"let g:ale_keep_list_window_open = 1
"let g:ale_lint_delay = 3
"let g:ale_lint_on_enter = 1
"let g:ale_lint_on_filetype_changed = 1
"let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_linters_ignore = {}
"let g:ale_list_vertical = v:null
"let g:ale_list_window_size = v:null
"let g:ale_loclist_msg_format = v:null
"let g:ale_lsp_root = {}
"let g:ale_max_buffer_history_size = 20
"let g:ale_max_signs = v:null
"let g:ale_maximum_file_size = v:null
"let g:ale_open_list = v:null
"let g:ale_pattern_options = v:null
"let g:ale_pattern_options_enabled = v:null
"let g:ale_set_balloons = 1
"let g:ale_set_highlights = 1
"let g:ale_set_loclist = 1
"let g:ale_set_quickfix = 0
"let g:ale_set_signs = 1
"let g:ale_sign_column_always = 1
"let g:ale_sign_highlight_linenrs = v:null
"let g:ale_statusline_format = v:null
"let g:ale_use_global_executables = v:null
"==============================================
"Load theme (in this case loads the Dracula's theme)
"==============================================
"packadd! molokai
packadd! dracula
syntax enable
colorscheme dracula
"colorscheme molokai
set cursorcolumn
set cursorline
filetype plugin on
syntax on
set hlsearch
set mouse=a
set ttymouse=xterm
set mousemodel=popup_setpos
"copen
" ==============================================
" Map the cv keys to split the screen vertically
" ==============================================
let mapleader=","
nnoremap <leader>v :vsplit %<cr>
nnoremap <leader>h :split %<cr>
nnoremap <leader>pp :! cp % %.pdf<cr>
" ==============================================
" Make the vim check the filetype and autmatic 
" put a header in it
" ==============================================
augroup Templates
  autocmd!
  autocmd BufNewFile *.c 0r /home/ma7ry/.vim/templates/base.c
  autocmd BufNewFile *.rs 0r /home/ma7ry/.vim/templates/base.rs
  autocmd BufNewFile *.sh 0r /home/ma7ry/.vim/templates/base.sh
  autocmd BufNewFile *.cpp 0r /home/ma7ry/.vim/templates/base.cpp
augroup END
" ==============================================
" Augroup to open TagbarToggle in specifics files
" ==============================================
"let ft = &filetype
"if ft == 'c' || ft == 'cpp' || ft == 'rs' || ft == 'sh' || ft == 'php'
"  :TagbarToggle
"endif
"set filetype=c.cpp.rs.sh.php.js
augroup OpenTagbar
  autocmd!
  autocmd VimEnter *.c TagbarToggle
  autocmd VimEnter *.h TagbarToggle
  autocmd VimEnter *.mk TagbarToggle
  autocmd VimEnter *.cpp TagbarToggle
  autocmd VimEnter *.rs TagbarToggle
  autocmd VimEnter *.sh TagbarToggle
  autocmd VimEnter *.php TagbarToggle
  autocmd VimEnter *.js TagbarToggle
augroup END
"===============================================
"Mundo tree undo visualizer
"===============================================
"nnoremap <F5> :MundoToggle<CR>
"let g:mundo_width = 60
"let g:mundo_preview_height = 40
"let g:mundo_right = 1
" ===============================================
" vim-airline theme
" ================================================
"let g:airline_theme='simple'
"let g:airline_theme='molokai'
let g:airline_theme='badwolf'
"let g:airline_theme='behelit'
"let g:airline_theme='zenburn'

" ===============================================
" vertical identation
" ===============================================
"map <C-i> <esc>:IndentLinesToggle<cr>
"let g:indentLine_setColors = 9
let g:indentLine_char = '┊'

" vim-airline
set statusline=2

" ===============================================
" NerdCommenter
" ================================================
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1

" ===============================================
" deoplete
" ===============================================
let g:deoplete#enable_at_startup = 1
"================================================
" command to compiling and debugg rust code
"================================================
map <C-A> <esc>:w <cr> :! clear && cargo run %<cr>
let g:indentLine_setColors = 1
"let g:indentLine_char = '|'
" ===============================================
" simple function to show a banner on vim startup
" ===============================================
"fu! Say(msg)
"  set noruler noshowcmd
"  echo a:msg
"endfu
"set ruler showcmd
"call Say("██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗\n██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝\n██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗\n██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝\n╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗\n ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝\n\nOpenning the file...\n\n\n")
"================================================
" command to compiling and debugg C code
"================================================
map <C-h> <esc>:w <cr> :! clear && gcc -Wall -fasynchronous-unwind-tables -fstack-clash-protection -g3 -O2 -Werror=format-security % -o %run -lm && ./%run<cr>
"&& x86_64-w64-mingw32-gcc %<cr>
" ===============================================
" Command to compilling and debugg C++ code
" ===============================================
map <C-g> <esc>:w <cr> :! clear && g++ -Wall % -o %run && ./%run<cr>
" =============================================================
setlocal sm
set shiftwidth=2
set softtabstop=4
set tabstop=4
set viminfo=%,'50,\"100,:100,n
set undolevels=1000  " undoing 1000 changes should be enough :-)
set updatecount=100  " write swap file to disk after each 20 characters
set updatetime=6000  " write swap file to disk after 6 inactive seconds
set noerrorbells " don't make noise
set incsearch " habilita busca incremental
set ts=4 " Paradas de tabulação com 4 espaços
"==================================================
"make a shortcut to hide the comment in a program using F10 key
" =================================================
fu! Comm0n0ff()
	if !exists('g:hiddcomm')
		"ctermfg = 016 234 53
		let g:hiddcomm=1 | hi Comment ctermfg=016 guifg=#000000
	else
		"ctermfg = 046 201
		unlet g:hiddcomm | hi Comment ctermfg=201 guifg=#00ff00 term=none
	endif
endfu
map <F10> <esc>:call Comm0n0ff()<cr>
" =================================================
" open the libreoffice if the new file is a pdf, docx or any other format not
" supported in terminal
" =================================================
let ext = &filetype
if ext == 'pdf' || ext == 'docx' || ext == 'odt'
  :! open %
elseif ext == 'ods' || ext == 'xlsx' || ext == 'xlsm' || ext == 'xls' || ext == 'xltx' || ext == 'xltm'
  :! oen-calc %
endif
"==================================================
"make a shortcut to comment a line in a program
"==================================================
function! Comment()
  "let ext = tolower(expand('%:e'))
let mapleader=","
  let ext = &filetype
  if ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^/\#/
"  elseif ext == 'js'
"    silent s:^:\/\/:g
  elseif ext == 'vim'
    silent s:^:\":g
  elseif ext == 'c' || ext == 'cs' || ext == 'cpp' || ext == 'rs' || ext == 'js' || ext == 'php'
    silent s:^:\/\/:g
  endif
endfunction
map <leader>cc <esc>:call Comment()<cr>
"==================================================
"make a shortcut to uncomment a line in a program
"==================================================
function! Uncomment()
  "let ext = tolower(expand('%:e'))
let mapleader=","  
  let ext = &filetype
  if ext == 'rb' || ext == 'sh' || ext == 'py'
    "s/^\#//
    silent s/\#//
  elseif ext == 'js'
    "s:^\/\/::
    silent s:^\/\/::
  elseif ext == 'vim'
    silent s:^\"::g
  elseif ext == 'c' || ext == 'cs' || ext == 'cpp' || ext == 'rs' || ext == 'js' || ext == 'php'
    "s:^\/\/::g
    silent s:\/\/::
endif
endfunction
map <leader>uu <esc>:call Uncomment()<cr>
" =================================================
" create an alias to c lang for always that its gonna createa main.c file
" the vim automatically make the traditional header of it
" =================================================
" =================================================
" dont difference the lower/upper case when save and quit 
" =================================================
cab wq <esc>:wq!
cab q <esc>:q!
cab w <esc>:w!
cab W! <esc>:w!
cab Wq! <esc>:wq!
cab wQ! <esc>:wq!
cab WQ! <esc>:wq!
cab Q!  <esc>:q!
" =================================================
" General Config 
" =================================================
"
" =================================================
" turn on/off the numeration of lines 
" =================================================
"map <F9> <esc>:set nu!<cr>
nnoremap <F8> :NumbersToggle<CR>
nnoremap <F9> :NumbersOnOff<CR>
let s:numbers_version = '0.5.0'

if exists("g:loaded_numbers") && g:loaded_numbers
    finish
endif
let g:loaded_numbers = 1

if (!exists('g:enable_numbers'))
    let g:enable_numbers = 1
endif

if (!exists('g:numbers_exclude'))
    let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'Mundo', 'MundoDiff']
endif

if v:version < 703 || &cp
    echomsg "numbers.vim: you need at least Vim 7.3 and 'nocp' set"
    echomsg "Failed loading numbers.vim"
    finish
endif


"Allow use of line continuation
let s:save_cpo = &cpo
set cpo&vim

let s:mode=0
let s:center=1

function! NumbersRelativeOff()
    if has('nvim')
        set norelativenumber
        set number
    elseif v:version > 703 || (v:version == 703 && has('patch1115'))
        set norelativenumber
    else
        set number
   endif
endfunction

function! SetNumbers()
    let s:mode = 1
    call ResetNumbers()
endfunc

function! SetRelative()
    let s:mode = 0
    call ResetNumbers()
endfunc

function! NumbersToggle()
    if (s:mode == 1)
        let s:mode = 0
        set relativenumber
    else
        let s:mode = 1
        call NumbersRelativeOff()
    endif
endfunc

function! ResetNumbers()
    if(s:center == 0)
        call NumbersRelativeOff()
    elseif(s:mode == 0)
        set relativenumber
    else
        call NumbersRelativeOff()
    end
    if index(g:numbers_exclude, &ft) >= 0
        setlocal norelativenumber

        setlocal nonumber
    endif
endfunc

function! Center()
    let s:center = 1
    call ResetNumbers()
endfunc

function! Uncenter()
    let s:center = 0
    call ResetNumbers()
endfunc


function! NumbersEnable()
    let g:enable_numbers = 1
    set relativenumber
    set number
    augroup enable
        au!
        autocmd InsertEnter * :call SetNumbers()
        autocmd InsertLeave * :call SetRelative()
        autocmd BufNewFile  * :call ResetNumbers()
        autocmd BufReadPost * :call ResetNumbers()
        autocmd FocusLost   * :call Uncenter()
        autocmd FocusGained * :call Center()
        autocmd WinEnter    * :call SetRelative()
        autocmd WinLeave    * :call SetNumbers()
    augroup END
endfunc

function! NumbersDisable()
    let g:enable_numbers = 0
    :set nu
    :set nu!
    augroup disable
        au!
        au! enable
    augroup END
endfunc

function! NumbersOnOff()
    if (g:enable_numbers == 1)
        call NumbersDisable()
    else
        call NumbersEnable()
    endif
endfunc

" Commands
command! -nargs=0 NumbersToggle call NumbersToggle()
command! -nargs=0 NumbersEnable call NumbersEnable()
command! -nargs=0 NumbersDisable call NumbersDisable()
command! -nargs=0 NumbersOnOff call NumbersOnOff()

" reset &cpo back to users setting
let &cpo = s:save_cpo

if (g:enable_numbers)
    call NumbersEnable()
endif

"==================================================
"autocomplete of keys
"==================================================
"inoremap {     {}<Left>
"inoremap {<CR> {<CR>}<Esc>0
"inoremap {{    {
"inoremap {}    {}
"inoremap (     ()<Left>
"inoremap (<CR> (<CR>)<Esc>
"inoremap ((    (
"inoremap ()    ()
"inoremap [     []<Left>
"inoremap [<CR> [<CR>]<Esc>0
"inoremap [[    [
"inoremap []    []
"
imap { {}<left>
imap [ []<left>
imap ( ()<left>
"==================================================
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
"=================================================
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" =================================================
set hidden

"==================================================
"turn on syntax highlighting
"==================================================
syntax on

" =============================================== abreviations
" ========================================
iab 'c ç
iab 'C Ç
iab 'a á
iab 'A Á
iab "a à
iab "A À
iab 'i í
iab 'Í Í
iab ~a ã
iab ~A Ã
ab tambem também
ab tbm também
iab teh the
iab latex \LaTeX\
iab mA <adalberto.luiz.santos.junior@gmail.com>
ab aljr Adalberto Luiz Dos Santos Junior
ab vc você
iab teh the
iab a. ª
iab analize análise
iab angulo ângulo
iab apos após
iab apra para
iab aqeule aquele
iab aqiulo aquilo
iab arcoíris arco-íris
iab aré até
iab asim assim
iab aspeto aspecto
iab assenção ascenção
iab assin assim
iab assougue açougue
iab aue que
iab augum algum
iab augun algum
iab ben bem
iab beringela berinjela
iab bon bom
iab cafe café
iab caichote caixote
iab capitões capitães
iab cidadães cidadãos
iab ckaro claro
iab cliche clichê
iab compreenssão compreensão
iab comprensão compreensão
iab comun comum
iab con com
iab contezto contexto
iab corrijir corrigir
iab coxixar cochichar
iab cpm com
iab cppara para
iab dai daí
iab danca dança
iab decer descer
iab definitamente definitivamente
iab deshonestidade desonestidade
iab deshonesto desonesto
iab detale detalhe
iab deven devem
iab díficil difícil
iab distingeu distingue
iab dsa das
iab dze dez
iab ecessão exceção
iab ecessões exceções
iab eentão e então
iab emb bem
iab ems sem
iab emu meu
iab en em
iab enbora embora
iab equ que
iab ero erro
iab erv ver
iab ese esse
iab esselência excelência
iab esu seu
iab excessão exceção
iab Excesões exceções
iab excurção excursão
iab Exenplo exemplo
iab exeplo exemplo
iab exijência exigência
iab exijir exigir
iab expontâneo espontâneo
iab ezemplo exemplo
iab ezercício exercício
iab faciu fácil
iab fas faz
iab fente gente
iab ferias férias
iab geito jeito
iab gibóia jibóia
iab gipe jipe
iab ha há
iab hezitação hesitação
iab hezitar hesitar
iab http:\\ http:
iab iigor igor
iab interesado interessado
iab interese interesse
iab Irria Iria
iab isot isto
iab ítens itens
iab ja já
iab jente gente
iab linux GNU/Linux
iab masi mais
iab maz mas
iab con com
iab mema mesma
iab mes mês
iab muinto muito
iab nao não
iab nehum nenhum
iab nenina menina
iab noã não
iab no. nº
iab N. Nº
iab o. º
iab obiter obter
iab observacao observação
iab ons nos
iab orijem origem
iab ospital hospital
iab poden podem
iab portugu6es português
iab potuguês português
iab precisan precisam
iab própio próprio
iab quado quando
iab quiz quis
iab recizão rescisão
iab sanque sangue
iab sao são
iab sen sem
iab sensivel sensível
iab sequéncia seqüência
iab significatimente significativam
iab sinceranete sinceramente
iab sovre sobre
iab susseder suceder
iab tanbem também
iab testo texto
iab téxtil têxtil
iab tydo tudo
iab una uma
iab unico único
iab utilise utilize
iab vega veja
iab vja veja
iab voc6e você
iab wue que
iab xave chave

iab 1a. 1ª
iab 2a. 2ª
iab 3a. 3ª
iab 4a. 4ª
iab 5a. 5ª
iab 6a. 6ª
iab 7a. 7ª
iab 8a. 8ª
iab 9a. 9ª
iab 10a. 10ª
iab 11a. 11ª
iab 12a. 12ª
iab 13a. 13ª
iab 14a. 14ª
iab 15a. 15ª
iab 1o. 1º
iab 2o. 2º
iab 3o. 3º
iab 4o. 4º
iab 5o. 5º
iab 6o. 6º
iab 7o. 7º
iab 8o. 8º
iab 9o. 9º
"
" =================================================
" Turn Off Swap Files 
" =================================================
"set noswapfile
"set nobackup
"set nowb
" =================================================
" Turn on Swap Files
" =================================================
set undodir=~/.vim/.undo// 

set backupdir=~/.vim/.backup// 

set directory=~/.vim/.swp// 

" identention set
set autoindent
set smartindent
set smarttab
"set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
"
" Vim Color File
" Name:       challenger_deep.vim
" Version:    2.0
" Maintainer: github.com/MaxSt
" License:    The MIT License (MIT)
" Based On: pencil by github.com/reedes and github.com/mattly
"
"hi clear
"
"if exists('syntax on')
"    syntax reset
"endif
"
"let g:colors_name='challenger_deep'
"set background=dark
"
"
"if ! exists("g:challenger_deep_termcolors")
"  let g:challenger_deep_termcolors = 256
"endif
"
"" not all terminals support italics properly.  If yours does, opt-in.
"if ! exists("g:challenger_deep_terminal_italics")
"  let g:challenger_deep_terminal_italics = 0
"endif
"
""" Colors                          "#212121"          "16"
"let s:black           = { "gui": "#212121", "cterm": "0", "cterm16" : "8" }
"let s:medium_gray     = { "gui": "#767676", "cterm": "243", "cterm16" : "243" }
"let s:white           = { "gui": "#F3F3F3", "cterm": "15", "cterm16" : "15" }
"let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231", "cterm16" : "231" }
"let s:light_black     = { "gui": "#424242", "cterm": "8", "cterm16" : "0" }
"let s:lighter_black   = { "gui": "#545454", "cterm": "240", "cterm16" : "240" }
""                                 "#545454"
"" lighter shadows and darker grays
"let s:subtle_black  = { "gui": "#303030", "cterm": "236", "cterm16" : "236" }
"let s:light_gray    = { "gui": "#B2B2B2", "cterm": "249", "cterm16" : "249" }
"let s:lighter_gray  = { "gui": "#C6C6C6", "cterm": "251", "cterm16" : "251" }
"
"" flat colors:
""let s:asphalt = { "gui": "#1e1c31", "cterm": "233", "cterm16": "NONE"}
"let s:asphalt = { "gui": "#000000", "cterm": "NONE", "cterm16": "NONE"}
"let s:asphalt_subtle= { "gui": "#0b4c3b", "cterm": "236", "cterm16": "0"} "100e23   232
"let s:dark_asphalt = { "gui": "#565575", "cterm": "255", "cterm16": "8"} " 236
"
"let s:red = { "gui": "#ff8080", "cterm": "204", "cterm16": "1"}
"let s:dark_red = { "gui": "#ff5458", "cterm": "203", "cterm16": "9"}
"
"let s:green = { "gui": "#95ffa4", "cterm": "120", "cterm16": "2"}
"let s:dark_green = { "gui": "#62d196", "cterm": "119", "cterm16": "10"}
"
"let s:yellow = { "gui": "#ffe9aa", "cterm": "228", "cterm16": "3"}
"let s:dark_yellow = { "gui": "#ffb378", "cterm": "215", "cterm16": "11"}
"
"let s:blue = { "gui": "#91ddff", "cterm": "159", "cterm16": "4"}
"let s:dark_blue = { "gui": "#65b2ff", "cterm": "75", "cterm16": "12"}
"
"let s:purple = { "gui": "#c991e1", "cterm": "141", "cterm16": "5"}
"let s:dark_purple = { "gui": "#906cff", "cterm": "135", "cterm16": "13"}
"
"let s:cyan = { "gui": "#aaffe4", "cterm": "122", "cterm16": "6"}
"let s:dark_cyan = { "gui": "#63f2f1", "cterm": "121", "cterm16": "14"}
"
"let s:clouds = { "gui": "#cbe3e7", "cterm": "253", "cterm16": "7"}
"let s:dark_clouds = { "gui": "#a6b3cc", "cterm": "252", "cterm16": "15"}
"
"let s:bg              = s:asphalt
"let s:bg_subtle       = s:asphalt_subtle
"let s:bg_dark         = s:dark_asphalt
"let s:norm            = s:clouds
"let s:norm_subtle     = s:dark_clouds
"let s:visual          = s:bg_dark
"
"let s:head_a         = s:dark_blue
"let s:head_b         = s:blue
"let s:head_c         = s:dark_cyan
"
"" shamelessly stolen from hemisu: https://github.com/noahfrederick/vim-hemisu/
"function! s:h(group, style)
"  " Not all terminals support italics properly. If yours does, opt-in.
"  if g:challenger_deep_terminal_italics == 0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
"    unlet a:style.cterm
"  endif
"  if g:challenger_deep_termcolors == 16
"    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
"    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
"  else
"    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
"    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
"  end
"  execute "highlight" a:group
"    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
"    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
"    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
"    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
"    \ "ctermfg=" . l:ctermfg
"    \ "ctermbg=" . l:ctermbg
"    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
"endfunction
"
"" common groups ================================================================
"" (see `:h w18`)
"
"call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
"call s:h("Cursor",        {"bg": s:blue, "fg": s:bg_dark})
"call s:h("Comment",       {"fg": s:medium_gray, "gui": "italic", "cterm": "italic"})
"
"call s:h("Constant",      {"fg": s:yellow})
"hi! link String           Constant
"hi! link Character        Constant
"
"call s:h("Number",       {"fg": s:dark_yellow})
"hi! link Boolean          Constant
"hi! link Float            Constant
"
"call s:h("Identifier",    {"fg": s:purple})
"hi! link Function         Identifier
"
"call s:h("Label",        {"fg": s:dark_blue})
"hi! link Conditonal       Statement
"hi! link Exception        Statement
"
"call s:h("Operator",     {"fg": s:dark_cyan})
"hi! link Repeat           Operator
"
"call s:h("PreProc",       {"fg": s:green})
"hi! link Include          PreProc
"hi! link Define           PreProc
"hi! link Macro            PreProc
"hi! link PreCondit        PreProc
"
"
"call s:h("Keyword",       {"fg": s:red})
"hi! link Statement        Keyword
"
"call s:h("Type",          {"fg": s:blue})
"hi! link StorageClass     Type
"hi! link Structure        Type
"hi! link Typedef          Type
"
"call s:h("Special",       {"fg": s:cyan})
"hi! link SpecialChar      Special
"hi! link Tag              Special
"hi! link Delimiter        Special
"hi! link SpecialComment   Special
"hi! link Debug            Special
"
"call s:h("Underlined",    {"fg": s:norm                      , "gui": "underline", "cterm": "underline"})
"call s:h("Ignore",        {"fg": s:bg                                                                  })
"call s:h("Error",         {"fg": s:dark_red, "bg": s:bg_subtle , "gui": "bold"     , "cterm": "bold"     })
"call s:h("Todo",          {"fg": s:dark_yellow, "bg": s:bg_subtle, "gui": "bold"     , "cterm": "bold"     })
"
"" ui chrome ====================================================================
"" ordered according to `:help hitest.vim`
"
"call s:h("SpecialKey",    {"fg": s:blue})
"call s:h("Boolean",    {"fg": s:dark_yellow})
"call s:h("Number",    {"fg": s:dark_yellow})
"call s:h("Float",    {"fg": s:dark_yellow})
"call s:h("NonText",       {"fg": s:bg_dark})
"call s:h("Directory",     {"fg": s:purple})
"call s:h("ErrorMsg",      {"fg": s:dark_red})
"call s:h("IncSearch",     {"bg": s:red, "fg": s:clouds})
"call s:h("Search",        {"bg": s:bg_dark})
"call s:h("MoreMsg",       {"fg": s:medium_gray, "gui": "bold", "cterm": "bold"})
"hi! link ModeMsg MoreMsg
"call s:h("LineNr",        {"fg": s:dark_asphalt, "bg": s:bg_subtle})
"call s:h("CursorLineNr",  {"bg": s:bg_subtle, "fg": s:blue, "gui": "bold"})
"call s:h("Question",      {"fg": s:red})
"call s:h("StatusLine",    {"bg": s:bg_dark})
"call s:h("Conceal",       {"fg": s:norm})
"call s:h("StatusLineNC",  {"bg": s:bg_dark, "fg": s:medium_gray})
"call s:h("VertSplit",     {"fg": s:bg_subtle})
"call s:h("Title",         {"fg": s:dark_blue})
"call s:h("Visual",        {"bg": s:visual})
"call s:h("WarningMsg",    {"fg": s:yellow})
"call s:h("WildMenu",      {"fg": s:bg_subtle, "bg": s:cyan})
"call s:h("Folded",        {"bg": s:purple, "fg": s:bg_subtle})
"call s:h("FoldColumn",    {"fg": s:yellow})
"call s:h("DiffAdd",       {"fg": s:green})
"call s:h("DiffDelete",    {"fg": s:red})
"call s:h("DiffChange",    {"fg": s:dark_yellow})
"call s:h("DiffText",      {"fg": s:dark_blue})
"call s:h("SignColumn",    {"fg": s:green})
"
"if has("gui_running")
"  call s:h("SpellBad",    {"gui": "underline", "sp": s:dark_red})
"  call s:h("SpellCap",    {"gui": "underline", "sp": s:green})
"  call s:h("SpellRare",   {"gui": "underline", "sp": s:red})
"  call s:h("SpellLocal",  {"gui": "underline", "sp": s:dark_green})
"else
"  call s:h("SpellBad",    {"cterm": "underline", "fg": s:dark_red})
"  call s:h("SpellCap",    {"cterm": "underline", "fg": s:green})
"  call s:h("SpellRare",   {"cterm": "underline", "fg": s:red})
"  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:dark_green})
"endif
"call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
"call s:h("PmenuSel",      {"fg": s:norm, "bg": s:bg_dark})
"call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_dark})
"call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_dark})
"call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_dark})
"call s:h("TabLineSel",    {"fg": s:norm, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
"call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_dark})
"call s:h("CursorColumn",  {"bg": s:bg_subtle})
"call s:h("CursorLine",    {"bg": s:bg_subtle})
"call s:h("ColorColumn",   {"bg": s:bg_subtle})
"
"" remainder of syntax highlighting
"call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:purple, "gui": "bold", "cterm": "bold"})
"call s:h("qfLineNr",      {"fg": s:medium_gray})
"
"" hi helpHyperTextJump guifg=#5FAFD7 ctermfg=74
"
"" HTML syntax
"hi! link htmlTag          Special
"hi! link htmlEndTag       htmlTag
"
"hi! link htmlTagName      KeyWord
"" html5 tags show up as htmlTagN
"hi! link htmlTagN         Keyword
"
"" HTML content
"call s:h("htmlH1",        {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"     })
"call s:h("htmlH2",        {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"     })
"call s:h("htmlH3",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
"call s:h("htmlH4",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
"call s:h("htmlH5",        {"fg": s:head_c                                            })
"call s:h("htmlH6",        {"fg": s:head_c                                            })
"call s:h("htmlLink",      {"fg": s:blue  , "gui": "underline"  , "cterm": "underline"})
"call s:h("htmlItalic",    {                "gui": "italic"     , "cterm": "italic"   })
"call s:h("htmlBold",      {                "gui": "bold"       , "cterm": "bold"     })
"call s:h("htmlBoldItalic",{                "gui": "bold,italic", "cterm": "bold"     })
"" hi htmlString     guifg=#87875f guibg=NONE gui=NONE        ctermfg=101 ctermbg=NONE cterm=NONE
"
"" tpope/vim-markdown
"call s:h("markdownBlockquote",          {"fg": s:norm})
"call s:h("markdownBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
"call s:h("markdownBoldItalic",          {"fg": s:norm  , "gui": "bold,italic", "cterm": "bold"  })
"call s:h("markdownEscape",              {"fg": s:norm})
"call s:h("markdownH1",                  {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"  })
"call s:h("markdownH2",                  {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"  })
"call s:h("markdownH3",                  {"fg": s:head_a, "gui": "italic"     , "cterm": "italic"})
"call s:h("markdownH4",                  {"fg": s:head_a, "gui": "italic"     , "cterm": "italic"})
"call s:h("mckarkdownH5",                  {"fg": s:head_a})
"call s:h("markdownH6",                  {"fg": s:head_a})
"call s:h("markdownHeadingDelimiter",    {"fg": s:norm})
"call s:h("markdownHeadingRule",         {"fg": s:norm})
"call s:h("markdownId",                  {"fg": s:medium_gray})
"call s:h("markdownIdDeclaration",       {"fg": s:norm_subtle})
"call s:h("markdownItalic",              {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})
"call s:h("markdownLinkDelimiter",       {"fg": s:medium_gray})
"call s:h("markdownLinkText",            {"fg": s:norm})
"call s:h("markdownLinkTextDelimiter",   {"fg": s:medium_gray})
"call s:h("markdownListMarker",          {"fg": s:norm})
"call s:h("markdownOrderedListMarker",   {"fg": s:norm})
"call s:h("markdownRule",                {"fg": s:norm})
"call s:h("markdownUrl",                 {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
"call s:h("markdownUrlDelimiter",        {"fg": s:medium_gray})
"call s:h("markdownUrlTitle",            {"fg": s:norm})
"call s:h("markdownUrlTitleDelimiter",   {"fg": s:medium_gray})
"call s:h("markdownCode",                {"fg": s:norm})
"call s:h("markdownCodeDelimiter",       {"fg": s:norm})
"
"" plasticboy/vim-markdown
"call s:h("mkdBlockQuote",               {"fg": s:norm})
"call s:h("mkdDelimiter",                {"fg": s:medium_gray})
"call s:h("mkdID",                       {"fg": s:medium_gray})
"call s:h("mkdLineContinue",             {"fg": s:norm})
"call s:h("mkdLink",                     {"fg": s:norm})
"call s:h("mkdLinkDef",                  {"fg": s:medium_gray})
"call s:h("mkdListItem",                 {"fg": s:norm})
"call s:h("mkdNonListItemBlock",         {"fg": s:norm})  " bug in syntax?
"call s:h("mkdRule",                     {"fg": s:norm})
"call s:h("mkdUrl",                      {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
"call s:h("mkdCode",                     {"fg": s:norm})
"call s:h("mkdIndentCode",               {"fg": s:norm})
"
"" gabrielelana/vim-markdown
"call s:h("markdownBlockquoteDelimiter", {"fg": s:norm})
"call s:h("markdownInlineDelimiter",     {"fg": s:norm})
"call s:h("markdownItemDelimiter",       {"fg": s:norm})
"call s:h("markdownLinkReference",       {"fg": s:medium_gray})
"call s:h("markdownLinkText",            {"fg": s:norm})
"call s:h("markdownLinkTextContainer",   {"fg": s:medium_gray})
"call s:h("markdownLinkUrl",             {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
"call s:h("markdownLinkUrlContainer",    {"fg": s:medium_gray})
"call s:h("markdownFencedCodeBlock",     {"fg": s:norm})
"call s:h("markdownInlineCode",          {"fg": s:norm})
"
"" mattly/vim-markdown-enhancements
"call s:h("mmdFootnoteDelimiter",        {"fg": s:medium_gray})
"call s:h("mmdFootnoteMarker",           {"fg": s:norm})
"call s:h("mmdTableAlign",               {"fg": s:norm})
"call s:h("mmdTableDelimiter",           {"fg": s:norm})
"call s:h("mmdTableHeadDelimiter",       {"fg": s:norm})
"call s:h("mmdTableHeader",              {"fg": s:norm})
"call s:h("mmdTableCaptionDelimiter",    {"fg": s:norm})
"call s:h("mmdTableCaption",             {"fg": s:norm})
"
"" Textile content
"" https://github.com/timcharper/textile.vim/blob/master/syntax/textile.vim
""call s:h("txtBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
""call s:h("txtEmphasis",            {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})
"
"" XML content
"hi! link xmlTag                     htmlTag
"hi! link xmlEndTag                  xmlTag
"hi! link xmlTagName                 htmlTagName
"
"" Signify
"call s:h("SignifySignAdd",{"fg": s:green, "bg": s:bg_subtle})
"call s:h("SignifySignDelete",{"fg": s:red, "bg": s:bg_subtle})
"call s:h("SignifySignChange",{"fg": s:yellow, "bg": s:bg_subtle})
"call s:h("SignifySignDeleteFirstLine",{"fg": s:red, "bg": s:bg_subtle})
"
"" GitGutter
"call s:h("GitGutterAdd",{"fg": s:green, "bg": s:bg_subtle})
"call s:h("GitGutterDelete",{"fg": s:red, "bg": s:bg_subtle})
"call s:h("GitGutterChange",{"fg": s:yellow, "bg": s:bg_subtle})
"call s:h("GitGutterChangeDelete",{"fg": s:red, "bg": s:bg_subtle})
"
"
""nvim terminal colors
"let g:terminal_color_0 = s:bg_dark.gui
"let g:terminal_color_1 = s:red.gui
"let g:terminal_color_2 = s:green.gui
"let g:terminal_color_3 = s:yellow.gui
"let g:terminal_color_4 = s:blue.gui
"let g:terminal_color_5 = s:purple.gui
"let g:terminal_color_6 = s:cyan.gui
"let g:terminal_color_7 = s:clouds.gui
"let g:terminal_color_8 = s:bg_subtle.gui
"let g:terminal_color_9 = s:dark_red.gui
"let g:terminal_color_10 = s:dark_green.gui
"let g:terminal_color_11 = s:dark_yellow.gui
"let g:terminal_color_12 = s:dark_blue.gui
"let g:terminal_color_13 = s:dark_purple.gui
"let g:terminal_color_14 = s:dark_cyan.gui
"let g:terminal_color_15 = s:dark_clouds.gui
