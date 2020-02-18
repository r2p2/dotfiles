call plug#begin('~/.vim/plugged')
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" coc
" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
"nmap <space>cw <Plug>(coc-rename)

" Remap for format selected region
"xmap <space>cr  <Plug>(coc-format-selected)
"nmap <space>cr  <Plug>(coc-format-selected)

"map <space>cr :ClangFormat<CR>
augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <space>ca  <Plug>(coc-codeaction-selected)
nmap <space>ca  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"Plug 'Valloric/YouCompleteMe'

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
let g:which_key_map.c.n = [ "<Plug>(coc-rename)" , "rename" ]
let g:which_key_map.c.r = { "name" : "+refactoring" }
let g:which_key_map.c.r.q = [ "<Plug>(coc-fix-current)" , "quick fix" ]

let g:which_key_map.g = { "name" : "+git" }
let g:which_key_map.g.b = [ ":Gblame"  , "git blame"  ]
let g:which_key_map.g.g = [ ":Gstatus" , "git status" ]

let g:which_key_map.j = { "name" : "+jump" }
let g:which_key_map.j.d = [ "<Plug>(coc-definition)"     , "definition"     ]
let g:which_key_map.j.i = [ "<Plug>(coc-implementation)" , "implementation" ]
let g:which_key_map.j.r = [ "<Plug>(coc-references)"     , "references"     ]

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
