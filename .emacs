(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(load-path (cons "~/.emacs.d/site-lisp/" load-path))
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  (require 'init-loader)
  (init-loader-load "~/.emacs.d/inits")
  ;; 00 一般設定
  ;; 10 起動前実行系
  ;; 20 関数定義
  ;; 30 追加機能系
  ;; 40 メジャーモード
  ;; 50 マイナーモード
  ;; 90 起動後実行系
 )

