(use-package cider
  :defer t
  :config
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (evil-set-initial-state 'cider-stacktrace-mode 'emacs))

(use-package clojure-mode
  :defer t
  :init
  (add-hook 'clojure-mode-hook 'private-lisp-mode-config))

(provide 'core-clojure)
