"
"NEOVIM CONFIG
"






call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Autocomplete
Plug 'kyazdani42/nvim-web-devicons'			" Handy Icons
Plug 'ryanoasis/vim-devicons'				" Handy icons
Plug 'preservim/nerdtree'				" File Tree
Plug 'mhinz/vim-startify'                               " cool start up screen
Plug 'Jorengarenar/vim-MvVis'                           " move visual selection
Plug 'vim-airline/vim-airline'                          " airline status bar
Plug 'hzchirs/vim-material'                             " material color themes
Plug 'luochen1990/rainbow'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'ap/vim-css-color'
Plug 'vim-python/python-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'romgrk/barbar.nvim'

call plug#end()









	

" Settings
set guifont=monospace:h10
set relativenumber
set cursorline
set laststatus=2
set cmdheight=1
set scrolloff=50
set termguicolors

let g:python_highlight_all = 1



let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Enable/disable icons
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null






" Themeing
let g:material_style = 'oceanic'
colorscheme vim-material
hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
hi Comment gui=italic cterm=italic                      " italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words











"Activate Rainbow brackets
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
nnoremap <C-T> :tabnext <CR>


"" startify
autocmd VimEnter * Startify
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'commands' },
    \ ]

" bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim'},
    \ ]

" custom commands
let g:startify_commands = [
    \ {'ch':  ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'uc': ['Update coc Plugins', ':CocUpdate']},
    \ {'h':  ['Help', ':help']},
    \ ]

" NerdTree business
let g:NERDTreeCustomOpenArgs={'file':{'where': 't'}}
nnoremap <C-n> :NERDTree <CR> 
autocmd VimEnter * :NERDTree


" Airline
let g:airline_theme='material'
let g:airline_skip_empty_sections = 1
let g:airline_section_warning = ''
let g:airline_section_x=''
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2   " show tabline only if there is more than 1 buffer
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
let airline#extensions#coc#error_symbol = '✘:'
let airline#extensions#coc#warning_symbol = '⚠:'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.dirty= ''


" indentLine
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
let g:indentLine_fileTypeExclude = ['startify']

" Tabs
let g:vem_tabline_show=2
highlight VemTablineNormal           term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#40c4c6 guibg=#012241 gui=none
highlight VemTablineLocation         term=reverse cterm=none ctermfg=239 ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
highlight VemTablineNumber           term=reverse cterm=none ctermfg=239 ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
highlight VemTablineSelected         term=bold    cterm=bold ctermfg=0   ctermbg=255 guifg=#242424 guibg=#ffffff gui=bold
highlight VemTablineLocationSelected term=bold    cterm=none ctermfg=239 ctermbg=255 guifg=#666666 guibg=#ffffff gui=bold
highlight VemTablineNumberSelected   term=bold    cterm=none ctermfg=239 ctermbg=255 guifg=#666666 guibg=#ffffff gui=bold
highlight VemTablineShown            term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#242424 guibg=#cdcdcd gui=none
highlight VemTablineLocationShown    term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
highlight VemTablineNumberShown      term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
highlight VemTablineSeparator        term=reverse cterm=none ctermfg=246 ctermbg=251 guifg=#888888 guibg=#cdcdcd gui=none
highlight VemTablinePartialName      term=reverse cterm=none ctermfg=246 ctermbg=251 guifg=#888888 guibg=#cdcdcd gui=none
highlight VemTablineTabNormal        term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#242424 guibg=#4a4a4a gui=none
highlight VemTablineTabSelected      term=bold    cterm=bold ctermfg=0   ctermbg=255 guifg=#242424 guibg=#ffffff gui=bold








" Aliases
let mapleader=","
nnoremap ; :
nmap \ <leader>q
map <F6> :Startify <CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
map <leader>s :Format<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
noremap <leader>e :PlugInstall<CR>
noremap <C-q> :q<CR>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap <C-W> :tabclose <CR>
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd VimEnter * redraw
