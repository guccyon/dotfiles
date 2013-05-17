" ==================== 基本の設定 ==================== "
" 全般設定
set nocompatible            " 必ず最初に書く
set viminfo='20,<50,s10,h,! " YankRing用に!を追加
set shellslash              " Windowsでディレクトリパスの区切り文字に / を使えるようにする
set lazyredraw              " マクロなどを実行中は描画を中断
" colorscheme desert          " カラースキーム

" タブ周り
" tabstopはTab文字を画面上で何文字分に展開するか
" shiftwidthはcindentやautoindent時に挿入されるインデントの幅
" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=4 shiftwidth=4 softtabstop=0
set expandtab              " タブを空白文字に展開
set autoindent smartindent " 自動インデント，スマートインデント

" 入力補助
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions+=m           " 整形オプション，マルチバイト系を追加

" コマンド補完
set wildmenu           " コマンド補完を強化
set wildmode=list:full " リスト表示，最長マッチ

" 検索関連
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

" ファイル関連
set nobackup   " バックアップ取らない
set autoread   " 他で書き換えられたら自動で読み直す
set noswapfile " スワップファイル作らない
set hidden     " 編集中でも他のファイルを開けるようにする

" ヘルプファイル
if has('mac')
    helptags ~/.vim/doc/
endif
if has('win32')
    helptags ~/vimfiles/doc/
endif

"表示関連
set showmatch         " 括弧の対応をハイライト
set showcmd           " 入力中のコマンドを表示
set number            " 行番号表示
set wrap              " 画面幅で折り返す
set list              " 不可視文字表示
set listchars=tab:>\  " 不可視文字の表示方法
set notitle           " タイトル書き換えない
set scrolloff=5       " 行送り

" ステータスライン関連
set laststatus=2
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m

" エンコーディング関連
set ffs=unix,dos,mac " 改行文字

" 文字コードの自動認識
" 適当な文字コード判別
set term=ansi
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
"set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp
set fileencodings=utf-8,cp932,euc-jp

" 厳密な文字コード判別
" http://www.kawaz.jp/pukiwiki/?vim#content_1_7
" http://d.hatena.ne.jp/hazy-moon/20061229/1167407073
" if &encoding !=# 'utf-8'
    " set encoding=japan
    " set fileencoding=japan
" endif
" if has('iconv')
    " let s:enc_euc = 'euc-jp'
    " let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    " if iconv("?x87?x64?x87?x6a", 'cp932', 'eucjp-ms') ==# "?xad?xc5?xad?xcb"
        " let s:enc_euc = 'eucjp-ms'
        " let s:enc_jis = 'iso-2022-jp-3'
    " iconvがJISX0213に対応しているかをチェック
    " elseif iconv("?x87?x64?x87?x6a", 'cp932', 'euc-jisx0213') ==# "?xad?xc5?xad?xcb"
        " let s:enc_euc = 'euc-jisx0213'
        " let s:enc_jis = 'iso-2022-jp-3'
    " endif
    " fileencodingsを構築
    " if &encoding ==# 'utf-8'
        " let s:fileencodings_default = &fileencodings
        " let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        " let &fileencodings = &fileencodings .','. s:fileencodings_default
        " unlet s:fileencodings_default
    " else
        " let &fileencodings = &fileencodings .','. s:enc_jis
        " set fileencodings+=utf-8,ucs-2le,ucs-2
        " if &encoding =~# '^?(euc-jp?|euc-jisx0213?|eucjp-ms?)$'
            " set fileencodings+=cp932
            " set fileencodings-=euc-jp
            " set fileencodings-=euc-jisx0213
            " set fileencodings-=eucjp-ms
            " let &encoding = s:enc_euc
            " let &fileencoding = s:enc_euc
        " else
            " let &fileencodings = &fileencodings .','. s:enc_euc
        " endif
    " endif
    " 定数を処分
    " unlet s:enc_euc
    " unlet s:enc_jis
" endif

" UTF-8の□や○でカーソル位置がずれないようにする
" Terminal.appはどっちにしてもダメ，PrivatePortsのiTermでやる
set ambiwidth=double

" ファイルタイプ関連
" 使用できる色は
" :edit $VIMRUNTIME/syntax/colortest.vim
" :source %
" で、設定名と現在の色は
" :highlight

syntax on " シンタックスカラーリングオン

" なぜか動かない
" highlight ZenkakuSpace ctermbg=6 guibg=white
" match ZenkakuSpace /\s\+$\|　/

set complete+=k    " 補完に辞書ファイル追加
filetype indent on " ファイルタイプによるインデントを行う
filetype plugin on " ファイルタイプごとのプラグインを使う

" Omni補完関連
" $VIMRUNTIME/autoload/htmlcomplete.vimの645行目をコメントアウントしておくとhtmlの補完が小文字になる

set completeopt=menu,preview,menuone " 補完表示設定

" TabでOmni補完及びポップアップメニューの選択
function InsertTabWrapper(is_shift)
    if pumvisible()
        return a:is_shift ? "\<C-p>" : "\<C-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/' " htmlで補完できるように<,/でもOmni補完
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return a:is_shift ? "\<C-p>" : "\<C-n>"
    else
        return "\<C-x>\<C-o>"
    endif
endfunction
inoremap <tab> <C-r>=InsertTabWrapper(0)<CR>
" Shift-Tabはうまくいかないようだ
" inoremap <S-tab> <C-r>=InsertTabWrapper(1)<CR>

" CRでOmni確定&改行
function InsertCrWrapper()
    return pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
endfunction
inoremap <CR> <C-r>=InsertCrWrapper()<CR>

" ポップアップメニューの色変える
highlight Pmenu ctermbg=lightcyan ctermfg=black 
highlight PmenuSel ctermbg=blue ctermfg=black 
highlight PmenuSbar ctermbg=darkgray 
highlight PmenuThumb ctermbg=lightgray

" バイナリモード
" bviとかHexEditor.appの方が楽
" vim -b : edit binary using xxd-format!
" augroup BinaryXXD
  " autocmd!
  " autocmd BufReadPre *.bin,*.swf let &binary =1
  " autocmd BufReadPost * if &binary | silent %!xxd -g 1
  " autocmd BufReadPost * set ft=xxd | endif
  " autocmd BufWritePre * if &binary | %!xxd -r | endif
  " autocmd BufWritePost * if &binary | silent %!xxd -g 1
  " autocmd BufWritePost * set nomod | endif
" augroup END

" Migemo
if has('migemo')
    set migemo
    set migemodict=/opt/local/share/migemo/utf-8/migemo-dict
endif

" Kaoriya
if has('kaoriya')
    " imを無効にする
    set iminsert=0
    set imsearch=0
endif

" ==================== キーマップ ==================== "
" 表示行単位で移動
noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk

" ハイライト消す
nmap <silent> gh :nohlsearch<CR>

" コピペ
" Macの場合は普通にComamnd-C，Command-Vも使えたりする
if has('mac')
    map <silent> gy :call YankPB()<CR>
    function! YankPB()
        let tmp = tempname()
        call writefile(getline(a:firstline, a:lastline), tmp, 'b')
        silent exec ":!cat " . tmp . " | iconv -f utf-8 -t shift-jis | pbcopy"
    endfunction
endif
if has('win32')
    noremap gy "+y
    " ペーストがうまく動いてない
    noremap gp "+p
endif

" マウス操作を有効にする
" iTermのみ，Terminal.appでは無効
if has('mac')
    set mouse=a
    set ttymouse=xterm2
endif

" ==================== プラグインの設定 ==================== "

" Rails
autocmd FileType ruby,eruby,yaml set softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
let g:rails_level = 4

" CakePHP
au BufNewFile,BufRead *.thtml setfiletype php
au BufNewFile,BufRead *.ctp setfiletype php

" .vimperatorrc
au BufNewFile,BufRead .vimperatorrc,_vimperatorrc setfiletype vimperator

" Lusty Explorer
" nmap <unique> <silent> <C-b> :BufferExplorer<CR>
" nmap <unique> <silent> <C-e> :FilesystemExplorer<CR>

" NERD_comments
let NERDSpaceDelims = 1
let NERDShutUp = 1

" NERD_tree
nmap <unique> <silent> <C-e> :NERDTreeToggle<CR>

" Fuzzy
nmap <unique> <silent> <C-b> :FuzzyFinderBuffer<CR>
nmap <unique> <silent> <C-f> :FuzzyFinderFile<CR>
nmap <unique> <silent> <Leader>m :FuzzyFinderMruFile<CR>
nmap <unique> <silent> <Leader>c :FuzzyFinderMruCmd<CR>
nmap <unique> <silent> <Leader>d :FuzzyFinderDir<CR>

" AutoComplete
" 330行目らへんを修正してある
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_CompleteoptPreview = 1

" Project
" let g:proj_flags = "imstg"
" let g:proj_window_width = 30
" nmap <silent> <Leader>p <Plug>ToggleProject

" surround
autocmd FileType php let b:surround_45 = "<?php \r ?>"

" php-doc
autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR>
let g:pdv_cfg_Type = "string"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = ""
let g:pdv_cfg_Author = "tsukkee <takayuki0510@gmail.com>"
let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_License = ""

" Firefoxリロード
" 要MozRepl
function ReloadFirefox()
    if has('ruby')
        :ruby <<EOF
            require "net/telnet"

            telnet = Net::Telnet.new({
                "Host" => "localhost",
                "Port" => 4242
            })

            telnet.puts("content.location.reload(true)")
            telnet.close
EOF
    endif
endfunction
nmap <silent> <Leader>r :call ReloadFirefox()<CR>

" vimsh
nmap <silent> <Leader>s :so ~/.vim/vimsh/vimsh.vim<CR>

" visual studio
if has('win32')
    let g:visual_studio_python_exe = "C:/Python25/python.exe"
endif


