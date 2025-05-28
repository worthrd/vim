:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4

autocmd BufEnter * if &buftype == '' | lcd %:p:h | endif
let $PYTHONPATH = '.'
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
"Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'EdenEast/nightfox.nvim'
call plug#end()

set showcmd
set encoding=utf8
set guicursor=
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
" colorscheme eldritch

" colorscheme onedark
colorschem dayfox

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

" Check if backspace is possible
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for completion or fallback
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

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
