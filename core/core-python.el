(use-package anaconda-mode
  :defer t
  :init
  (setq anaconda-mode-installation-directory
        (concat private-cache-dir "anaconda-mode/"))
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package company-anaconda
  :defer t
  :init
  (add-hook 'anaconda-mode-hook
            (lambda ()
              (add-to-list 'company-backends 'company-anaconda))))

(provide 'core-python)
