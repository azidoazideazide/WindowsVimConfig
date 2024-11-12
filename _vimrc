syntax on

set number relativenumber

set expandtab
set shiftwidth=4
set tabstop=4

set backspace=indent,eol,start

set mouse=a

set cursorline
:highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
if !has('gui_running')
    highlight CursorLine ctermbg=darkgrey
endif

" Color Scheme for different platform
if has('gui_running')
    colorscheme zaibatsu
else
    colorscheme base16-default-dark
endif

filetype plugin indent on

set clipboard=unnamedplus

set incsearch

set ignorecase
set smartcase

" Font Settings
if exists("*GuiFont")
    try
        set guifont=CaskaydiaCove\ Nerd\ Font:h11
    catch
        set guifont=Cascadia\ Mono:h11
    endtry    
else
    set guifont=Cascadia\ Mono:h11
endif

" Key Mapping
" \_insert mode quick moving
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>

" vim plug
call plug#begin('$HOME/vimfiles/plugged')
    " get vimtex
    Plug 'lervag/vimtex'
        let g:tex_flavor = 'latex'
        let g:vimtex_view_general_viewer = 'SumatraPDF'
        let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
        let g:vimtex_view_general_options_latexmk = '-reuse-instance'
        let g:vimtex_quickfix_mode = 0
    " get UltiSnips
    Plug 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    " get Conceal
    Plug 'KeitaNakamura/tex-conceal.vim'
        set conceallevel=1
        let g:tex_conceal='abdmg'
        hi Conceal ctermbg=none

    " Plug 'morhetz/gruvbox'
    Plug 'sheerun/vim-polyglot'
    Plug 'chriskempson/base16-vim'
call plug#end()

" Configure spell checking for the current buffer
setlocal spell
set spelllang=en_us
" Map Ctrl+l to check and correct misspellings interactively
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
