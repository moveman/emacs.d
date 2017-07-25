(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(setq package-archive-priorities '(("gnu" . 10)
                                   ("melpa" . 15)
                                   ("melpa-stable" . 20)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(use-package bind-map)

(use-package evil
  :demand t
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
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-mode +1))

(bind-map core-global-map
  :keys ("M-m")
  :evil-keys ("SPC")
  :override-minor-modes t)

(provide 'core-booting)
