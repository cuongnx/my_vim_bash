" Environment {

" Identify platform {
silent function! OSX()
return has('macunix')
        endfunction
        silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
endfunction
" }

" Basics {
set nocompatible        " Must be first line
if !WINDOWS()
    set shell=/bin/sh
endif
" }

" Windows Compatible {
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
" }

" }

" Bundles config {
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/my_vim_bash/mvim/.vim/bundle/Vundle.vim
call vundle#begin("~/my_vim_bash/mvim/.vim/bundle/")
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" find files
Plugin 'kien/ctrlp.vim'
" check syntax
Plugin 'scrooloose/syntastic'
" comment shortcuts
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'evgenyzinoviev/vim-vendetta'
" html close tag
Plugin 'docunext/closetag.vim'
" autoclose braces
Plugin 'Raimondi/delimitMate'
" auto complete 
Plugin 'Shougo/neocomplcache.vim'
" custom statusline, tabline
Plugin 'vim-airline/vim-airline'
" indent for html
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
" indent, syntax for javscript
Plugin 'pangloss/vim-javascript'
" syntax for smarty
Bundle 'blueyed/smarty.vim'
" grep plugin
Bundle 'yegappan/grep'
" one dark theme
Plugin 'joshdick/onedark.vim'

" Optional:
call vundle#end()            " required
filetype plugin indent on    " required
" }

let &rtp = "~/my_vim_bash/mvim/.vim,".&rtp

" General {
" Set color for xterm-256color
if &term =~ "xterm"
    " 256 colors
    let &t_Co = 256
    " restore screen after quitting
    let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l\<Esc>8"
    if has("terminfo")
        let &t_Sf = "\<Esc>[3%p1%dm"
        let &t_Sb = "\<Esc>[4%p1%dm"
    else
        let &t_Sf = "\<Esc>[3%dm"
        let &t_Sb = "\<Esc>[4%dm"
    endif
endif

set background=dark         " Assume a dark background
" if !has('gui')
"set term=$TERM          " Make arrow and other keys work
" endif
filetype plugin indent on   " Automatically detect file types.
set ffs=unix,dos,mac
syntax on                   " Syntax highlighting
set mouse=v                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,default,latin1

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" Most prefer to automatically switch to the current file directory when
" a new buffer is opened; to prevent this behavior, add the following to
" your .vimrc.before.local file:
let g:spf13_no_autochdir = 1
if !exists('g:spf13_no_autochdir')
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " Always switch to the current file directory
endif

"set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
"set spell                           " Spell checking on
"set hidden                          " Allow buffer switching without saving

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
" To disable this, add the following to your .vimrc.before.local file:
"   let g:spf13_no_restore_cursor = 1
if !exists('g:spf13_no_restore_cursor')
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
endif

" Setting up the directories {
set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" To disable views add the following to your .vimrc.before.local file:
"   let g:spf13_no_views = 1
if !exists('g:spf13_no_views')
    " Add exclusions to mkview and loadview
    " eg: *.*, svn-commit.tmp
    let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
endif
" }

" }

" Vim UI {
colorscheme onedark               " Load a colorscheme
let g:indent_guides_enable_on_vim_startup=1
set tabpagemax=50               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

"highlight clear SignColumn      " SignColumn should match background
"highlight clear LineNr          " Current line number row will have same background color in relative mode
"let g:CSApprox_hook_post = ['hi clear SignColumn']
"highlight clear CursorLineNr    " Remove highlight color from current line number

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
    " Selected characters/lines in visual mode
endif

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set omnifunc=syntaxcomplete#Complete
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:DisableAutoPHPFolding = 1 " Disable autofold
set list listchars=tab:\¦\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set list

" }

" Formatting {

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=2                " Use indents of 4 spaces
"set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
" preceding line best in a plugin but here for now.

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell setlocal nospell

" }
" }


" Save window last position {
"================== save window last positions
" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1

if has("gui_running")
    function! ScreenFilename()
        if has('amiga')
            return "s:.vimsize"
        elseif has('win32')
            return $HOME.'\_vimsize'
        else
            return $HOME.'/.vimsize'
        endif
    endfunction

    function! ScreenRestore()
        " Restore window size (columns and lines) and position
        " from values stored in vimsize file.
        " Must set font first so columns and lines are based on font size.
        let f = ScreenFilename()
        if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
            let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
            for line in readfile(f)
                let sizepos = split(line)
                if len(sizepos) == 5 && sizepos[0] == vim_instance
                    silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
                    silent! execute "winpos ".sizepos[3]." ".sizepos[4]
                    return
                endif
            endfor
        endif
    endfunction

    function! ScreenSave()
        " Save window size and position.
        if has("gui_running") && g:screen_size_restore_pos
            let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
            let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
                        \ (getwinposx()<0?0:getwinposx()) . ' ' .
                        \ (getwinposy()<0?0:getwinposy())
            let f = ScreenFilename()
            if filereadable(f)
                let lines = readfile(f)
                call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
                call add(lines, data)
            else
                let lines = [data]
            endif
            call writefile(lines, f)
        endif
    endfunction

    if !exists('g:screen_size_restore_pos')
        let g:screen_size_restore_pos = 1
    endif
    if !exists('g:screen_size_by_vim_instance')
        let g:screen_size_by_vim_instance = 1
    endif
    autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
    autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
" }

" Set temp dir
set dir=~/my_vim_bash/mvim/tmp
set backupdir=~/my_vim_bash/mvim/tmp
if has('persistent_undo')
    set udir=~/my_vim_bash/mvim/tmp
    set noundofile
endif

" set word wrap
set wrap
set linebreak
set nolist  " list disables linebreak

" ename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    highlight link TabNum Special
endif


" setting showing last format configuration
set laststatus=2


" setting for CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<c-t>'],
            \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']
            \ }

" setting Grep plugin
nnoremap <silent> <F2> :Grep <cword><cr><cr>
nnoremap <silent> <F3> :Grep \(function\\\|class\)\ <cword><cr><cr>
nnoremap <silent> <F4> /function\ <C-R>=expand('<cword>')<cr><cr>
let Grep_Default_Filelist=getcwd().'/*'
let Grep_Default_Options='-rn --include=*.{php,html,js,css}'

" My shortcuts 
vnoremap <C-c> "*y
noremap <C-v> "*p
noremap <C-a> ggvG$

" setting open buffer in newtab or switch to existing tab
set switchbuf+=usetab,newtab

" setting quickfix window to close after open file
aug QFClose
    au!
    au BufLeave * if getbufvar(winbufnr(winnr()), "&buftype") == "quickfix" | ccl | endif
aug END

" setting for Neocomplcache
source ~/my_vim_bash/mvim/.neocomplcacherc

" setting for vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t:.'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_splits = 0
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#whitespace#check(),0)}'
" let g:airline_section_error = %{airline#util#wrap(airline#extensions#syntastic#get_warnings(),0)}'
let g:airline_section_warning = ''
let g:airline_section_error = ''

" setting NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup = 1
