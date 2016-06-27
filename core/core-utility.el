(use-package ace-link
  :config
  (ace-link-setup-default))

(use-package company
  :defer t
  :init
  (add-hook 'prog-mode-hook #'company-mode)
  :config
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(use-package eshell
  :defer t
  :init
  (setq eshell-cmpl-ignore-case t)
  (setq eshell-directory-name (concat private-cache-dir "eshell/")))

;; Get environment variables from the shell
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

(use-package evil-magit)

(use-package evil-matchit
  :config
  (global-evil-matchit-mode +1))

(use-package evil-surround
  :config
  (global-evil-surround-mode +1))

(use-package fill-column-indicator
  :bind (:map private-global-map
         ("tf" . fci-mode)))

(use-package hl-todo
  :defer t
  :init
  (add-hook 'prog-mode-hook #'hl-todo-mode))

(use-package linum
  :bind (:map private-global-map
         ("tn" . linum-mode))
  :init
  (setq linum-format "%d ")
  (add-hook 'prog-mode-hook #'linum-mode))

(use-package markdown-mode
  :defer t)

(use-package rainbow-delimiters
  :defer t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package recentf
  :defer t
  :init
  (setq recentf-save-file (concat private-cache-dir "recentf")))

(use-package spaceline
  :pin melpa
  :init
  (setq powerline-default-separator 'bar)
  (setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(use-package undo-tree
  :pin gnu
  :diminish undo-tree-mode
  :init
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist `((".*" . ,private-tmp-dir)))
  :config
  (global-undo-tree-mode +1))

(use-package whitespace
  :diminish whitespace-mode
  :bind (:map private-global-map
         ("tw" . whitespace-mode))
  :init
  (setq whitespace-style '(face trailing empty))
  (add-hook 'prog-mode-hook #'whitespace-mode))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t)
  ;; Override the original setting in zenburn.
  (setq fci-rule-color "#D0BF8F"))

(provide 'core-utility)
