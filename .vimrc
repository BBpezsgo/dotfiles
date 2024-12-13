
" =========
"  Plugins
" =========

call plug#begin()
Plug 'rose-pine/vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree'
Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'puremourning/vimspector'
Plug 'mengelbrecht/lightline-bufferline'
call plug#end()

" =========
"  General
" =========

set encoding=UTF-8
set ignorecase
set nu
set belloff=all
set laststatus=2

filetype plugin on

" =======
"  Theme
" =======

set background=dark
set guifont=Cousine\ Nerd\ Font,\ Regular
set noshowmode
colorscheme rosepine
highlight default link LightlineLeft_normal_tabsel Error
highlight default link LightlineLeft_active_tabsel Error
highlight default link LightlineLeft_command_tabsel Error

" ==============
"  Key Mappings
" ==============

nmap <F6> :NERDTreeToggle<CR>
map <C-Up> :m -2<CR>
map <C-k> :m -2<CR>
map <C-Down> :m +1<CR>
map <C-j> :m +1<CR>
nnoremap d "_d
nnoremap c d
nnoremap C D
vnoremap c d
nnoremap x "_x
set clipboard=unnamedplus

" ======
"   C#
" ======

highlight default link SharpenUpLoading MoreMsg
highlight default link SharpenUpReady MoreMsg
highlight default link SharpenUpDead Error

let g:sharpenup_codeactions_glyph = ''

let g:sharpenup_statusline_opts = {
\ 'TextLoading': ' %s loading... (%p of %P) ',
\ 'TextReady': ' %s ',
\ 'TextDead': ' Not running ',
\ 'Highlight': 1,
\ 'HiLoading': 'SharpenUpLoading',
\ 'HiReady': 'SharpenUpReady',
\ 'HiDead': 'SharpenUpDead'
\}

let g:lightline = {
\ 'active': {
\   'left': [['mode','paste'], ['buffers']],
\   'right': [['lineinfo'], ['fileformat', 'fileencoding', 'filetype', 'sharpenup']]
\ },
\ 'inactive': {
\   'right': [['lineinfo']]
\ },
\ 'component': {
\   'sharpenup': sharpenup#statusline#Build()
\ },
\ 'component_expand': {
\   'buffers': 'lightline#bufferline#buffers'
\ },
\ 'component_type': {
\   'buffers': 'tabsel'
\ },
\ 'colorscheme': 'rosepine'
\}

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

augroup lightline_integration
  autocmd!
  autocmd User OmniSharpStarted,OmniSharpReady,OmniSharpStopped call lightline#update()
augroup END

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

let g:OmniSharp_popup_options = {
\ 'highlight': 'Normal',
\ 'padding': [1],
\ 'border': [1],
\ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
\ 'borderhighlight': ['Special']
\}


" ==========
"  NerdTree
" ==========

autocmd VimEnter * NERDTree
highlight Directory ctermfg=yellow
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" =========================
"  Better lightline colors
" =========================

let s:base    = [ '#191724', 234 ]
let s:surface = [ '#1f1d2e', 234 ]
let s:overlay = [ '#26233a', 235 ]
let s:muted   = [ '#6e6a86', 60 ]
let s:subtle  = [ '#908caa', 103 ]
let s:text    = [ '#e0def4', 189 ]
let s:love    = [ '#eb6f92', 204 ]
let s:gold    = [ '#f6c177', 222 ]
let s:rose    = [ '#ebbcba', 181 ]
let s:pine    = [ '#31748f', 31 ]
let s:foam    = [ '#9ccfd8', 152 ]
let s:iris    = [ '#c4a7e7', 183 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:base, s:rose, 'bold' ], [ s:muted, s:surface ] ]
let s:p.normal.right    = [ [ s:base, s:rose ], [ s:muted, s:surface ] ]
let s:p.normal.middle   = [ [ s:text, s:surface ] ]
let s:p.normal.error    = [ [ s:overlay, s:iris ] ]
let s:p.normal.warning  = [ [ s:surface, s:foam ] ]

let s:p.inactive.left   = [ [ s:overlay, s:surface ], [ s:overlay, s:surface ] ]
let s:p.inactive.right  = [ [ s:overlay, s:surface ], [ s:overlay, s:surface ] ]
let s:p.inactive.middle = [ [ s:overlay, s:surface ] ]

let s:p.insert.left     = [ [ s:base, s:pine, 'bold' ], [ s:text, s:surface ] ]
let s:p.insert.right    = [ [ s:base, s:pine ], [ s:text, s:surface ] ]
let s:p.insert.middle   = [ [ s:text, s:surface ] ]

let s:p.replace.left    = [ [ s:base, s:love, 'bold' ], [ s:text, s:surface ] ]
let s:p.replace.right   = [ [ s:base, s:love ], [ s:text, s:surface ] ]
let s:p.replace.middle  = [ [ s:text, s:surface ] ]

let s:p.visual.left     = [ [ s:base, s:gold, 'bold' ], [ s:text, s:surface ] ]
let s:p.visual.right    = [ [ s:base, s:gold ], [ s:text, s:surface ] ]
let s:p.visual.middle   = [ [ s:text, s:surface ] ]

let s:p.tabline.left    = [ [ s:overlay, s:surface ] ]
let s:p.tabline.right   = [ [ s:overlay, s:surface ] ]
let s:p.tabline.middle  = [ [ s:overlay, s:surface ] ]
let s:p.tabline.tabsel  = [ [ s:text, s:overlay ] ]

let g:lightline#colorscheme#rosepine#palette = lightline#colorscheme#flatten(s:p)
