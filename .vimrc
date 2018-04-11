set nocompatible
filetype off

" vim-plug - vim plugins
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'davidhalter/jedi-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
set tabstop=4

" Python Config
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_server_python_interpreter='/usr/bin/python'
 
" Java Config
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" LaTeX config
autocmd Filetype tex nnoremap <F12> :!pdflatex %<CR><CR>
autocmd Filetype tex inoremap <Space><Tab> <Esc>/<++><CR>"_c4l
autocmd Filetype tex inoremap ;sec \section{}<Esc>0f}i
autocmd Filetype tex inoremap ;ssec \subsection{}<Esc>0f}i<++>
autocmd Filetype tex inoremap ;sssec \subsubsection{}<Esc>0f}i
autocmd Filetype tex inoremap ;bf \textbf{}<++><Esc>F}i
autocmd Filetype tex inoremap ;it \textit{}<++><Esc>F}i
autocmd Filetype tex inoremap ;U \underline{}<++><Esc>F}i
autocmd Filetype tex inoremap ;em \emph{}<++><Esc>F}i
autocmd Filetype tex inoremap ;tab \begin{center}<CR>\begin{tabular}<CR><++><CR>\end{tabular}<CR>\end{center}<Esc>3kA{}<Esc>i
autocmd Filetype tex inoremap ;ol \begin{enumerate}<CR><CR>\end{enumerate}<Esc>kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<CR><CR>\end{itemize}<Esc>kA\item<Space>
autocmd FileType tex inoremap ;li <CR>\item<Space>
autocmd FileType tex inoremap ;cl \lstinline[]!<++>!<++><Esc>F]i
autocmd FileType tex inoremap ;cb \begin{lstlisting}[]<CR><++><CR>\end{lstlisting}<Esc>2k0f]i

set t_Co=256

" Custom binds
noremap <F8> :set hlsearch! hlsearch?<CR>
" NERDTree
map <C-n>    :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '\.aux$', '\.log', '\.bbl', '\.blg']
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Split config
" More natural split opening
set splitbelow
set splitright
" Moving between splits
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>
nnoremap <C-H> <C-W><C-h>
" Resizing splits
nnoremap <C-Y> <C-W>5<
nnoremap <C-U> <C-W>5-
nnoremap <C-I> <C-W>5+
nnoremap <C-O> <C-W>5>

