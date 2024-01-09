"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Based on: https://github.com/amix/vimrc
"
" Sections:
"    -> Plugins
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Fuzzy Finder
"    -> File system explorer
"    -> VIM test
"    -> Tmux integration
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  " This plugin provides a start screen for Vim and Neovim.
  Plug 'mhinz/vim-startify'

  " Magical forest
  Plug 'sainnhe/everforest'

  " Tema da hora
  Plug 'drewtempelmeyer/palenight.vim'

  " Display Indentation line
  Plug 'Yggdroot/indentLine'

  " Add syntax for programming languages on demand.
  " Plug 'sheerun/vim-polyglot'

  " Run tests from vim.
  Plug 'janko-m/vim-test'

  " Repeat any command with dot .
  Plug 'tpope/vim-repeat'

  " Insert or delete brackets, parens, quotes in pair.
  Plug 'jiangmiao/auto-pairs'

  " Add Git integration commands.
  Plug 'tpope/vim-fugitive'

  " Pretty colors for git diff
  Plug 'mhinz/vim-signify'

  " Use AG the silver searcher
  Plug 'rking/ag.vim'

  " Easialy rename files using :Rename filename newfilename
  Plug 'danro/rename.vim'

  " Easily replace commas, quotes, parentheses or edit words surround by it.
  Plug 'tpope/vim-surround'

  " Vim linter
  Plug 'dense-analysis/ale'

  " Vue highlight
  Plug 'posva/vim-vue'

  " CSV highlight
  Plug 'mechatroner/rainbow_csv'

  " JS highlight
  Plug 'pangloss/vim-javascript'
  Plug 'elzr/vim-json'
  Plug 'mxw/vim-jsx'

  Plug 'w0rp/ale'

  " Elixir LS
  Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

  " File tree
  Plug 'scrooloose/nerdtree'

  " Add shortcuts for commenting block of codes.
  Plug 'vim-scripts/tComment'

  " Plugin to enable vim to open the file in the spefic line
  " ex. app/models/user.rb:1337
  Plug 'bogado/file-line'

  " Open the current file on GitHub
  Plug 'tyru/open-browser.vim'
  Plug 'tyru/open-browser-github.vim'

  " Awesome vim airline with several options and themes.
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " TODO: check ift's needed since I use vim-polyglot
  " Plug 'slim-template/vim-slim'

  " Creates or run commands from VIM on existing TMUX panes.
  Plug 'benmills/vimux'

  " Vim plugin to SUPPORT writing user-defined text objects, especially, simple text objects which
  " can be defined by regular expression. This plugin only provides functions to support writing
  " user-defined text objects, and this plugin does not provide any useful text objects.
  Plug 'kana/vim-textobj-user'

  " Depends on 'vim-textobj-user'.
  " Plugin to provide text objects to select a portion of the current line
  Plug 'kana/vim-textobj-line'

  " Depends on 'vim-textobj-user'.
  " Elixir text objects include: 'setup_all', 'setup', 'describe', 'test', 'unless', 'quote',
  " 'case', 'cond', 'when', 'with', 'for', 'if', 'defprotocol', 'defmodule', 'defmacro', 'defmacrop',
  " 'defimpl', 'defp', 'def'.
  Plug 'andyl/vim-textobj-elixir'

  " Fuzzy finder
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  " Quick search and replace for Vim
  Plug 'hauleth/sad.vim'

  " Quickly navigation among Elixir files
  Plug 'tpope/vim-projectionist'
  Plug 'c-brenn/fuzzy-projectionist.vim'
  Plug 'andyl/vim-projectionist-elixir'

  " Add earthly build syntax
  Plug 'earthly/earthly.vim', { 'branch': 'main' }

  " Well, it's pretty self explenatory
  Plug '907th/vim-auto-save'

  " Project managing
  Plug 'ahmedkhalf/project.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'nvim-telescope/telescope-live-grep-args.nvim'

  Plug 'tpope/vim-projectionist'
  Plug 'dkuku/vim-projectionist-elixir'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<SPACE>"
let g:mapleader = "\<SPACE>"

set mouse=a

" Use <leader>kl for reloading vim config
nmap <leader>so :source $MYVIMRC<cr>

" Shortcut to open vim rc
nmap <leader>vr :vsp ~/.config/nvim/init.vim<cr>

" Preview substitute command on neovim
if has("nvim")
    set inccommand=nosplit
endif

" Copy to clipboard from vim by default
set clipboard+=unnamed

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Doesn't show search highlights
set nohlsearch

" Defaults split to right
set splitright

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Use <leader>bh to open startify (Home)
nmap <leader>bh :Startify<cr>

" COC settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Show line number
set relativenumber number

" Show highlight the cursor line
set cursorline

let g:startify_relative_path = 1
let g:startify_change_to_vcs_root = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
set termguicolors
syntax enable
  " Important!!
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:everforest_background = 'hard'
" For better performance
let g:everforest_better_performance = 1
colorscheme everforest
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

let g:airline_powerline_fonts = 1
let g:airline_theme='everforest'

" Add Slim syntax
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.lime setlocal filetype=slim

" Disable Syntax Concealing in markdown
set conceallevel=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set conceallevel=0
let g:vim_markdown_conceal = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Search word under cursor without moving the cursor. useful for using cgn and then
" change next words.
nnoremap * *``
nnoremap # #``

" Find & Replace with <leader> r from previous search.
nnoremap <Leader>r :%s///g<Left><Left>
xnoremap <Leader>r :s///g<Left><Left>

" use F to start a search from a word under the cursor
nnoremap <C-F> :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" grep word under cursor and populate quickfix window
" :nnoremap F :grep -r <C-R><C-W> ./src<CR><CR>:copen<CR><CR>

" use \ to start searching
nnoremap \ :Ag<SPACE>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader>dh :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

"Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.ex,.exs,*.html,*.slime,*.vim,*.lime :call CleanExtraSpaces()
endif

let g:mix_format_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Create a vertical split
nmap <leader>l :vsplit<CR><C-w>l

" Create a horizontal split
nmap <leader>j :split<CR><C-w>j

" Opens terminal in a split window
nmap <leader>t :vsp <bar> :terminal<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Signify (Git diff stuff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Scd :SignifyHunkDiff
command! Sfd :SignifyDiff!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Project managing (rooter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load and cofigure project_nvim
lua << EOF
  require("project_nvim").setup {
    patterns = { ".git", "mix.lock", "package.json" },
  }
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fuzzy Finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>:lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp <cmd>Telescope projects<cr>
" Configure and load telescope plugins
lua << EOF
  require('telescope').load_extension('projects')
  require("telescope").load_extension("live_grep_args")
  require('telescope').load_extension('fzf')
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File system explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Use <leader>f for toggling NerdTree
noremap <Leader>f :NERDTreeToggle<CR>

" Use <leader>n for opening NerdTree
noremap <Leader>n :NERDTreeFind<CR>

" Use <leader>c for opening NerdTree on current file
nnoremap <silent> <Leader>c :NERDTreeFind<CR>

" Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIgnore=['\~$', 'deps', '_build']
let NERDTreeShowHidden=1
" let NERDTreeQuitOnOpen=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM test
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set terminal to vim-test
" let g:test#strategy = 'vimux'
let g:test#strategy = 'neovim'

" Remap ESC to not close the test window.
tnoremap <Esc> <C-\><C-n>

let g:test#preserve_screen = 1
let g:test#filename_modifier = ":."

" Vim-test key bindings
nmap <silent> <leader>tt :TestFile<CR>
nmap <silent> <leader>ts :TestNearest<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <Leader>vs vip<LocalLeader>vs<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

" Open tmux pane or use the nearest one.
map <Leader>vo :call VimuxOpenRunner()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>o :setlocal paste!<cr>

" Use <leader>y to copy the current path to clipboard
nnoremap <Leader>y :let @+=expand('%:p')<CR>

" Use <leader>yl copy the current path with line number to clipboard
nnoremap <leader>yl :let @+=expand('%:p') . ':' . line(".")<CR>

" Move selected stuffs up/down with J and K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Linter setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers  = {'elixir': ['mix_format']}
let g:ale_linters = {'elixir': ['elixir-ls']}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let b:ale_elixir_elixir_ls_config = {
\   'elixirLS': {
\     'dialyzerEnabled': v:false,
\   },
\}

" Auto fix JS
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copilot setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-]> <Plug>(copilot-next)
" inoremap <C-;> <Plug>(copilot-dismiss)
" inoremap <C-[> <Plug>(copilot-previous)
" inoremap <C-\> <Plug>(copilot-suggest)

