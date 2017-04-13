
" ########################################
" ############## VUNDLE ##################
" ########################################

    " vundle pre-requis
    set nocompatible              " required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " status bar that rocks
    Plugin 'bling/vim-airline'
    Plugin 'easymotion/vim-easymotion'
    " Plugin 'tmhedberg/SimpylFold'
    "Plugin 'vim-scripts/indentpython.vim'
    "Bundle 'Valloric/YouCompleteMe'
    "Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
    Bundle 'christoomey/vim-tmux-navigator'
    "call vam#ActivateAddons(['powerline'])

    call vundle#end()            " required
    filetype plugin indent on    " required


" ########################################
" ############# POWERLINE ################
" ########################################

    " python from powerline.vim import setup as powerline_setup
    " python powerline_setup()

    "python del powerline_setup


" ########################################
" ############ RUNTIME PATH ##############
" ########################################

    set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
    set rtp+=~/.fzf


" ########################################
" ############## BINDING #################
" ########################################

    " TMUX: if no vim-tmux-navigator, do the same in Vim only
    " split navigations
    "nnoremap <C-J> <C-W><C-J>
    "nnoremap <C-K> <C-W><C-K>
    "nnoremap <C-L> <C-W><C-L>
    "nnoremap <C-H> <C-W><C-H>

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
    
    " Buffers: Next, Previous, Delete
    map gn :bn<cr>
    map gp :bp<cr>
    map gd :bd<cr> 


" ########################################
" ############## OPTIONS #################
" ########################################

    syntax enable

    set number
    set relativenumber

    " Always show statusline
    set laststatus=2

    " Use 256 colours (Use this setting only if your terminal supports 256 colours)
    set t_Co=256

    "Open new split panes to right and bottom, which feels more natural than Vim’s default:
    set splitbelow
    set splitright

    " PYTON INDENT
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

    " Better command-line completion
    set wildmenu

    " Show partial commands in the last line of the screen
    set showcmd

    " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
    " mapping of <C-L> below)
    set hlsearch

    " Use case insensitive search, except when using capital letters
    set ignorecase
    set smartcase

    " Allow backspacing over autoindent, line breaks and start of insert action
    set backspace=indent,eol,start


    " Instead of failing a command because of unsaved changes, instead raise a
    " dialogue asking if you wish to save changed files.
    set confirm

    " Set the command window height to 2 lines, to avoid many cases of having to
    " "press <Enter> to continue"
    set cmdheight=2

    " Cursorline Settings
    set cursorline
    highlight CursorLine term=bold cterm=bold ctermbg=DarkGrey guibg=DarkGrey ctermfg=NONE
    highlight CursorLineNR ctermbg=235 ctermfg=White cterm=bold
    autocmd InsertLeave * :highlight CursorLine cterm=bold ctermbg=234 ctermfg=NONE term=bold
    autocmd InsertEnter * :highlight CursorLine cterm=NONE ctermbg=52 ctermfg=NONE


" ########################################
" ############# AUTO-CMDs ################
" ########################################

    " Works only in GVim ?
    au FocusLost * :set number
    au FocusLost * :set norelativenumber
    au FocusGained * :set number
    au FocusGained * :set relativenumber

    " Toggle Numbers: Relative / Abs
    autocmd InsertEnter * :set number
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set number
    autocmd InsertLeave * :set relativenumber


" ########################################
" ############# FUNCTIONS ################
" ########################################

    " Toggle Numbers: Relative / Abs
    function! NumberToggle()
      if(&relativenumber == 1)&& (&number == 1)
        set number
        set norelativenumber
      else
        set relativenumber
      endif
    endfunc


    " Auto reload vimrc on change"
    augroup myvimrc
        au!
        au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    augroup END

    " Flagging Unnecessary Whitespace
    " au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
    " Trailing whitespace 
    " Only shown when not in insert mode so I don't go insane.
    augroup trailing
        au!
        au InsertEnter * :set listchars-=trail:⌴
        au InsertLeave * :set listchars+=trail:⌴
    augroup END









