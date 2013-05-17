(setq load-path (cons "~/.emacs.d/elisp/rhtml" load-path))

(require 'rhtml-mode)

(setq auto-mode-alist (cons '("\\.erb$" . rhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rhtml$" . rhtml-mode) auto-mode-alist))

