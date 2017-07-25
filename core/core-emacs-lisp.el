(bind-map core-emacs-lisp-map
  :evil-keys (",")
  :major-modes (emacs-lisp-mode lisp-interaction-mode))

(bind-keys
 :map core-emacs-lisp-map
 ("eb" . eval-buffer)
 ("ee" . eval-last-sexp)
 ("ef" . eval-defun)
 ("gb" . xref-pop-marker-stack)
 ("gg" . xref-find-definitions)
 ("gu" . xref-find-references))

(defun core-emacs-lisp-config ()
  (modify-syntax-entry ?- "w"))

(add-hook 'emacs-lisp-mode-hook #'core-emacs-lisp-config)

(provide 'core-emacs-lisp)
