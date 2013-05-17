; template
;(defun ${command} ()
;  "${description_for_this_command}"
;  (interactive)
;  (save-excursion
;    (shell-command-on-region (point) (mark) "${script_path}" nil t)))

; test
(defun test-call-ruby ()
  "call ruby script"
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "~/.emacs.d/ext-scripts/test.rb" nil t)))

