""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"   This is the .vimrc file
"
" Maintainer:
"   Louis "Fumbo" Cadet
"   <cadet.louis@gmail.com>
"
" Acknowledgements:
"   Most elements of this .vimrc come from Kévin Sztern's config
"   You can find it here : https://github.com/Chewie/configs
"   Several elements come from Pierre Bourdon's config
"   You can find it here: https://bitbucket.org/delroth/configs/
"
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" General parameters
""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable vi compatibility mode
set nocompatible

" Pathogen requires the ftplugins to be disabled
filetype off


" /!\ Comment this line if you only have the .vimrc /!\
" Load all the plugins in .vim/bundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
""""""""""""""""""""""""""""""""""""""""""""""""""

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tristen/vim-sparkup'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/ultisnips'
Bundle 'Chewie/EPITA-snippets'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'klen/python-mode'
Bundle "honza/vim-snippets"

" Enable filetype detection for plugins and indentation options
filetype plugin indent on

" Reload a file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Disable backups, we have source control for that
set nobackup

" Force encoding to utf-8, for systems where this is not the default (windows
" comes to mind)
" set encoding=utf-8

" Disable swapfiles too
set noswapfile

" Hide buffers instead of closing them
set hidden

" Set the time (in milliseconds) spent idle until various actions occur
" In this configuration, it is particularly useful for the tagbar plugin
set updatetime=500

""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Make backspace behave as expected
set backspace=eol,indent,start

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number

" Always show status line
set laststatus=2

" Format the status line
" This status line comes from Pierre Bourdon's vimrc
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=list:longest:full

" Disable bell completely
set visualbell
set t_vb=

" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤

set fillchars=vert:│

" Enables syntax highlighting
syntax on

" Enable Doxygen highlighting
let g:load_doxygen_syntax=1

" Allow mouse use in vim
set mouse=a

" Briefly show matching braces, parens, etc
set showmatch

" Enable line wrapping
set wrap

" Wrap on column 80
set textwidth=79

" Disable preview window on completion
set completeopt=menu,longest

" Highlight current line
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

" Toggle g option by default on substition
set gdefault

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
""""""""""""""""""""""""""""""""""""""""""""""""""

" The length of a tab
" This is for documentation purposes only,
" do not change the default value of 8, ever.
set tabstop=8

" The number of spaces inserted when you press tab
set softtabstop=4

" The number of spaces inserted/removed when using < or >
set shiftwidth=4

" Insert spaces instead of tabs
set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

" This one is complicated. See :help cinoptions-values for details
set cinoptions=(0,u0,U0,t0,g0

" Set python tab to 2
"autocmd Filetype python setlocal expandtab shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set "," as map leader
let mapleader = ","

" 'very magic' regexp searches
nnoremap / /\v
nnoremap ? ?\v

" 'very magic' regexp substitutions
cnoremap %s %s/\v

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Move between rows in wrapped lines
noremap j gj
noremap k gk

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" Write as root, when you forgot to sudoedit
cnoreabbrev w!! w !sudo tee % >/dev/null

" map ; to :
noremap ; :

" Open the quickfix window if there are errors, or close it if there are no
" errors left
noremap <leader>cw :botright :cw<cr>

" The ultimate mapping for edit/compile/edit workflow
" This mapping runs :make silently, then opens the quickfix window
" if there are errors, or close it if it was already opened and there are
" no more errors
noremap <leader>m :silent! :make \| :redraw! \| :botright :cw<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set location of the viminfo file
set viminfo='20,\"50,<100,n~/.vimtmp/viminfo

" From the Vim wiki
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
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

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vimtmp/undo
    silent !mkdir -p ~/.vimtmp/undo
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin mappings and options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Load custom snippets
let g:UltiSnipsSnippetDirectories = ["bundle/ultisnips/UltiSnips", "bundle/EPITA-snippets"]

" Use a slightly darker background color to differentiate with the status line
let g:jellybeans_background_color_256='232'

" Feel free to switch to another colorscheme
colorscheme jellybeans

" Toggle Rainbow parentheses
au VimEnter * RainbowParenthesesToggleAll

" Toggle Tagbar
noremap <leader>tt :TagbarToggle<cr>

" Toggle NERDTree
noremap <leader>nt :NERDTreeToggle<cr>

" Align all variable names with tabular
noremap <leader>ta :Tab / [^ ]*;<cr>

" Launch fugitive's gstatus
noremap <leader>gs :Gstatus<cr>

" Use the patched font for the fancy status line
" let g:Powerline_symbols='fancy'

" Syntastic mappings and options
" -------------------------------
" Open the syntax errors location window
noremap <leader>se :Errors<cr>

" Set the C and C++ compilers used for syntax checking with syntastic
let g:syntastic_cpp_compiler='g++'
let g:syntastic_c_compiler='clang'

" Check headers too, because why wouldn't we?
let g:syntastic_c_check_header=1
let g:syntastic_cpp_check_header=1

" Default to EPITA flags
let g:syntastic_cpp_compiler_options = ' -Wall -Wextra -Werror -std=c++11 -pedantic '
let g:include_path = ' -I src/includes/ '

" Clang_complete options
" ----------------------

" Don't complete unless asked to
let g:clang_complete_auto=1

" Use libclang.so instead of the clang executable for clang_complete
let g:clang_use_library=1

" Use snippets to complete
let g:clang_snippets=1
let g:clang_snippets_engine="ultisnips"

"""""""""""""""""""""""""""""""""
" Fumbo's adds
""""""""""""""""""""""""""""""""""
"Change color to fit well with ubunto terminal and epita racks
set t_Co=256


" Options for syntastic Syntastic
"let g:enable_warning = 1
"let g:compile_flag = ' -Wall -Wextra -Werror -std=c++11 -pedantic '
"let g:c_compiler = 'gcc'
"let g:cpp_compiler = 'g++'
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Adding column at 80 characters and changing it collors
set cc=80
" hi ColorColumn ctermbg=lightblue

" Doxygen modified by Durieux Edouard
let g:DoxygenToolkit_authorName="Cadet Louis"
let g:DoxygenToolkit_blockTag="@fn"
let g:DoxygenToolkit_interCommentBlock ="**"
let g:DoxygenToolkit_interCommentTag ="** "

" Python Mode
let g:pymode_rope_completion=1
let g:pymode_rope_complete_on_dot=1
let g:pymode_rope_completion_bind='<C-N>'
"Remove auto trim trailing whitespace
let g:pymode_trim_whitespaces=0
