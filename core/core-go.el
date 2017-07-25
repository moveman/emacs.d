;;; Tools
;; github.com/nsf/gocode
;; github.com/rogpeppe/godef
;; golang.org/x/tools/cmd/goimports

(bind-map core-go-mode-map
  :evil-keys (",")
  :major-modes (go-mode))

(defun core-go-company-config ()
  (add-to-list 'company-backends #'company-go))

(defun core-go-config ()
  ;; NOTE: the last arguemnt being `t' means only the buffer-local
  ;; value of the hook variable is modified.
  (add-hook 'before-save-hook #'gofmt-before-save nil t))

(use-package company-go
  :defer t
  :init
  (setq company-go-show-annotation t)
  (add-hook 'go-mode-hook #'core-go-company-config))

(use-package go-eldoc
  :defer t
  :init
  (add-hook 'go-mode-hook #'go-eldoc-setup))

(use-package go-mode
  :bind (:map core-go-mode-map
         ("gb" . xref-pop-marker-stack)
         ("gg" . godef-jump))
  :init
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook #'core-go-config))

(provide 'core-go)
