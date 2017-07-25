(bind-map core-clojure-cider-map
  :evil-keys (",")
  :major-modes (cider-repl-mode))

(bind-map core-clojure-mode-map
  :evil-keys (",")
  :major-modes (clojure-mode))

(defun core-clojure-config ()
  (modify-syntax-entry ?- "w"))

(defun core-clojure-eval-last-sexp ()
  (interactive)
  (evil-append 1)
  (condition-case err
      (cider-eval-last-sexp)
    (error (message (error-message-string err))))
  (evil-normal-state))

(use-package cider
  :bind (:map core-clojure-cider-map
         ("ss" . cider-switch-to-last-clojure-buffer)
         :map core-clojure-mode-map
         ("eb" . cider-eval-buffer)
         ("ee" . core-clojure-eval-last-sexp)
         ("ef" . cider-eval-defun-at-point)
         ("gb" . cider-pop-back)
         ("gg" . cider-find-var)
         ("ss" . cider-switch-to-repl-buffer))
  :init
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (evil-set-initial-state 'cider-stacktrace-mode 'emacs))

(use-package clojure-mode
  :defer t
  :init
  (setq cider-prompt-for-symbol nil)
  (add-hook 'clojure-mode-hook #'core-clojure-config))

(provide 'core-clojure)
