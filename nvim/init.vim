:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4


let mapleader = " "
call plug#begin()
Plug 'habamax/vim-godot'
Plug 'preservim/nerdtree'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'http://github.com/tpope/vim-surround' " Surrounding 
Plug 'https://github.com/eldritch-theme/eldritch.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'navarasu/onedark.nvim'
Plug '/opt/homebrew/opt/fzf'
Plug 'kien/ctrlp.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()

set encoding=utf8

" :colorscheme eldritch

colorscheme onedark

lua require('toggleterm-config')
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

nmap <C-x> :TagbarToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
EOF
