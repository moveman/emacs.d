(require 'dired-x) ; `dired-jump'

(defalias 'yes-or-no-p 'y-or-n-p)

(defconst private-cache-dir (expand-file-name "~/.emacs.d/.cache/"))

;; Create the cache directory.
(make-directory private-cache-dir t)

(defconst private-tmp-dir (format "%s%s%s/"
                                  temporary-file-directory
                                  "emacs"
                                  (user-uid)))

;; Auto-Saving: from time to time, Emacs automatically saves each
;; changed file in a separate file.
(setq auto-save-file-name-transforms `((".*" ,private-tmp-dir t)))

(setq auto-save-list-file-prefix (concat private-tmp-dir ".saves-"))

;; Backup: Emacs saves a backup file the first time the file is saved
;; from a buffer. Subsequent saves will not change the backup file.
(setq backup-directory-alist `((".*" . ,private-tmp-dir)))

;; Bookmark
(setq bookmark-default-file (concat private-cache-dir "bookmarks"))

;; Customization can be saved to a separate file instead of init.el.
(setq custom-file (concat private-cache-dir "custom.el"))

(load custom-file t)

;; Change the default value for all buffers.
(setq-default indent-tabs-mode nil)

;; No splash screen.
(setq inhibit-splash-screen t)

;; Never recenter the point when scrolling.
(setq scroll-conservatively 101)

;; No beep
(setq visible-bell t)

;; Don't show menu-bar and tool-bar.
(menu-bar-mode -1)

(tool-bar-mode -1)

;; Enable automatic paren pairing and visualization.
(electric-pair-mode +1)

(show-paren-mode +1)

;; Emacs-Lisp mode.
(defun private-lisp-mode-config ()
  (modify-syntax-entry ?- "w"))

(add-hook 'emacs-lisp-mode-hook #'private-lisp-mode-config)

;; Prog mode.
(defun private-prog-mode-config ()
  (modify-syntax-entry ?_ "w"))

(add-hook 'prog-mode-hook #'private-prog-mode-config)

;; Global key bindings.
(defun private-find-emacs-help ()
  (interactive)
  (find-file-other-window (concat user-emacs-directory "README.md")))

(bind-keys
 :map universal-argument-map
 ("SPC u" . universal-argument-more)
 :map private-global-map
 ("!"   . shell-command)
 ("SPC" . execute-extended-command)
 ("bb"  . switch-to-buffer)
 ("bd"  . kill-this-buffer)
 ("bl"  . buffer-menu)
 ("bo"  . mode-line-other-buffer)
 ("ff"  . find-file)
 ("fh"  . private-find-emacs-help)
 ("fi"  . imenu)
 ("fj"  . dired-jump)
 ("fs"  . save-buffer)
 ("qe"  . save-buffers-kill-emacs)
 ("qq"  . save-buffers-kill-terminal)
 ("u"   . universal-argument))

(provide 'core-builtin)
