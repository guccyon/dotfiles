;; anything.el
(require 'anything-config)

(add-to-list 'anything-sources 'anything-c-source-emacs-commands)
(define-key anything-map "\C-p" 'anything-previous-line)
(define-key anything-map "\C-n" 'anything-next-line)
(define-key anything-map "\C-v" 'anything-next-page)
(define-key anything-map "\M-v" 'anything-previous-page)

(global-set-key "\C-xb" 'anything)
