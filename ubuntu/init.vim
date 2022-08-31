""" pyenv python, rbenv ruby, node.js
""" pip install from requirement
""" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
""" sh ./installer.sh ~/.cache/dein
""" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""" vim-monokai
""" mkdir ~/.vim
""" cd ~/.vim
""" mkdir colors
""" git clone https://github.com/tomasr/molokai
""" mv molokai/colors/molokai.vim ~/.vim/colors/
""" rbenv exec gem install redcarpet pygments.rb
""" npm -g install instant-markdown-d

let root_path = '/home/vanquish/'
let using_python = '/usr/bin/python'


" ---------------- keymap ----------------
let mapleader = "\<Space>"
" <Space>wを押してファイルを保存する
nnoremap <Leader>w :w<CR>
" <Space>qを押してファイルを閉じる
nnoremap <Leader>q :q!<CR>
" <Space><Space>でビジュアルラインモードに切り替える
nmap <Leader><Leader> V
" ctrl+aで行頭へ移動
map <C-a> ^
inoremap <C-a> <C-o>^
""" ctrl+eで行末へ移動
map <C-e> $
inoremap <C-e> <C-o>$
""" ctrl+fで検索
map <Leader>f /
" insert時にctrl+bでdel
inoremap <C-b> <BS>
" termからESCでcommand modeにする
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <Leader>; <C-\><C-n>
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" x,sではyankしない
nnoremap x "_x
nnoremap s "_s
" mmでnonumber
nnoremap mm :set nonumber!<CR>
 " ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" wを2回で単語選択
inoremap <silent> ww <Esc>viw
" 入力モード中にSpace+;と入力した場合はESCとみなす
inoremap <Leader>; <Esc> 
" 検索後にジャンプした際に検索単語を画面中央に持ってくるやつ
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" 横分割
nnoremap sv :<C-u>vs<CR>
" 縦分割
nnoremap sp :<C-u>sp<CR>
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" ブラウザでURLを開く
map <Leader>b gx
" shift uでredo
nnoremap U <c-r>
" マウス無効化
set mouse=


" ---------------- 入力、システム周り ----------------
set shell=/bin/zsh  " shell
set backspace=indent,eol,start  " バックスペース
set backup  " バックアップファイ作る
set backupdir=/tmp/  " backup
set undofile  " undoファイルを生成
set noswapfile  " スワップファイルを作らない
set autoread  " 編集中のファイルが変更されたら自動で読み直す
set hidden  " バッファが編集中でもその他のファイルを開けるように
set showcmd  " 入力中のコマンドをステータスに表示する
set ambiwidth=double  " 全角文字専用の設定
set noerrorbells  " エラーメッセージの表示時にビープを鳴らさない
set encoding=utf-8  " ファイルエンコーディング
set fileencodings=utf-8  " ファイルエンコーディング
set fileformats=unix,dos,mac  " エンコーディング適応先
set clipboard=unnamed,unnamedplus  " yankをクリップボードに
set ttyfast  " ターミナル接続を高速化
" 自動コメント挿入をオフに
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END
" xonshファイルもpythonファイルとして扱う
autocmd BufRead,BufNewFile *.xonshrc setfiletype python
autocmd BufRead,BufNewFile *.xsh setfiletype python
" https://github.com/sentientmachine/Pretty-Vim-Python/
highlight Comment cterm=bold

" ファイルを開いた時に、以前のカーソル位置を復元する
function! s:RestoreCursorPostion()
   if line("'\"") <= line("$")
     normal! g'"
     return 1
   endif
endfunction
augroup vimrc_restore_cursor_position
  autocmd!
  autocmd BufWinEnter * call s:RestoreCursorPostion()
augroup END




" ---------------- タブ入力 ----------------
set expandtab  " Tab文字を半角スペースにする
set tabstop=4  " 行頭以外のTab文字の表示幅
set shiftwidth=4  " 行頭でのTab文字の表示幅
set softtabstop=4  " タブキー押下時に挿入される文字幅を指定
set wildmode=longest:full,full  " タブでコマンド補完
set shiftround  " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める


" ---------------- 見た目系 ----------------
syntax on  " シンタックスハイライト
set number  " 行番号を表示
set cursorline  " 現在の行を強調表示
set list  " 不可視文字の可視化
set cursorcolumn  " 現在の行を強調表示（縦）
hi Comment ctermfg=3  " コメントの色を水色
set virtualedit=onemore  " 行末の1文字先までカーソルを移動できるように
set smartindent  " インデントはスマートインデント
set visualbell  " ビープ音を可視化
set showmatch  " 括弧入力時の対応する括弧を表示
set matchtime=2
set matchpairs& matchpairs+=<:>
set laststatus=2  " ステータスラインを常に表示
set wildmode=list:longest  " コマンドラインの補完
set listchars=tab:^\ ,trail:~  " 行末のスペースを可視化
" アクティブウィンドウに限りカーソル行(列)を協調
augroup vimrc_set_cursorline_only_active_window
  autocmd!
  autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END


" ---------------- 検索 ----------------
set ignorecase  " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan  " 検索時に最後まで行ったら最初に戻る
set hlsearch  " 検索語をハイライト表示
" POWERLINE
exe 'set rtp+=' . using_python . 'site-packages/powerline/bindings/vim/'


" ---------------- python ----------------
let PATH = expand(root_path . ".pyenv/shims") . ":" . $PATH
if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif
" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim
syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special
let b:current_after_syntax = 'python'
let &cpo = s:cpo_save
unlet s:cpo_save
augroup PythonCustomization
   :autocmd FileType python syn match PythonArg "\(\W\|^\)\@<=self\([\.,)]\)\@="
   :autocmd FileType python hi PythonArg ctermfg = 214 guifg = #ffaf00
augroup END


" ---------------- dein.vim --------------
exe 'set runtimepath+='. root_path . '.cache/dein/repos/github.com/Shougo/dein.vim'
if dein#load_state(root_path . '.cache/dein')
  call dein#begin(root_path . '.cache/dein')
  call dein#add(root_path . '.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml(root_path . '.config/nvim/dein.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable
if dein#check_install()
  call dein#install()
endif

" ---------- https://teratail.com/questions/37382
colorscheme molokai
syntax enable
let g:molokai_original = 1
set t_Co=256

" ---------------- background black --------------
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" ---------------- python host ------------------
let g:python3_host_prog = using_python

" ----------------- start term ------------------
set nocompatible
filetype off
let &runtimepath.=',~/.config/nvim/bundle/neoterm'
filetype plugin on
let g:neoterm_size = 30
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
set sh=/bin/zsh
function! TermT()
if g:neoterm.has_any()
    call neoterm#toggle({'mod': '', 'target': 0})
else
    call neoterm#toggle({'mod': 'belowright', 'target': 0})
end
endfunction
nnoremap <Leader>t :call TermT()<CR>
autocmd VimEnter * call TermT()
autocmd VimEnter * call TermT()
autocmd VimEnter * stopinsert

" https://github.com/neovim/neovim/issues/11393
cnoremap 00 <c-u>undo<CR>
