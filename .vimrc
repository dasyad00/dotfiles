set nocompatible
filetype off

" vim-plug - vim plugins
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ying17zi/vim-live-latex-preview'
Plug 'tpope/vim-surround'
call plug#end()
" vim-plug - end

set relativenumber
set number
set wildmode=longest:list,full
set ignorecase
set smartcase

syntax on
filetype plugin indent on
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set expandtab
set shiftwidth=4
set softtabstop=4

" LaTeX config
autocmd Filetype tex nnoremap <F12> :!pdflatex %<CR><CR>
autocmd Filetype tex nnoremap <C-P> :call PDFViewingToggle()<CR>

autocmd Filetype tex inoremap <Space><Tab> <Esc>/<++><CR>"_c4l
autocmd Filetype tex inoremap ;sec \section{}<CR><CR><++><Esc>2kf}i
autocmd Filetype tex inoremap ;ssec \subsection{}<CR><CR><++><Esc>2kf}i
autocmd Filetype tex inoremap ;sssec \subsubsection{}<CR><CR><++><Esc>2kf}i
autocmd Filetype tex inoremap ;tab \begin{tabular}<CR><++><CR>\end{tabular}<CR><CR><++><Esc>4kA{}<Esc>i
autocmd Filetype tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>

"set updatetime=1000
" set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/
" set laststatus=2
set t_Co=256
" set term=xterm=256color

" Custom binds
noremap <F8> :set hlsearch! hlsearch?<CR>
map <C-n> :NERDTreeToggle<CR>

" Split config
" More natural split opening
set splitbelow
set splitright
" Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Resizing splits
nnoremap <C-Y> <C-W>5<
nnoremap <C-U> <C-W>5-
nnoremap <C-I> <C-W>5+
nnoremap <C-O> <C-W>5>
