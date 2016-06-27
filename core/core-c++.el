(defun private-cxx-rtags-config ()
  (add-to-list 'company-backends 'company-rtags))

(defun private-cxx-mode-config ()
  (c-set-style "linux")
  (c-set-offset 'inher-intro 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'member-init-intro 0)
  (setq c-basic-offset 2)
  (setq indent-tabs-mode t)
  (setq tab-width 2)
  (setq-local company-backends '((company-dabbrev-code company-keywords)
                                 company-files company-dabbrev)))

(bind-map private-cxx-mode-map
  :evil-keys (",")
  :major-modes (c++-mode))

(use-package cc-mode
  :init
  (add-hook 'c-mode-common-hook 'private-cxx-mode-config)
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(use-package cmake-mode
  :defer t)

(use-package rtags
  :bind (:map private-cxx-mode-map
         ("gb" . rtags-location-stack-back)
         ("gf" . rtags-location-stack-forward)
         ("gg" . rtags-find-symbol-at-point)
         ("gu" . rtags-find-references-at-point)
         ("gv" . rtags-find-virtuals-at-point))
  :init
  (require 'cl) ;; HACK: fix caadr
  (setq rtags-completions-enabled t)
  (setq rtags-display-result-backend 'ivy))

(use-package company-rtags
  :defer t
  :init
  (add-hook 'c-mode-common-hook 'private-cxx-rtags-config t))

(use-package ivy-rtags
  :defer t)

(use-package smart-tabs-mode
  :config
  (smart-tabs-insinuate 'c 'c++))

(provide 'core-c++)
