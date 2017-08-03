(package-initialize)

(org-babel-load-file "~/.emacs.d/core.org")

(use-package org
  :config
  (evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle))
