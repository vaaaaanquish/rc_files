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

let root_path = '/Users/shunsuke.kawai/'
let using_python = root_path . '.pyenv/versions/3.6.8/lib/python3.6/'


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
" 自動コメント挿入をオフに
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END
" xonshファイルもpythonファイルとして扱う
autocmd BufRead,BufNewFile *.xonshrc setfiletype python
autocmd BufRead,BufNewFile *.xsh setfiletype python
"行頭へ移動
inoremap <C-a> <C-o>^
"行末へ移動
inoremap <C-e> <C-o>$
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


" ---------------- Leader ------------------
let mapleader = "\<Space>"
" <Space>wを押してファイルを保存する
nnoremap <Leader>w :w<CR>
" <Space>qを押してファイルを閉じる
nnoremap <Leader>q :q<CR>
" <Space><Space>でビジュアルラインモードに切り替える
nmap <Leader><Leader> V

" ---------------- neovim term ------------------------
" shellからESCでcommand modeにする
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <Leader>j <C-\><C-n>


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
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" x,sではyankしない
nnoremap x "_x
nnoremap s "_s
set listchars=tab:^\ ,trail:~  " 行末のスペースを可視化
" アクティブウィンドウに限りカーソル行(列)を協調
augroup vimrc_set_cursorline_only_active_window
  autocmd!
  autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
nnoremap mm :set nonumber!<CR>

" ---------------- 検索 ----------------
set ignorecase  " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan  " 検索時に最後まで行ったら最初に戻る
set hlsearch  " 検索語をハイライト表示
 " ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" POWERLINE
exe 'set rtp+=' . using_python . 'site-packages/powerline/bindings/vim/'
" 検索後にジャンプした際に検索単語を画面中央に持ってくるやつ
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz


" ---------------- マクロ ----------------
" 横分割
nnoremap sv :<C-u>vs<CR>
" 縦分割
nnoremap sp :<C-u>sp<CR>
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap <Leader>j <Esc> 
" vを二回で行末まで選択
vnoremap v $h
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %


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
if &compatible
  set nocompatible
endif
exe 'set runtimepath+='. root_path . '.cache/dein/repos/github.com/Shougo/dein.vim'
if dein#load_state(root_path . '.cache/dein')
  call dein#begin(root_path . '.cache/dein')
  call dein#add(root_path . '.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml(root_path . '.config/nvim/dein.toml', {'lazy': 0})
  " call dein#load_toml(root_path . '.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

