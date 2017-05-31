
" ###################################################
" #################   POWERLINE   ###################
" ###################################################

    " See Runtime Path Section
    let g:airline_powerline_fonts = 1

    " Always show statusline
    set laststatus=2

    " Use 256 colours (Use this setting only if your terminal supports 256 colours)
    set t_Co=256

" ###################################################
" ##################   AIRLINE   ####################
" ###################################################

    " vim-airline {
    " Set configuration options for the statusline plugin vim-airline.
    " Use the powerline theme and optionally enable powerline symbols.
    " To use the symbols , , , , , , and .in the statusline
    " segments add the following to your .vimrc.before.local file:
    "   let g:airline_powerline_fonts=1
    " If the previous symbols do not render for you then install a
    " powerline enabled font.

    " See `:echo g:airline_theme_map` for some more choices
    " Default in terminal vim is 'dark'

    " if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
    "     if !exists('g:airline_theme')
    " 	let g:airline_theme = 'powerlineish'
    "     endif
    "     if !exists('g:airline_powerline_fonts')
    " 	" Use the default set of separators with a few customizations
    " 	let g:airline_left_sep='›'  " Slightly fancier than '>'
    " 	let g:airline_right_sep='‹' " Slightly fancier than '<'
    "     endif
    " endif

" ###################################################
" ##################   VUNDLE   #####################
" ###################################################

    " vundle pre-required
    set nocompatible              " required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " alternatively, pass a path where Vundle should install plugins
    " call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

	" Color theme
    " Plugin 'nightsense/vim-crunchbang'   

    " If no Powerline
    " Plugin 'bling/vim-airline'
    " Plugin 'vim-airline/vim-airline'
    " Plugin 'vim-airline/vim-airline-themes'
    " Plugin 'itchyny/lightline.vim'

    Plugin 'ervandew/supertab'

    Plugin 'scrooloose/nerdtree'

    Plugin 'junegunn/fzf.vim'

    Bundle 'godlygeek/tabular'

    Bundle 'christoomey/vim-tmux-navigator'
    Bundle 'christoomey/vim-sort-motion'
    " gs2j (2 lines)  gsip (in paragraph) gsii (indent) gsi( within parenthesis 

    Plugin 'easymotion/vim-easymotion'
    "\s \w \L

    Plugin 'tpope/vim-surround'
    " cs]' (replace ] par ') cs'<q>  cst'  (t=tag)  ysiw]  cs]{   cs]}   yss)  (sentence) ds)

    Plugin 'tpope/vim-repeat'
    " works with surround

    Plugin 'tpope/vim-commentary'
    " gcc (1 line) gcap (a paragraph) gc2j (2lines) :7,17Commentary  :g/TODO/Commentary

    Plugin 'kien/ctrlp.vim'
    " Ctrl+p

    Plugin 'tpope/vim-fugitive'

    " Plugin Tagbar   " Class outline viewer
    " Plugin Gundo    " Undo tree viewer

    call vundle#end()            " required
    filetype plugin indent on    " required

    filetype plugin on

" ###################################################
" ###############   RUNTIME PATH   ##################
" ###################################################

    set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
    set rtp+=~/.fzf

" ###################################################
" ##################   OPTIONS  #####################
" ###################################################

    " -----------------------------------------------
    "  GlOBAL OPTIONS -------------------------------

    " DISPLAY ---------------------------------------

    " color theme
    " color crunchbang

    syntax enable

    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\ ,eol:¬,trail:.,nbsp:⎵
    " set list

    " absolute and relative numbers. See Auto-Cmds section as well
    set number
    set relativenumber

    " show line/column
    set ruler

    " limit line'slenght and display limit
    set wrap
    set textwidth=79
    set formatoptions=qrn1
    set colorcolumn=85

    " Show partial commands in the last line of the screen
    set showcmd

    " Set the command window height to 2 lines, to avoid many cases of having to
    " "press <Enter> to continue"
    set cmdheight=1

    " Cursorline Settings
    set cursorline
    highlight CursorLine term=bold cterm=bold ctermbg=Black guibg=Black ctermfg=NONE
    highlight CursorLineNR ctermbg=235 ctermfg=White cterm=bold
    autocmd InsertLeave * :highlight CursorLine cterm=bold ctermbg=Black ctermfg=NONE term=bold
    autocmd InsertEnter * :highlight CursorLine cterm=NONE ctermbg=Black ctermfg=NONE

    " BEHAVIOR --------------------------------------

    " Encoding
    set enc=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf8,prc

    " keep unwritten buffer without being forced to write
    set hidden

    " allow backspacing over everything in insert mode
    set backspace=indent,eol,start

    " number of lines to see above and below the cursor
    set scrolloff=8

    "Open new split panes to right and bottom, which feels more natural than Vim’s default:
    set splitbelow
    set splitright

    " Instead of failing a command because of unsaved changes, instead raise a
    " dialogue asking if you wish to save changed files.
    set confirm

    " ignore some files when opening
    set wildignore=*.swp,*.bak,*.pyc,*.class

    " Fast terminal connection. Depending of terminal: xterm, urxvt etc..
    set ttyfast

    " applies substitutions globally on lines. instead of :%s/foo/bar/g you just type :%s/foo/bar/
    set gdefault

    " -----------------------------------------------
    " TIME OUT --------------------------------------

    " Time out on key codes but not mappings.
    " Basically this makes terminal Vim work sanely.
    set notimeout
    set ttimeout
    set ttimeoutlen=10

    " -----------------------------------------------
    " LINE RETURN -----------------------------------

    " Make sure Vim returns to the same line when you reopen a file.
    " Thanks, Amit
    augroup line_return
        au!
        au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute 'normal! g`"zvzz' |
            \ endif
    augroup END

    " -----------------------------------------------
    " UNDO & BACKUPS --------------------------------

    " remember more command
    set history=1000

    " more undo levels
    set undolevels=1000

    set undofile                      " enable undo even after file closed
    set backup                        " enable backups
    set noswapfile                    " it's 2017, Vim.

    set undodir=~/.vim/tmp/undo//     " undo files
    set backupdir=~/.vim/tmp/backup// " backups
    set directory=~/.vim/tmp/swap//   " swap files

    " Make those folders automatically if they don't already exist.
    if !isdirectory(expand(&undodir))
        call mkdir(expand(&undodir), "p")
    endif
    if !isdirectory(expand(&backupdir))
        call mkdir(expand(&backupdir), "p")
    endif
    if !isdirectory(expand(&directory))
        call mkdir(expand(&directory), "p")
    endif

    " -----------------------------------------------
    " SEARCH OPTIONS --------------------------------

    " set show matching parenthesis
    set showmatch
    " show search matches as you type
    set incsearch
    " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
    " mapping of <C-L> below)
    set hlsearch
    " Use case insensitive search, except when using capital letters
    set ignorecase
    set smartcase

    " -----------------------------------------------
    " PYTON INDENT ----------------------------------

    " au BufNewFile,BufRead *.py
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=79
    set expandtab
    set autoindent
    set fileformat=unix

    " Enable folding
    set foldmethod=indent
    set foldlevel=99

    " Enable folding with the spacebar
    nnoremap <space> za

    " -----------------------------------------------
    " MOUSE CONTROL ---------------------------------

    set mouse=a

    " -----------------------------------------------
    "  WILDMENU COMPLETION --------------------------

    set wildmenu                                     " Better command-line completion
    set wildmode=list:longest
    set wildignore+=.hg,.git,.svn                    " Version control
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*.DS_Store                       " OSX bullshit

    set wildignore+=*.luac                           " Lua byte code

    set wildignore+=migrations                       " Django migrations
    set wildignore+=*.pyc                            " Python byte code

    set wildignore+=*.orig                           " Merge resolution files

    " Clojure/Leiningen
    set wildignore+=classes
    set wildignore+=lib

" ###################################################
" ################   BINDINGS   #####################
" ###################################################

    let mapleader=','

    " one less key to press everytime I want to save
    nnoremap ; :

    " -----------------------------------------------
    " EASY MOTION------------------------------------

    map <Leader> <Plug>(easymotion-prefix)

    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    nmap <Leader>s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

    " -----------------------------------------------
    " TMUX ------------------------------------------

    " TMUX: if no vim-tmux-navigator, do the same in Vim only
    " split navigations
    "nnoremap <C-J> <C-W><C-J>
    "nnoremap <C-K> <C-W><C-K>
    "nnoremap <C-L> <C-W><C-L>
    "nnoremap <C-H> <C-W><C-H>

    " -----------------------------------------------
    " TABULARIZE ------------------------------------

    " if exists(":Tabularize")
      nmap <Leader>t= :Tabularize /=<CR>
      vmap <Leader>t= :Tabularize /=<CR>
      nmap <Leader>t: :Tabularize /:\zs<CR>
      vmap <Leader>t: :Tabularize /:\zs<CR>
      nmap <Leader>t> :Tabularize /><CR>
      vmap <Leader>t> :Tabularize /><CR>
    " endif

    " -----------------------------------------------
    " NERDTREE --------------------------------------

    map <C-t> :NERDTreeToggle<CR>

    " -----------------------------------------------
    " OTHERS ----------------------------------------

    " Shortcut to rapidly toggle `set list`
    nmap <leader>l :set list!<CR>

    " Search mappings: These will make it so that going to the next one in a
    " search will center on the line it's found in.
    map N Nzz
    map n nzz

    " Edit vimrc \ev
    nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

    " Edit gvimrc \gv
    nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>

    " Toggle Numbers: Relative / Abs
    nnoremap <C-n> :call NumberToggle()<cr>

    " Buffers: Next, Previous, Delete {{{
    " nmap gc :vnew<cr>
    map gn :bn<cr>
    map gp :bp<cr>
    map gd :bd<cr>

    " switch higlight no matter the previous state
    noremap <leader>h :set hlsearch! hlsearch?<cr>

    " toggle paste mode. (disable autoindent etc...)
    set pastetoggle=<F2>

    " match braket pairs. replace %
    nnoremap <tab> %
    vnoremap <tab> %

    " To test
    inoremap jj <ESC>

    " Vertical split and focus on new split
    nnoremap <leader>p <C-w>v<C-w>l

    " select the last paste
    nnoremap <leader>v V`]

    " Open your .vimrc in a vertical split
    nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

    " w!! force le sudo sur le fichier readonly
    cmap w!! w !sudo tee % >/dev/null

    " Yank to end of line
    nnoremap Y y$
    " " Reselect last-pasted text
    nnoremap gv `[v`]

    " -----------------------------------------------
    " No no no! -------------------------------------

    " You gonna learn Vim!
    map <up> <nop>
    map <down> <nop>
    map <left> <nop>
    map <right> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>
    nnoremap j gj
    nnoremap k gk

    " -----------------------------------------------
    " Execute Mardown (Grip) preview (Grip is a GitHub markdown flavour)
    " nnoremap <C-m> :!grip -b %<cr>

" ###################################################
" ################   AUTO-CMDs   ####################
" ###################################################

    " -----------------------------------------------
    " SAVE WHEN LOOSE FOCUS -------------------------

    " Save when loose focus.
    " au FocusLost * :wa
    " Save when losing focus
    au FocusLost * :silent! wall

    " -----------------------------------------------
    " SWAP NUMBERS ON FOCUS -------------------------

    " Works only in GVim ?
    au FocusLost * :set number
    au FocusLost * :set norelativenumber
    au FocusGained * :set number
    au FocusGained * :set relativenumber

    " -----------------------------------------------
    " TOGGLE NUMBERS --------------------------------

    " Toggle Numbers: Relative / Abs
    autocmd InsertEnter * :set number
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set number
    autocmd InsertLeave * :set relativenumber

    " -----------------------------------------------
    " AUTO RELOAD .vimrc On change >> don't work ----
    augroup myvimrc
        au!
        au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    augroup END

    " Flagging Unnecessary Whitespace
    " au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

    " -----------------------------------------------
    " TRAILING WHITESPACE ---------------------------

    " Only shown when not in insert mode so I don't go insane.
    augroup trailing
        au!
        au InsertEnter * :set listchars-=trail:⌴
        au InsertLeave * :set listchars+=trail:⌴
    augroup END

" ###################################################
" ################   FUNCTIONS   ####################
" ###################################################

    " -----------------------------------------------
    " TOGGLE NUMBERS: Relative / Abs ----------------

    function! NumberToggle()
      if(&relativenumber == 1)&& (&number == 1)
        set number
        set norelativenumber
      else
        set relativenumber
      endif
    endfunc

    " -----------------------------------------------
    " TABULARIZE: Funky function from Tim Pope ------

    inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

    function! s:align()
      let p = '^\s*|\s.*\s|\s*$'
      if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
      endif
    endfunction


" ###################################################
" ###########   LIGHTLINE FUNCTIONS   ###############
" ###################################################

"     " hide mode from vim > displayed by lightLine
"     set noshowmode

"           " \ 'colorscheme': 'wombat',
"     let g:lightline = {
"           \ 'active': {
"           \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ], ['ctrlpmark'] ],
"           \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
"           \ },
"           \ 'component_function': {
"           \   'fugitive': 'LightlineFugitive',
"           \   'filename': 'LightlineFilename',
"           \   'fileformat': 'LightlineFileformat',
"           \   'filetype': 'LightlineFiletype',
"           \   'fileencoding': 'LightlineFileencoding',
"           \   'mode': 'LightlineMode',
"           \   'ctrlpmark': 'CtrlPMark',
"           \ },
"           \ 'component_visible_condition': {
"           \   'readonly': '(&filetype!="help"&& &readonly)',
"           \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
"           \ },
"           \ 'component_expand': {
"           \   'syntastic': 'SyntasticStatuslineFlag',
"           \ },
"           \ 'component_type': {
"           \   'syntastic': 'error',
"           \ },
"           \ 'component': {
"           \   'readonly': '%{&readonly?"x":""}',
"           \ },
"           \ 'separator': { 'left': '', 'right': '' },
"           \ 'subseparator': { 'left': '|', 'right': '|' }
"           \ }

"     function! LightlineModified()
"       return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"     endfunction

"     function! LightlineReadonly()
"       return &ft !~? 'help' && &readonly ? 'RO' : ''
"     endfunction

"     function! LightlineFilename()
"       let fname = expand('%:t')
"       return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
"             \ fname == '__Tagbar__' ? g:lightline.fname :
"             \ fname =~ '__Gundo\|NERD_tree' ? '' :
"             \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
"             \ &ft == 'unite' ? unite#get_status_string() :
"             \ &ft == 'vimshell' ? vimshell#get_status_string() :
"             \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
"             \ ('' != fname ? fname : '[No Name]') .
"             \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
"     endfunction

"     function! LightlineFugitive()
"       try
"         if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
"           let mark = ''  " edit here for cool mark
"           let branch = fugitive#head()
"           return branch !=# '' ? mark.branch : ''
"         endif
"       catch
"       endtry
"       return ''
"     endfunction

"     function! LightlineFileformat()
"       return winwidth(0) > 70 ? &fileformat : ''
"     endfunction

"     function! LightlineFiletype()
"       return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
"     endfunction

"     function! LightlineFileencoding()
"       return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
"     endfunction

"     function! LightlineMode()
"       let fname = expand('%:t')
"       return fname == '__Tagbar__' ? 'Tagbar' :
"             \ fname == 'ControlP' ? 'CtrlP' :
"             \ fname == '__Gundo__' ? 'Gundo' :
"             \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
"             \ fname =~ 'NERD_tree' ? 'NERDTree' :
"             \ &ft == 'unite' ? 'Unite' :
"             \ &ft == 'vimfiler' ? 'VimFiler' :
"             \ &ft == 'vimshell' ? 'VimShell' :
"             \ winwidth(0) > 60 ? lightline#mode() : ''
"     endfunction

"     function! CtrlPMark()
"       if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
"         call lightline#link('iR'[g:lightline.ctrlp_regex])
"         return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
"               \ , g:lightline.ctrlp_next], 0)
"       else
"         return ''
"       endif
"     endfunction

"     let g:ctrlp_status_func = {
"       \ 'main': 'CtrlPStatusFunc_1',
"       \ 'prog': 'CtrlPStatusFunc_2',
"       \ }

"     function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
"       let g:lightline.ctrlp_regex = a:regex
"       let g:lightline.ctrlp_prev = a:prev
"       let g:lightline.ctrlp_item = a:item
"       let g:lightline.ctrlp_next = a:next
"       return lightline#statusline(0)
"     endfunction

"     function! CtrlPStatusFunc_2(str)
"       return lightline#statusline(0)
"     endfunction

"     let g:tagbar_status_func = 'TagbarStatusFunc'

"     function! TagbarStatusFunc(current, sort, fname, ...) abort
"         let g:lightline.fname = a:fname
"       return lightline#statusline(0)
"     endfunction

"     augroup AutoSyntastic
"       autocmd!
"       autocmd BufWritePost *.c,*.cpp call s:syntastic()
"     augroup END
"     function! s:syntastic()
"       SyntasticCheck
"       call lightline#update()
"     endfunction

"     let g:unite_force_overwrite_statusline = 0
"     let g:vimfiler_force_overwrite_statusline = 0
"     let g:vimshell_force_overwrite_statusline = 0


" ###################################################
" ###############   END OF FILE   ###################
" ###################################################
