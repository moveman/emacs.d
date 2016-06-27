(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")))

(setq package-archive-priorities
      '(("gnu" . 10)
        ("melpa" . 15)
        ("melpa-stable" . 20)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(use-package bind-map)

(bind-map private-global-map
  :keys ("M-m")
  :evil-keys ("SPC")
  :override-minor-modes t)

(provide 'core-booting)
