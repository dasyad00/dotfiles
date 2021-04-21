"" TODO add fzf somehow
set nocompatible
filetype off

map <C-F12> :source<Space>~/.vimrc
""
" vim-plug - vim plugins
""
call plug#begin()
" colorscheme
Plug 'altercation/vim-colors-solarized'
" Goyo - distraction-free, concentrate
Plug 'junegunn/goyo.vim'
Plug 'dkarter/bullets.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Evernote plugin
"Plug 'kakkyz81/evervim'
" auto-completion
"Plug 'davidhalter/jedi-vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ying17zi/vim-live-latex-preview'
"Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
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
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
"
" Jump to markers
autocmd Filetype tex,rmd,markdown inoremap <Space><Tab> <Esc>/<++><CR>"_c4l

autocmd BufWritePost ~/.config/scripts/folders,~/.config/scripts/configs !bash ~/.config/scripts/shortcuts.sh

" Python
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_python_binary_path='/usr/bin/python2'
"let g:ycm_server_python_interpreter='/usr/bin/python2'
autocmd FileType python nnoremap <F11> :!python<space><C-r>%<CR>
autocmd Filetype python set autoindent smartindent
augroup python_syntax_extra
    autocmd!
    autocmd! Syntax python :syn keyword Keyword self
augroup END
 
" Java Config
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" LaTeX config
autocmd FileType tex filetype indent off
autocmd FileType tex set noautoindent nosmartindent nocindent
autocmd Filetype tex let mapleader = ";"
autocmd Filetype tex nnoremap <F12> :!pdflatex<space>-shell-escape %<CR><CR>
autocmd FileType tex nnoremap <F11> :!zathura<space>--<space><C-r>%<backspace><backspace><backspace>pdf<Space>&<CR><CR>
autocmd FileType tex nnoremap <C-p> :!okular <C-r>%<backspace><backspace><backspace>pdf<Space>&<CR><CR>
autocmd Filetype tex inoremap <Space><Tab> <Esc>/<++><CR>"_c4l
autocmd Filetype tex inoremap <Leader>sec \section{}<Esc>0f}i
autocmd Filetype tex inoremap <Leader>ssec \subsection{}<Esc>0f}i
autocmd Filetype tex inoremap <Leader>sssec \subsubsection{}<Esc>0f}i
autocmd Filetype tex inoremap <Leader>b \textbf{}<++><Esc>F}i
autocmd Filetype tex inoremap <Leader>i \textit{}<++><Esc>F}i
autocmd Filetype tex inoremap <Leader>U \underline{}<++><Esc>F}i
autocmd Filetype tex inoremap <Leader>em \emph{}<++><Esc>F}i
autocmd FileType tex inoremap <Leader>cl \lstinline[]!<++>!<++><Esc>F]i
autocmd FileType tex inoremap <Leader>cb \begin{lstlisting}[]<CR><++><CR>\end{lstlisting}<Esc>2k0f]i
autocmd FileType tex inoremap <Leader>eq \begin{equation}<CR>\end{equation}<Esc>ko
"autocmd Filetype markdown,tex inoremap <Leader>tab \begin{center}<CR>\begin{tabular}<CR><++><CR>\end{tabular}<CR>\end{center}<Esc>3kA{}<Esc>i
"autocmd Filetype markdown,tex inoremap <Leader>ol \begin{enumerate}<CR><CR>\end{enumerate}<Esc>kA\item<Space>
"autocmd FileType markdown,tex inoremap <Leader>ul \begin{itemize}<CR><CR>\end{itemize}<Esc>kA\item<Space>
"autocmd FileType markdown,tex inoremap <Leader>li <CR>\item<Space>
" Markdown
autocmd FileType markdown,rmd setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
autocmd Filetype markdown,rmd inoremap ``` ```<CR><++><CR>```<Esc>kkA
"autocmd Filetype markdown,rmd inoremap <Leader>i **<space><++><Esc>5hi
"autocmd Filetype markdown,rmd inoremap <Leader>b ****<space><++><Esc>6hi
autocmd Filetype markdown map <F12> :!pandoc<space><C-r>%<space>--pdf-engine=pdflatex<space>-o<space><C-r>%<Backspace><Backspace>pdf<Enter><Enter>
autocmd FileType markdown map <F11> :!zathura<space>--<space><C-r>%<backspace><backspace>pdf<Space>&<CR><CR>
autocmd FileType markdown map <C-p> :!okular <C-r>%<backspace><backspace>pdf<Space>&<CR><CR>
autocmd Filetype rmd map <F12> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd FileType rmd map <F11> :!zathura<space>-- <C-r>%<backspace><backspace><backspace>pdf<Space>&<CR><CR>
autocmd FileType rmd map <C-p> :!okular <C-r>%<backspace><backspace><backspace>pdf<Space>&<CR><CR>
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

""
" Symbols
""
autocmd FileType markdown inoremap <Leader>> $\implies$
autocmd FileType markdown inoremap <Leader>= $\equiv$
autocmd FileType markdown inoremap <Leader><> $\iff$
autocmd FileType markdown inoremap <Leader>- $\lnot$
autocmd FileType markdown inoremap <Leader>^ $\wedge$
autocmd FileType markdown inoremap <Leader>v $\lor$
autocmd FileType markdown inoremap <Leader>x $\oplus$
autocmd FileType markdown inoremap <Leader>A $\forall$
autocmd FileType markdown inoremap <Leader>E $\exists$

autocmd FileType markdown inoremap ∴ $\therefore$
autocmd FileType markdown inoremap ε $\epsilon$
autocmd FileType markdown inoremap δ $\delta$
autocmd FileType markdown inoremap Δ $\Delta$
autocmd FileType markdown inoremap σ $\sigma$
autocmd FileType markdown inoremap Σ $\Sigma$
autocmd FileType markdown inoremap ρ $\rho$

""
" Pandoc config
""
"=== vim-pandoc ==="
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#folding#level = 0
"let g:pandoc#syntax#conceal#blacklist = ["titleblock", "list"]
"let g:pandoc#syntax#conceal#cchar_overrides = {"titleblock" : "*"}
"
" TODO make this work
" https://github.com/connermcd/dotfiles
" Pandoc and Notes {{{1
command! -nargs=1 Ngrep lvimgrep "<args>" ~/Documents/**/*.tex
nnoremap <leader>[ :Ngrep 
"
"command! -range=% Rst :'<,'>!pandoc -f markdown -t rst
"
"nnoremap 'ms :w!<cr>:exe "!pandoc -t beamer -V theme:boxes -V colortheme:beaver -o " . fnameescape(expand('%:p:r')) . ".pdf " . fnameescape(expand('%:p'))<cr>
"nnoremap 'mh :w!<cr>:exe "!pandoc --latex-engine=lualatex -H ~/.config/pandoc/fonts.tex -o " . fnameescape(expand('%:p:r')) . ".pdf " . fnameescape(expand('%:p'))<cr>
"nnoremap 'md :w!<cr>:exe "!pandoc --latex-engine=lualatex -H ~/.config/pandoc/fonts.tex -o $HOME/" . fnameescape(expand('%:t:r')) . ".pdf " . fnameescape(expand('%:p'))<cr>
"nnoremap 'mp :w!<cr>:exe "!pandoc --latex-engine=lualatex -H ~/.config/pandoc/fonts.tex -o /tmp/" . fnameescape(expand('%:t:r')) . ".pdf " . fnameescape(expand('%:p')) . " && xdg-open /tmp/" . fnameescape(expand('%:t:r')) . ".pdf"<cr>
"""""

set t_Co=256

noremap <F8> :set hlsearch! hlsearch?<CR>
nnoremap Y y$
" KONAMI
"nnoremap <UP><UP><DOWN><DOWN><LEFT><RIGHT><LEFT><RIGHT>ba<CR> o _  _____  _   _    _    __  __ ___ <CR><ESC>i\| \|/ / _ \\| \ \| \|  / \  \|  \/  \|_ _\|<CR><ESC>i\| ' / \| \| \|  \\| \| / _ \ \| \|\/\| \|\| \| <CR><ESC>i\| . \ \|_\| \| \|\  \|/ ___ \\| \|  \| \|\| \| <CR><ESC>i\|_\|\_\___/\|_\| \_/_/   \_\_\|  \|_\|___\|<CR><ESC>
"nnoremap <UP><UP><DOWN><DOWN><LEFT><RIGHT><LEFT><RIGHT>ba<CR> o'\|\|'  \|'   ..\|''\|\|   '\|.   '\|'     \|     '\|\|    \|\|' '\|\|' <CR><ESC>i \|\| .'    .\|'    \|\|   \|'\|   \|     \|\|\|     \|\|\|  \|\|\|   \|\| <CR><ESC>i \|\|'\|.    \|\|      \|\|  \| '\|. \|    \|  \|\|    \|'\|..'\|\|   \|\| <CR><ESC>i \|\|  \|\|   '\|.     \|\|  \|   \|\|\|   .''''\|.   \| '\|' \|\|   \|\| <CR><ESC>i.\|\|.  \|\|.  ''\|...\|'  .\|.   '\|  .\|.  .\|\|. .\|. \| .\|\|. .\|\|. <CR><ESC>

map <F9> :Goyo<CR>
let g:goyo_linenr=1
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'rmarkdown',
    \ 'rmd'
    \]

" coc config

let g:coc_global_extensions = [
    \ 'coc-python',
    \ ]

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <CR> to confirm completion, <C-g>u means break undo chain at current position
" Coc only does snippet and additional edit on confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <F2> <Plug>(coc-rename)
""
" Split config
""

" - More natural split opening
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

" shift+o
"set timeoutlen=100
