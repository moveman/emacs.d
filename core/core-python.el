(bind-map core-python-mode-map
  :evil-keys (",")
  :major-modes (python-mode))

(defun core-python-company-config ()
  (add-to-list 'company-backends #'company-anaconda))

(use-package anaconda-mode
  :bind (:map core-python-mode-map
         ("gb" . anaconda-mode-go-back)
         ("gg" . anaconda-mode-find-definitions)
         ("gu" . anaconda-mode-find-references))
  :init
  (setq anaconda-mode-installation-directory
        (concat core-cache-directory "anaconda-mode/"))
  (add-hook 'python-mode-hook #'anaconda-mode))

(use-package company-anaconda
  :defer t
  :init
  (add-hook 'anaconda-mode-hook #'core-python-company-config))

(provide 'core-python)
