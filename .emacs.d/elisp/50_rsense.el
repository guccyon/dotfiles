;; $RSENSE_HOMEはRSenseをインストールしたディレクトリのフルパスに置き換えてください
(setq rsense-home (expand-file-name "~/opt/rsense"))
;; UNIX系システムでの例
;; (setq rsense-home "/home/tomo/opt/rsense-0.2")
;; あるいは
;; (setq rsense-home (expand-file-name "~/opt/rsense-0.2"))
;; Windowsでの例
;; (setq rsense-home "C:\\rsense-0.2")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; C-c .で補完
(add-hook 'ruby-mode-hook
    (lambda () (local-set-key (kbd "C-c .") 'rsense-complete)))
;    (lambda () (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

;; .と::の直後に補完開始
;(add-hook 'ruby-mode-hook
;    (lambda ()
;          (add-to-list 'ac-sources 'ac-source-rsense-method)
;          (add-to-list 'ac-sources 'ac-source-rsense-constant)))

