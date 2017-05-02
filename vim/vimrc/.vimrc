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

    " vundle pre-requis
    set nocompatible              " required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " alternatively, pass a path where Vundle should install plugins
    " call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " If no Powerline
    " Plugin 'bling/vim-airline'
    " Plugin 'vim-airline/vim-airline'
    " Plugin 'vim-airline/vim-airline-themes'

    Bundle 'christoomey/vim-tmux-navigator' 
    Bundle 'christoomey/vim-sort-motion'    
    " gs2j (2 lines)  gsip (in paragraph) gsii (indent) gsi( within parenthesis  
    
    Plugin 'easymotion/vim-easymotion'      "\s \w 
    Plugin 'tpope/vim-surround'     " cs]' (replace ] par ') cs'<q>  cst'  (t=tag)  ysiw]  cs]{   cs]}   yss)  (sentence) ds)
    Plugin 'tpope/vim-repeat'       " works with surround
    Plugin 'tpope/vim-commentary'   " gcc (1 line) gcap (a paragraph) gc2j (2lines) :7,17Commentary  :g/TODO/Commentary
    Plugin 'kien/ctrlp.vim'

    call vundle#end()            " required
    filetype plugin indent on    " required

" ###################################################
" ###############   RUNTIME PATH   ##################
" ###################################################

    set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
    set rtp+=~/.fzf

" ###################################################
" ##################   OPTIONS  #####################
" ###################################################

    " Enable mouse control
    set mouse=a

    syntax enable

    set number
    set relativenumber

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
    set cmdheight=1

    " Cursorline Settings
    set cursorline
    highlight CursorLine term=bold cterm=bold ctermbg=DarkGrey guibg=DarkGrey ctermfg=NONE
    highlight CursorLineNR ctermbg=235 ctermfg=White cterm=bold
    autocmd InsertLeave * :highlight CursorLine cterm=bold ctermbg=234 ctermfg=NONE term=bold
    autocmd InsertEnter * :highlight CursorLine cterm=NONE ctermbg=52 ctermfg=NONE

" ###################################################
" ################   BINDINGS   #####################
" ###################################################


" #################   Easy Motion   #################

    map <Leader> <Plug>(easymotion-prefix)
    
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    
    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)
    
    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)
    
    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

" #################   Tmux    #######################

    " TMUX: if no vim-tmux-navigator, do the same in Vim only
    " split navigations
    "nnoremap <C-J> <C-W><C-J>
    "nnoremap <C-K> <C-W><C-K>
    "nnoremap <C-L> <C-W><C-L>
    "nnoremap <C-H> <C-W><C-H>

" #################   Others   ######################

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

    " Execute Mardown (Grip) preview (Grip is a GitHub markdown flavour)
    " nnoremap <C-m> :!grip -b %<cr>

    " switch higlight no matter the previous state
    noremap <F4> :set hlsearch! hlsearch?<cr>

" ###################################################
" ################   AUTO-CMDs   ####################
" ###################################################

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

" ###################################################
" ################   FUNCTIONS   ####################
" ###################################################

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
