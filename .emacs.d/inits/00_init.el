;; 
;; 
;; 初期設定
;; 
;;


;; PATH
;(setq exec-path (cons "/usr/local/bin" exec-path))

;; mail address
;(setq user-mail-address "main@handlename.net")

;; meta key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; バックアップファイルを残さない
(setq make-backup-files nil)

;; ベルを鳴らさない
(setq ring-bell-function 'ignore)

;; 1行ずつスクロール
(setq scroll-step 1)

;; ステータスに行番号＆列番号表示
(column-number-mode t)
(setq default-fill-column 72)

;; 行番号表示
(global-linum-mode)
(setq linum-format "%4d")

;; 折り返さない
(setq truncate-lines t)
(setq truncate-partial-width-windows t)

;; インデント設定
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(c-set-offset 'case-label '+)

;; narrowingを使う
(put 'narrow-to-region 'disabled nil)

;; スタートページ非表示
(setq inhibit-startup-message t)

;; scratchバッファのメッセージを空に
(setq initial-scratch-message nil)

;; 警告音を消す 
(setq visible-bell t)

;; ファイル名の補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; カーソルの点滅を止める
(setq blink-cursor-mode nil)

;; 現在の関数名をモードラインに表示
(setq which-function-mode t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; ファイルを開く際に一覧をミニバッファに表示
;(ido-mode t)


