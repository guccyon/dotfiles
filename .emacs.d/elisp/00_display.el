;;
;;
;; 表示関連の設定
;;
;;


;;
;; Window settings
;;______________________________________________________________________

(if window-system
    (progn
      (set-frame-parameter nil 'alpha 90) ; 透明度
      (tool-bar-mode nil)                  ; ツールバー非表示
      (set-scroll-bar-mode nil)            ; スクロールバー非表示
      (setq line-spacing 0.2)              ; 行間
      (setq initial-frame-alist
            (append (list
                     '(width . 120) ;; ウィンドウ幅
                     '(height . 60) ;; ウィンドウ高さ
                     '(top . 50) ;; 表示位置
                     '(left . 340) ;; 表示位置
                     )
                    initial-frame-alist))
      (setq default-frame-alist initial-frame-alist)
      (when (>= emacs-major-version 23)
        (tool-bar-mode nil)
        ;(set-frame-font "Menlo-12")
        ;(set-frame-font "Inconsolata-12")
        (set-frame-font "Consolas-14")
        ;(set-face-font 'variable-pitch "Inconsolata-11")
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                          (font-spec :family "M+2VM+IPAG circle" :size 14)))
      (setq ns-pop-up-frames nil)))

;====================================
; Initial フレームサイズ,位置,色,フォントなど
;====================================

;;
;; Color
;;______________________________________________________________________

(set-foreground-color                                  "#CCCCCC") ; 文字色
(set-background-color                                  "#111111") ; 背景色
(set-cursor-color                                      "#FF0000") ; カーソル色
(set-face-background 'region                           "#222244") ; リージョン
(set-face-foreground 'modeline                         "#CCCCCC") ; モードライン文字
(set-face-background 'modeline                         "#333333") ; モードライン背景
(set-face-foreground 'mode-line-inactive               "#333333") ; モードライン文字(非アクティブ)
(set-face-background 'mode-line-inactive               "#CCCCCC") ; モードライン背景(非アクティブ)
(set-face-foreground 'font-lock-comment-delimiter-face "#888888") ; コメントデリミタ
(set-face-foreground 'font-lock-comment-face           "#888888") ; コメント
(set-face-foreground 'font-lock-string-face            "#7FFF7F") ; 文字列
(set-face-foreground 'font-lock-function-name-face     "#BF7FFF") ; 関数名
(set-face-foreground 'font-lock-keyword-face           "#FF7F7F") ; キーワード
(set-face-foreground 'font-lock-constant-face          "#FFBF7F") ; 定数(this, selfなども)
(set-face-foreground 'font-lock-variable-name-face     "#7F7FFF") ; 変数
(set-face-foreground 'font-lock-type-face              "#FFFF7F") ; クラス
(set-face-foreground 'fringe                           "#666666") ; fringe(折り返し記号なでが出る部分)
(set-face-background 'fringe                           "#282828") ; fringe

(add-hook 'org-mode-hook
          '(lambda ()
             (set-face-foreground 'org-hide "#282828")))

(add-hook 'mmm-mode-hook
          '(lambda ()
             (set-face-background 'mmm-default-submode-face "#404040")))

(add-hook 'linum-mode-hook
          '(lambda ()
             (set-face-foreground 'linum "#666666")
             (set-face-background 'linum "#000000")))
