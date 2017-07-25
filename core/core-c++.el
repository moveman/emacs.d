(bind-map core-c++-mode-map
  :evil-keys (",")
  :major-modes (c++-mode))

(defun core-c++-config ()
  (c-set-style "linux")
  (c-set-offset 'inher-intro 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'member-init-intro 0)
  (setq c-basic-offset 2)
  (setq indent-tabs-mode t)
  (setq tab-width 2))

(defun core-c++-company-config ()
  (setq company-backends '(company-rtags
                           (company-dabbrev-code company-keywords)
                           company-files
                           company-dabbrev)))

(use-package cc-mode
  :defer t
  :init
  (add-hook 'c-mode-common-hook #'core-c++-config)
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(use-package cmake-mode
  :defer t)

(use-package rtags
  :bind (:map core-c++-mode-map
         ("gb" . rtags-location-stack-back)
         ("gg" . rtags-find-symbol-at-point)
         ("gu" . rtags-find-references-at-point)
         ("gv" . rtags-find-virtuals-at-point))
  :init
  (defalias 'caadr 'cl-caadr)
  (setq rtags-completions-enabled t)
  (setq rtags-display-result-backend 'ivy))

(use-package company-rtags
  :defer t
  :init
  (add-hook 'c-mode-common-hook #'core-c++-company-config))

(use-package ivy-rtags
  :defer t)

(use-package smart-tabs-mode
  :config
  (smart-tabs-insinuate 'c 'c++))

(provide 'core-c++)
