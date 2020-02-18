call plug#begin('~/.vim/plugged')
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vista.vim'
Plug 'anekos/hledger-vim'
Plug 'dstein64/vim-startuptime'
Plug 'liuchengxu/vim-which-key'
Plug 'derekwyatt/vim-fswitch'
Plug 'lifepillar/vim-gruvbox8'
Plug 'APZelos/blamer.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
call plug#end()

"" misc
set hidden
set nocp
filetype plugin on
set termguicolors
set scrolloff=999
set cursorline
set lazyredraw
set background=light
colorscheme gruvbox8_soft

"" backup

set backup
set backupdir=~/nvim/backup/
set backupskip=/tmp/*,/private/tmp/*
"set noswapfile
set directory=~/nvim/swap/
set writebackup


"" encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"" undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

"" tabs
set tabstop=4
set softtabstop=0
set shiftwidth=0
set smarttab

"" search
set showmatch

"" code
set textwidth=120
set t_Co=256
set list
set cc=81

"disable ex mode
nnoremap Q <Nop>

"" interactive
set mouse=a
" toggle hdr/src
"map <space>ch :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
" create tags
map <space>ct :!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --exclude=.git --exclude=.config --exclude=libs --extras=+q .<CR>

"" plugin configuration

" blamer
let g:blamer_template = '<author>, <committer-time> • <summary>'
let g:blamer_date_format = '%y-%m-%d'

" vimwikii
let g:vimwiki_list = [{'path': '~/box/sync/zettelkasten/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" Fugitive
"map <space>gg :Gstatus<CR>
"map <space>gb :Gblame<CR>

" ClangFormat
"map <space>cr :ClangFormat<CR>

" fzf
"map <space>ps :Ag<CR>
map <space>pt :Tags<CR>
"map <space>cf :BTags<CR>
"map <space>bs :BLines<CR>


" Netrw
let g:netrw_banner = 1
let g:netrw_altv = 1
"let g:netrw_liststyle = 3
let g:netrw_sort_options = "i"
let g:netrw_sort_sequence = '[\/]$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'

" Base16
let base16colorspace=256  " Access colors present in 256 colorspace

" hledger
autocmd FileType hledger setlocal omnifunc=hledger#complete#omnifunc

"map <space>cr :ClangFormat<CR>

" helpers

function! ToggleBackground()
	if &background == "dark"
		set background=light
	else
		set background=dark
	endif
endfunction

" key mapping
set timeoutlen=500
call which_key#register('<space>', "g:which_key_map")
nnoremap <silent> <space> :WhichKey '<Space>'<CR>
vnoremap <silent> <space> :WhichKeyVisual '<Space>'<CR>
let g:which_key_map =  {}

let g:which_key_map.c = { "name" : "+code" }
let g:which_key_map.c.h = [ ":FSHere" , "src/header" ]
let g:which_key_map.c.f = [ ":ClangFormat" , "format" ]
"let g:which_key_map.c.n = [ "<Plug>(coc-rename)" , "rename" ]
let g:which_key_map.c.r = { "name" : "+refactoring" }

let g:which_key_map.g = { "name" : "+git" }
let g:which_key_map.g.b = [ ":Gblame"  , "git blame"  ]
let g:which_key_map.g.g = [ ":Gstatus" , "git status" ]

let g:which_key_map.j = { "name" : "+jump" }
"let g:which_key_map.j.d = [ "<Plug>(coc-definition)"     , "definition"     ]
"let g:which_key_map.j.i = [ "<Plug>(coc-implementation)" , "implementation" ]
"let g:which_key_map.j.r = [ "<Plug>(coc-references)"     , "references"     ]

let g:which_key_map.p = { "name" : "+find" }
let g:which_key_map.p.b = [ ":Clap blines"     , "buffer"   ]
let g:which_key_map.p.f = [ ":CocList outline" , "functions"]
let g:which_key_map.p.g = [ ":Clap grep"       , "grep"     ]
let g:which_key_map.p.p = [ ":Clap gfiles"     , "filename" ]
let g:which_key_map.p.t = [ ":Clap tags"       , "tags"     ]
"let g:which_key_map.p.t = [ ":CocList symbols"       , "tags"     ]

let g:which_key_map.t = { "name" : "+toggle" }
let g:which_key_map.t.b = [ ":call ToggleBackground()" , "background"   ]
let g:which_key_map.t.g = [ ":BlamerToggle"            , "blame"        ]
let g:which_key_map.t.h = [ ":set cursorline!"         , "cursorline"   ]
let g:which_key_map.t.n = [ ":set number!"             , "line numbers" ]
let g:which_key_map.t.t = [ ":set list!"               , "spaces"       ]

let g:which_key_map.v = { "name" : "+vim" }
let g:which_key_map.v.r = [ ":so $MYVIMRC" , "reload" ]
let g:which_key_map.v.s = [ ":StartupTime" , "startup time" ]

let g:which_key_map.w = { "name" : "+windows" }
let g:which_key_map.w.s = [ ":so scrollbind!" , "scroll bind" ]
