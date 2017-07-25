(require 'dired-x) ; `dired-jump'

(defalias 'yes-or-no-p 'y-or-n-p)

(defconst core-cache-directory (expand-file-name "~/.emacs.d/.cache/"))

(defconst core-temporary-directory (format "%s%s%s/" temporary-file-directory "emacs" (user-uid)))

(defun core-prog-mode-config ()
  (modify-syntax-entry ?_ "w"))

(defun core-find-emacs-help ()
  (interactive)
  (find-file-other-window (concat user-emacs-directory "README.md")))

(setq auto-save-file-name-transforms `((".*" ,core-temporary-directory t)))

(setq auto-save-list-file-prefix (concat core-temporary-directory ".saves-"))

(setq backup-directory-alist `((".*" . ,core-temporary-directory)))

(setq bookmark-default-file (concat core-cache-directory "bookmarks"))

(setq custom-file (concat core-cache-directory "custom.el"))

(setq scroll-conservatively 101)

(setq visible-bell t)

(setq-default indent-tabs-mode nil)

(electric-pair-mode +1)

(show-paren-mode +1)

(add-hook 'prog-mode-hook #'core-prog-mode-config)

(evil-set-initial-state 'package-menu-mode 'motion)

(load custom-file t)

(make-directory core-cache-directory t)

(bind-keys
 :map universal-argument-map
 ("SPC u" . universal-argument-more)
 :map core-global-map
 ("!"   . shell-command)
 ("SPC" . execute-extended-command)
 ("bb"  . switch-to-buffer)
 ("bd"  . kill-this-buffer)
 ("bl"  . buffer-menu)
 ("bo"  . mode-line-other-buffer)
 ("ff"  . find-file)
 ("fh"  . core-find-emacs-help)
 ("fi"  . imenu)
 ("fj"  . dired-jump)
 ("fs"  . save-buffer)
 ("qe"  . save-buffers-kill-emacs)
 ("qq"  . save-buffers-kill-terminal)
 ("u"   . universal-argument))

(provide 'core-builtin)
