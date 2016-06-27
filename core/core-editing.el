(use-package evil
  :bind (:map evil-insert-state-map
         ("C-a" . nil)
         ("C-d" . nil)
         ("C-e" . nil)
         ("C-k" . nil)
         ("C-n" . nil)
         ("C-p" . nil)
         ("C-y" . nil)
         :map evil-normal-state-map
         ("RET" . evil-next-line))
  :init
  (dolist (hook '(magit-blob-mode-hook
                  package-menu-mode-hook))
    (add-hook hook #'evil-motion-state))
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  (evil-mode +1))

(use-package hydra)

(use-package ivy
  :diminish ivy-mode
  :bind (:map private-global-map
         ("r" . ivy-resume))
  :init
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-use-virtual-buffers t)
  (ivy-mode +1))

(use-package ivy-hydra)

(use-package counsel
  :diminish counsel-mode
  :bind (:map private-global-map
         ("s" . counsel-ag))
  :init
  (counsel-mode +1))

(use-package magit
  :diminish auto-revert-mode
  :bind (:map private-global-map
         ("gb" . magit-blame)
         ("gd" . magit-diff-popup)
         ("gf" . magit-file-popup)
         ("gl" . magit-log-popup)
         ("gs" . magit-status)))

(use-package projectile
  :pin melpa
  :diminish projectile-mode
  :bind (:map private-global-map
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
  (setq projectile-cache-file (concat private-cache-dir "projectile.cache"))
  (setq projectile-known-projects-file (concat private-cache-dir "projectile-bookmarks.eld"))
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action 'projectile-dired)
  (projectile-global-mode +1))

(use-package counsel-projectile
  :bind (:map private-global-map
         ("ps" . counsel-projectile-ag))
  :init
  (counsel-projectile-on))

(use-package swiper
  :bind ("C-s" . swiper))

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

(provide 'core-editing)
