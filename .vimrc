" references
" Configuring Vim for Java Development
" (
" https://averywagar.com/posts/2018/01/configuring-vim-for-java-development/
" Deoplete Javacomplete2 Ale Ultisnips Tagbar Ctrl-P NERD-TREE
" )

" to check where a setting expandtab is done :verbose set expandtab?
" global leader
let mapleader=";"
" leader for specific file type
let maplocalleader="'"

"" vundle could also be used
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" reload .vimrc and run PlugInstall after add a new plugin
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gabrielelana/vim-markdown'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dense-analysis/ale'
"Plug 'vifm/vifm'
" Initialize plugin system
call plug#end()
""--- nerdtree
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeCascadeSingleChildDir = 0
" quit nerdtree when open a file
"let NERDTreeQuitOnOpen = 1
"Automatically quit vim if NERDTree is last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"--- nathanaelkane/vim-indent-guides
let indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=240
" IndentGuides maps
nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle

" ---- plug ALE
"作者：韦易笑
"链接：https://www.zhihu.com/question/47691414/answer/373700711
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"let g:ale_python_pylint_options = ''
"let g:ale_sign_error = "\ue009\ue009"
let g:ale_sign_error = "x"
let g:ale_sign_warning = '!'

let g:ale_fix_on_save = 1
" fixers
let g:ale_fixers = {
			\  '*':[],
			\  'c':['clang-format','uncrustify'],
			\  'cpp':['clang-format','uncrustify'],
			\  'python':['black', 'isort', 'trim_whitespace']
			\  }
" Setup compilers for languages, python:'pylint'
let g:ale_linters = {
			\  'c':['gcc','cppcheck'],
			\  'cpp':['gcc','cppcheck'],
			\  'python':['flake8'],
			\  'java':['javac'],
			\  'cs':['syntax', 'semantic', 'issues']
			\  }
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
" set term=xterm-256color
set t_Co=256
set background=dark
" hemisu works with peppermint terminal theme
" deus for markdown
" molokai , monokai , hemisu , atom , github , solarized , flattened_dark , termschool , jellybeans , vividchalk , candy , distinguished
if $ITERM_PROFILE == 'solarized'
	let colorname='flattened_dark'
else
	"let colorname='molokai'
	"let colorname='gruvbox'
	" if the solarized background is not working, set the terminal background
	" to solarized in preferences
	let colorname='solarized8'
endif
execute 'let g:'.colorname.'_termcolors=256'
" execute 'let g:'.colorname.'_termcolors=16'
" syntax enable
execute 'colorscheme '.colorname
"autocmd BufEnter *.md colorscheme torte
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"
""make vim save and load the folding of the document each time it loads"
"""also places the cursor in the last place that it was left."
"https://vim.fandom.com/wiki/Make_views_automatic
"If `options` is included in `viewoptions`,
"vim's current working directory at the time of `makeview` is stored and loaded with `loadview`.
"If you have vim automatically changing directories for each buffer,
"or if you locally set the pwd, your working directory will change when you reload the file during another session.
"This should be strongly emphasized
set viewoptions-=options
let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BUFFER]'
            \ ]
function! MakeViewCheck()
    if has('quickfix') && &buftype =~ 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    if len($TEMP) && expand('%:p:h') == $TEMP
        " We're in a temp dir
        return 0
    endif
    if len($TMP) && expand('%:p:h') == $TMP
        " Also in temp dir
        return 0
    endif
    if index(g:skipview_files, expand('%')) >= 0
        " File is in skip list
        return 0
    endif
    return 1
endfunction
augroup vimrcAutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
augroup end

"
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" There are four main ways to use tabs in Vim:
" 1. Always keep 'tabstop' at 8, set 'softtabstop' and 'shiftwidth' to 4 (or 3
" or whatever you prefer) and use 'noexpandtab'. Then Vim will use a mix of
" tabs and spaces, but typing and will behave like a tab appears every 4
" (or 3) characters.
" 2. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use 'expandtab'.
" This way you will always insert spaces. The formatting will never be messed
" up when 'tabstop' is changed.
" 3. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use a |modeline|
" to set these values when editing the file again. Only works when using Vim
" to edit the file.
" 4. Always set 'tabstop' and 'shiftwidth' to the same value, and 'noexpandtab'.
" This should then work (for initial indents only) for any tabstop setting
" that people use. It might be nice to have tabs after the first non-blank
" inserted as spaces if you do this though. Otherwise aligned comments will
" be wrong when 'tabstop' is changed.
" tabstop is about how wide a Tab is defined, while
" softtabstop is about how far cursor moves while typing Tab .
"" After the 'expandtab' option is set, all the new tab characters entered will be changed to spaces. This will not affect the existing tab characters.
""set tabstop=4
"set softtabstop=2 shiftwidth=2 expandtab

set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
" Set the tab width
let s:tabwidth=4
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

" python tabstop defined in /Users/shxi/.vim/ftplugin/python.vim
"au BufNewFile,BufRead *.java set tabstop=4 expandtab shiftwidth=4 softtabstop=4
"au BufNewFile,BufRead *.py set tabstop=8 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
"set listchars=tab:>-,trail:-,eol:$ list
"au BufNewFile,BufRead *.py set encoding=utf-8 "UTF-8 is the default source encoding in Python 3
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Error /\s\+$/

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
"set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" highlight the current line in every window and update the highlight as the cursor moves.
set cursorline
"hi CursorLine term=bold cterm=bold guibg=234 ctermbg=236

" highlight applied only in the current window, use an autocmd
"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
" set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1
 
" Display line numbers on the left
set number
set relativenumber
nnoremap <Leader>n :set invrelativenumber<CR> :set invnumber<CR>

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------


set guifont=Menlo:h14
"set guifont=Monaco:h
" Make the file browser always open the current directory.
"set browsedir=current
"set autochdir

" make the setting effective immediately after saving .vimrc
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

"set fillchars=vert:\ 

"------------------------------------------------------------
" set filetype 
autocmd BufNewFile,BufRead *.md set filetype=markdown
" Open markdown files with Chrome.
noremap <F5> :!/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %:p<CR><CR>

" Enable syntax highlighting
syntax on
hi Normal ctermbg=none
au BufEnter *.txt setlocal ft=txt

"Searching for slash as normal text
"command! -nargs=1 Ss let @/ = <q-args>
"Searching for all characters as normal text
"command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')

"------------------------------------------------------------
" Mappings 
" :map and :noremap are recursive and non-recursive 
" a mapping that works in normal, visual, select and operator modes (:map and :noremap)
" one that works in normal mode (:nmap and :nnoremap)
" one in visual mode (:vmap and :vnoremap) 
" Useful mappings
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR>
"nmap <Leader>nh :noh<CR>

" source .vimrc
nmap <Leader>s :source ~/.vimrc<CR>

" copy selection to system clipboard in visual mode and paste from system clipboard
" On macOS:
vnoremap <Leader>c :w !pbcopy<CR><CR>
noremap <Leader>v :r !pbpaste<CR><CR>
"On most Linux Distros, substitute:
"pbcopy with xclip -i -sel c or xsel -i -b
"pbpaste using xclip -o -sel -c or xsel -o -b

" close other windows, keep only the current window
nmap <Leader>o :only<CR>
" close current window
nmap <Leader>q :q<CR>
" close all windows
nmap <Leader>1 :qa<CR>
" quit without save
nmap <Leader>Q :qa!<CR>
" save
nmap <Leader>w :w<CR>
" cursor moving maps
nmap <Leader>h <C-w><C-w>
" switch buffer
noremap <leader>[ :bp<return>
noremap <leader>] :bn<return>
" delete current buffer without closing window
nnoremap <Leader>d :bp\|bd #<CR>

" find marks
nnoremap <Leader>m :<C-u>marks<CR>:normal! `
" switch buffer
nnoremap <Leader>b :ls<CR>:b<Space>
"nnoremap <key> :undolist<CR>:u<Space>

" show full path
nnoremap <Leader>0 :echo expand('%:p')<CR>

" Nerdtree maps
"nnoremap <silent> <Leader>t :NERDTreeFind<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>

"" customize netrw like nerdtree
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"netrw maps
"nnoremap <Leader>f :Vexplore<Enter>

" insert mode map, auto adding curly brace pair
inoremap '' ''<Esc>i
inoremap "" ""<Esc>i
inoremap () ()<Esc>i
inoremap [] []<Esc>i
inoremap {} {}<Esc>i
"inoremap {<CR> {<CR>}<up><Esc>
"inoremap st<tab> std::string 
"inoremap <c-x> <c-x><c-]>

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Vim looks for a tags file in the current directory first and up and up until it finds it
set tags=./tags,tags;
" vim plugin for cscope
"source ~/.vim/plugin/cscope_maps.vim
"" add cscope support if inside a view
if (!empty($NDE_VOB_ROOT))
" so the tag command also searches cs tags
"set cscopetag
" csto=1 : searches ctags before cscope
set csto=1
set csprg=/usr/local/packages/cscope/bin/cscope
" set cscopeverbose
" avoiding  Press ENTER or type command to continue
set nocscopeverbose
cs add $SRCHOME/$NDE_PRODUCT/utl/cscope.out

" keyboard shortcuts for Cscope queries
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
" Display all matching files when we tab complete
set wildmenu

" cpp highlight https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
