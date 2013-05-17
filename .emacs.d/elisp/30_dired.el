;diredでQuickLookを使う
(setq dired-load-hook '(lambda () (load "dired-x")))
(setq dired-guess-shell-alist-user
      '(("\\.png" "qlmanage -p")
        ("\\.jpg" "qlmanage -p")
        ("\\.pdf" "qlmanage -p")))


