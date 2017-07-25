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
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (make-variable-buffer-local 'company-backends))

(use-package counsel
  :demand t
  :diminish counsel-mode
  :bind (:map core-global-map
         ("s" . counsel-ag))
  :config
  (counsel-mode +1))

(use-package eshell
  :defer t
  :init
  (setq eshell-cmpl-ignore-case t)
  (setq eshell-directory-name (concat core-cache-directory "eshell/")))

;; Get environment variables from the shell
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

(use-package evil-matchit
  :config
  (global-evil-matchit-mode +1))

(use-package evil-surround
  :config
  (global-evil-surround-mode +1))

(use-package fill-column-indicator
  :bind (:map core-global-map
         ("tf" . fci-mode)))

(use-package hl-todo
  :defer t
  :init
  (add-hook 'prog-mode-hook #'hl-todo-mode))

(use-package hydra)

(use-package ivy
  :demand t
  :diminish ivy-mode
  :bind (:map core-global-map
         ("r" . ivy-resume))
  :init
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-use-virtual-buffers t)
  :config
  (ivy-mode +1))

(use-package ivy-hydra)

(use-package linum
  :bind (:map core-global-map
         ("tn" . linum-mode))
  :init
  (setq linum-format "%d ")
  (add-hook 'prog-mode-hook #'linum-mode))

(use-package magit
  :diminish auto-revert-mode
  :bind (:map core-global-map
         ("gb" . magit-blame)
         ("gd" . magit-diff-popup)
         ("gf" . magit-file-popup)
         ("gl" . magit-log-popup)
         ("gs" . magit-status)))

(use-package evil-magit)

(use-package markdown-mode
  :defer t)

(use-package projectile
  :pin melpa
  :demand t
  :diminish projectile-mode
  :bind (:map core-global-map
         ("pa" . projectile-find-other-file)
         ("pb" . projectile-switch-to-buffer)
         ("pc" . projectile-compile-project)
         ("pd" . projectile-find-dir)
         ("pe" . projectile-run-eshell)
         ("pf" . projectile-find-file)
         ("ph" . projectile-dired)
         ("pk" . projectile-kill-buffers)
         ("po" . projectile-project-buffers-other-buffer)
         ("pp" . projectile-switch-project))
  :init
  (setq projectile-cache-file (concat core-cache-directory "projectile.cache"))
  (setq projectile-known-projects-file (concat core-cache-directory "projectile-bookmarks.eld"))
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action 'projectile-dired)
  :config
  (projectile-global-mode +1))

(use-package counsel-projectile
  :bind (:map core-global-map
         ("ps" . counsel-projectile-ag))
  :init
  (counsel-projectile-on))

(use-package rainbow-delimiters
  :defer t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package recentf
  :defer t
  :init
  (setq recentf-save-file (concat core-cache-directory "recentf")))

(use-package spaceline
  :pin melpa
  :init
  (setq powerline-default-separator 'bar)
  (setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state)
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))

(use-package swiper
  :bind ("C-s" . swiper))

(use-package undo-tree
  :pin gnu
  :diminish undo-tree-mode
  :init
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist `((".*" . ,core-temporary-directory)))
  :config
  (global-undo-tree-mode +1))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-declare-prefixes
    "SPC b" "buffer"
    "SPC f" "file"
    "SPC g" "git"
    "SPC p" "project"
    "SPC t" "toggle"
    "SPC w" "window")
  (which-key-mode +1))

(use-package whitespace
  :diminish whitespace-mode
  :bind (:map core-global-map
         ("tw" . whitespace-mode))
  :init
  (setq whitespace-style '(face trailing empty))
  (add-hook 'prog-mode-hook #'whitespace-mode))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t)
  ;; Override the original setting in zenburn.
  (setq fci-rule-color "#D0BF8F"))

(provide 'core-editing)
