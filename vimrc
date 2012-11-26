" .vimrc
" Author: Yves Ineichen
"
" ---------------------------------------------------------------------------
" pathogen

filetype off
call pathogen#runtime_append_all_bundles("bundles")
filetype plugin indent on
set nocompatible
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" first the disabled features due to security concerns

set modelines=0                     " no modelines [http://www.guninski.com/vim1.html]
let g:secure_modelines_verbose=0    " securemodelines vimscript
let g:secure_modelines_modelines=15 " 15 available modelines
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" basic options

set autoindent smartindent    " auto/smart indent
set expandtab                 " expand tabs to spaces
set smarttab                  " tab and backspace are smart
set tabstop=4                 " 4 spaces
set shiftwidth=4              " 4 spaces
set scrolloff=3               " keep at least 3 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set backspace=indent,eol,start
set tw=78                     " default textwidth is a max of 78
set list                      " enable custom list chars
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮    " replace tabs, eol
set fillchars=diff:⣿,vert:│
set showbreak=↪               " show breaks
set colorcolumn=+1
set formatprg=par\ -w80rq
set formatoptions+=t

set encoding=utf-8
set hidden
"set nonumber
"set norelativenumber
set undofile
set undoreload=10000
set shell=/bin/bash
set matchtime=3
set splitbelow
set splitright
set autowrite
set shiftround
set title
set spellfile=~/.vim/custom-dictionary.utf-8.add

set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set nohidden                  " close the buffer when I close a tab
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode                  " show mode on last line
set showcmd                   " Show us the command we're typing
set nocompatible              " vim, not vi
set showfulltag               " show full completion tags
set noerrorbells              " no error bells please
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set foldmethod=syntax         " fold on syntax automagically, always
set foldcolumn=3              " 3 lines of column for fold showing, always
set whichwrap+=<,>,h,l        " backspaces and cursor keys wrap to
set magic                     " Enable the "magic"
set visualbell t_vb=          " Disable ALL bells
set cursorline                " show the cursor line
set matchpairs+=<:>           " add < and > to match pairs
set t_Co=256
set virtualedit+=block

" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let mapleader = ","
let maplocalleader=','        " all my macros start with ,
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
"  configurations for vim or gvim only

syntax on
if !has("gui_running")
    set background=dark
    colorscheme solarized
    let g:AutoClosePreservDotReg=0
else
    colorscheme molokai

    "set background=dark
    "set noantialias
    "set lines=64
    "set columns=135
    "set transparency=0
    "set gfn=Monaco:h9.0
    "set gfn=DejaVu:h10.0
    set guifont=Deja\ Vu\ Sans\ Mono\ 9.

    set guioptions-=T        " no toolbar
    set guioptions-=m        " no menubar
    set guioptions-=l        " no left scrollbar
    set guioptions-=L        " no left scrollbar
    set guioptions-=r        " no right scrollbar
    set guioptions-=R        " no right scrollbar
    set clipboard=unnamed
endif
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Line Return

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Drag Lines

" <m-j> and <m-k> to drag lines in any mode
noremap ∆ :m+<CR>
noremap ˚ :m-2<CR>
inoremap ∆ <Esc>:m+<CR>
inoremap ˚ <Esc>:m-2<CR>
vnoremap ∆ :m'>+<CR>gv
vnoremap ˚ :m-2<CR>gv
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Settings for taglist.vim

let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Settings for :TOhtml

let html_number_lines=1
let html_use_css=1
let use_xhtml=1
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Settings for yankring

let g:yankring_history_dir="~/.vim/"
let g:yankring_history_file="yank.txt"

function! YRRunAfterMaps()
    nnoremap Y :<C-U>YRYankCount 'y$'<CR>
    omap <expr> L YRMapsExpression("", "$")
    omap <expr> H YRMapsExpression("", "^")
endfunction
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Bindings for Narrow/Widen

map <LocalLeader>N :Narrow<cr>
map <LocalLeader>W :Widen<cr>
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" PHP settings

let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=1
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" status line

set laststatus=2

"if has('statusline')
    "function! SetStatusLineStyle()
        "let &stl="%F%m%r%h%w\ [%{&ff}]\ [%Y]\ %P\ %=%{fugitive#statusline()}\ [a=\%03.3b]\ [h=\%02.2B]\ [%l,%v]"
    "endfunc
    "" Not using it at the moment, using a different one
    "call SetStatusLineStyle()

    "if has('title')
        "set titlestring=%t%(\ [%R%M]%)
    "endif
"endif
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
"  searching

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set incsearch                 " incremental search
set ignorecase                " search ignoring case
set smartcase                 " Ignore case when searching lowercase
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync
set gdefault                  " automatically use /g with search & replace

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
"  mouse stuff

"set mouse=a                  " mouse support in all modes
set mousehide                 " hide the mouse when typing
" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
"  backup options
set backup
set backupdir=~/.backup//
set undodir=~/.undos//
set directory=~/.swaps//
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=2000
set noswapfile
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" spelling...

if v:version >= 700

  setlocal spell spelllang=en_us
  nmap <LocalLeader>ss :set spell!<CR>

endif
" default to no spelling
set nospell
set dictionary=/usr/share/dict/words
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Turn on omni-completion for the appropriate file types.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1  " Rails support
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" some useful mappings

" Omnicomplete as Ctrl+Space
inoremap <Nul> <C-x><C-o>
" Also map user-defined omnicompletion as Ctrl+k
inoremap <C-k> <C-x><C-u>
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>
" change directory to that of current file
nmap <LocalLeader>cd :cd%:p:h<cr>
" change local directory to that of current file
nmap <LocalLeader>lcd :lcd%:p:h<cr>
" correct type-o's on exit
nmap q: :q
" save and build
nmap <LocalLeader>wm  :w<cr>:make<cr>
" ,tt will toggle taglist on and off
nmap <LocalLeader>tt :Tlist<cr>
" When I'm pretty sure that the first suggestion is correct
map <LocalLeader>r 1z=
" q: sucks
nmap q: :q
" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %
" Fix the # at the start of the line
inoremap # X<BS>#
" When I forget I'm in Insert mode, how often do you type 'jj' anyway?:
imap jj <Esc>

nnoremap <leader>q gqip
nnoremap <leader>v V']

" undo tree (gundo)
nnoremap <F5> :GundoToggle<CR>

" run pdflatex on currently open file
nmap <LocalLeader>pl :!pdflatex %<cr><cr>
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Ctrl-P

let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = '<leader>,'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }

let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/" .
    \ ")'"

let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files | " .
    \ ctrlp_filter_greps

let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]

nnoremap <leader>. :CtrlPTag<cr>
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" folding
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
nmap <LocalLeader>fo  :%foldopen!<cr>
nmap <LocalLeader>fc  :%foldclose!<cr>

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Powerline

"let g:Powerline_symbols = 'fancy'
"let g:Powerline_cache_enabled = 1
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Python-Mode

let g:pymode_doc = 1
let g:pymode_doc_key = '<localleader>ds'
let g:pydoc = 'pydoc'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 0
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_run = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_utils_whitespaces = 0
let g:pymode_virtualenv = 0
let g:pymode_folding = 0

let g:pymode_options_indent = 0
let g:pymode_options_fold = 0
let g:pymode_options_other = 0

let g:pymode_rope = 1
let g:pymode_rope_global_prefix = "<localleader>R"
let g:pymode_rope_local_prefix = "<localleader>r"
let g:pymode_rope_auto_project = 1
let g:pymode_rope_enable_autoimport = 0
let g:pymode_rope_autoimport_generate = 1
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = 0
let g:pymode_rope_always_show_complete_menu = 0
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Threesome

let g:threesome_leader = "-"

let g:threesome_initial_mode = "grid"

let g:threesome_initial_layout_grid = 1
let g:threesome_initial_layout_loupe = 0
let g:threesome_initial_layout_compare = 0
let g:threesome_initial_layout_path = 0

let g:threesome_initial_diff_grid = 1
let g:threesome_initial_diff_loupe = 0
let g:threesome_initial_diff_compare = 0
let g:threesome_initial_diff_path = 0

let g:threesome_initial_scrollbind_grid = 0
let g:threesome_initial_scrollbind_loupe = 0
let g:threesome_initial_scrollbind_compare = 0
let g:threesome_initial_scrollbind_path = 0

let g:threesome_wrap = "nowrap"
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" NERDTree

noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

augroup ps_nerdtree
    au!

    au Filetype nerdtree setlocal nolist
    au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$',
                    \ 'xapian_index', '.*.pid',
                    \ '.*\.o$', 'db.db', 'tags.bak']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Supertab

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1


" ---------------------------------------------------------------------------
" Fugitive

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
"nnoremap <leader>gl :Shell git l19<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" "Hub"
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" tabs
map <LocalLeader>tc :tabnew %<cr>    " create a new tab
map <LocalLeader>td :tabclose<cr>    " close a tab
map <LocalLeader>tn :tabnext<cr>     " next tab
map <silent><A-Right> :tabnext<cr>   " next tab
map <LocalLeader>tp :tabprev<cr>     " previous tab
map <silent><A-Left> :tabprev<cr>    " previous tab
map <LocalLeader>tm :tabmove         " move a tab to a new location
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" auto load extensions for different file types
if has('autocmd')
        filetype plugin indent on
        syntax on

        autocmd BufReadPost *
                \ if line("'\"") > 0|
                \       if line("'\"") <= line("$")|
                \               exe("norm '\"")|
                \       else|
                \               exe "norm $"|
                \       endif|
                \ endif

        " improve legibility
        au BufRead quickfix setlocal nobuflisted wrap number

        " configure various extenssions
        let git_diff_spawn_mode=2

        " improved formatting for markdown
        " http://plasticboy.com/markdown-vim-mode/
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>

        " strip all whitespaces at save
        autocmd BufWritePre * :%s/\s\+$//e
endif

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END

augroup ft_haskell
    au!
    au BufEnter *.hs compiler ghc
augroup END

augroup ft_mail
    au!

    au Filetype mail setlocal spell
augroup END

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

augroup ft_python
    au!

    " au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    "au FileType python compiler nose
    au FileType man nnoremap <buffer> <cr> :q<cr>

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    " Jesus, Python.  Five characters of punctuation for a damn string?
    au FileType python inoremap <buffer> <c-g> _(u'')<left><left>

    au FileType python inoremap <buffer> <c-b> """"""<left><left><left>
augroup END

" sup format
au BufRead sup.*    set ft=mail
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" syntax highlighting for various Html templating languages in Haskell
au BufEnter *.hamlet  setlocal filetype=hamlet
au BufEnter *.cassius setlocal filetype=cassius
au BufEnter *.julius  setlocal filetype=julius
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" Compile current coffee script buffer to javascript and open in new vsplit
function! CoffeeToJS()
    let res=expand('%')
    exe 'vnew | r !coffee -p ' . res
    set ft=javascript
endfunc
map <LocalLeader>cj :call CoffeeToJS()<cr>
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" vimrc editing. Automatically reload the file after saving it. Because there
" is no point in editing the file and *not* reloading it, right?
nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>
autocmd! bufwritepost .vimrc source %
" ---------------------------------------------------------------------------
