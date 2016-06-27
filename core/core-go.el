;;; Tools
;; github.com/nsf/gocode
;; golang.org/x/tools/cmd/goimports

(use-package company-go
  :defer t
  :init
  (setq company-go-show-annotation t))

(use-package go-eldoc
  :defer t)

(use-package go-mode
  :defer t
  :init
  (setq gofmt-command "goimports"))

(defun private-go-mode-config ()
  (setq-local company-backends '(company-go
                                 company-dabbrev-code
                                 company-files))
  (go-eldoc-setup)
  ;; It's a buffer-local hook
  (add-hook 'before-save-hook 'gofmt-before-save nil t))

(add-hook 'go-mode-hook 'private-go-mode-config)

(provide 'core-go)
