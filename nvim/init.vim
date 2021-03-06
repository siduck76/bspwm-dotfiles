call plug#begin('~/.local/share/nvim/site/plugged')
"Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'html'] }


Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'itchyny/lightline.vim'
"Plug 'arcticicestudio/nord-vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'Chiel92/vim-autoformat'
"Plug 'AndrewRadev/tagalong.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'rhysd/vim-clang-format'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tpope/vim-surround'
Plug 'chuling/ci_dark'

"if has('nvim') || has('patch-8.0.902')
"  Plug 'mhinz/vim-signify'
"else
"  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
"endif
call plug#end()

let g:AutoPairsFlyMode = 1

let g:auto_save = 1

let g:rainbow_active = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_no_function_highlight = 1

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''


let g:cpp_no_function_highlight = 1
let g:cpp_simple_highlight = 1

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on the bottom 
function! OpenTerminal()
  split term://fish
  resize 10
endfunction
nnoremap <c-x> :call OpenTerminal()<CR>
" new tab and switching between em 

nnoremap <c-e> : tabnew<CR>
nnoremap <c-w> : tabp <CR>
nnoremap <c-u> : tabn <CR>

" FZF settings with window splits 

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

set updatetime=100




let g:indentLine_enabled = 1
let g:indentLine_char_list = ['▏']
set expandtab sw=2
norm! gg=G
highlight EndOfBuffer ctermfg=black ctermbg=black

" format settings for clang 

let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "Standard" : "C++11",
      \ "BreakBeforeBraces" : "Stroustrup"}

" line nums and its fg
highlight VertSplit cterm=NONE
set numberwidth =5
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


let g:tagalong_verbose = 1

nnoremap <silent> <C-m> :%!astyle<CR>
nnoremap <silent> <C-a> :%y+<CR>

" nerdtree settings
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name



"highlight Directory ctermfg= red 

let g:NERDTreeWinSize=25
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-h> <C-w>h

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
"nnoremap <silent> <C-n> :CHADopen<CR>

let g:NERDTreeMinimalUI = 1

" lightline settings

syntax on
set termguicolors
colorscheme ci_dark

highlight! Normal guifg=NONE guibg=NONE


let g:lightline = {
      \   'colorscheme': 'deus',
      \   'active': {
      \     'left':[ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \     ]
      \   },
      \   'component': {
      \     'lineinfo': ' %3l:%-2v 󰀘 󰮯 ',
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      \   }
      \ }
let g:lightline.separator = {
      \   'left': '', 'right': ''
      \}
let g:lightline.subseparator = {
      \   'left': '', 'right': ''
      \}

let g:lightline.tabline = {
      \   'left': [ ['tabs'] ],
      \   'right': [ ['close'] ]
      \ }

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set mouse=a

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let NERDTreeDirArrowExpandable = ""
let NERDTreeDirArrowCollapsible = ""


" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=no

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
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>





let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name


" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "61afef"
let s:sidd = "51afef"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['png'] = s:blue " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['jpg'] = s:beige  
let g:NERDTreeExtensionHighlightColor['cpp'] = s:sidd
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDDirectory = s:red   

set clipboard+=unnamedplus  


function! GetHighlightGroup()
   let l:s = synID(line('.'), col('.'), 1)                                       
   echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
  endfunction

hi Directory guifg=#75C3FF
hi Number guifg=#75C3FF

hi WebDevIconsDefaultFolderSymbol guifg=#61afef 

nnoremap gA :call GetHighlightGroup()<CR>



"set splitright





nmap <Leader>py <Plug>(Prettier)






