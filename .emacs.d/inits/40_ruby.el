;; ruby-mode

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq indent-tabs-mode t)
             (setq ruby-indent-level tab-width)))
