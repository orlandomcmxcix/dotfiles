set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

set nu
set nocompatible
syntax on
set ai
set ignorecase
set mouse=a
set ruler
set backspace=indent,eol,start
set cursorline
set history=1000
set linebreak
set confirm
set laststatus=2

nnoremap n nzz
nnoremap N Nzz
nnoremap \y "+y
nnoremap \p "+p
nnoremap \P "+P
nnoremap \y "+Y

nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>


map <C-0> :ls<CR>
map <C-1> :buffer 1<CR>
map <C-2> :buffer 2<CR>
map <C-3> :buffer 3<CR>
map <C-4> :buffer 4<CR>
map <C-5> :buffer 5<CR>
map <C-6> :buffer 6<CR>
map <C-7> :buffer 7<CR>
map <C-8> :buffer 8<CR>
map <C-9> :buffer 9<CR>

vnoremap . :normal.<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" Vimwiki default folder
let g:vimwiki_list = [{'path':'~/vimwiki', 'path_html':'~/cerebra/export/html/'}]
" Undofile
set undofile
set undodir=~/.vim/undodir
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vimwiki/vimwiki'

"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" EASYMOTION

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)
"
" " Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

map <Leader>t <Plug>(easymotion-bd-t)
map <Leader>f <Plug>(easymotion-bd-f)
omap <Leader>t <Plug>(easymotion-tl)
omap <Leader>f <Plug>(easymotion-fl)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Folding
augroup auto_save_folds
autocmd!
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
" Rel numbers
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

" Paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

" Templates
autocmd BufNewFile *.tex 0r ~/.vim/templates/tex.tpl

" * search for selected text in visual mode
xnoremap * "zy/\V<C-r>=escape(@z, '\/')<CR><CR>

" print wiki minimal file with lp
" no Wikibuf because of w[tab] completion
command Uikibuf enew | set filetype=vimwiki
function! StampaBuffer()
    if @% == ""
        let temp_file = tempname()
        execute "write! " . temp_file
        execute "!lp " . temp_file
"        execute "silent !rm " . temp_file
    else
        execute "!lp %"
    endif
endfunction
command Stampa call StampaBuffer()
