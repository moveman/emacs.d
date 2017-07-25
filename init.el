(package-initialize)

(add-to-list 'load-path "~/.emacs.d/core/")

(require 'core-booting)
(require 'core-builtin)
(require 'core-editing)
(require 'core-windows)

(require 'core-c++)
(require 'core-clojure)
(require 'core-emacs-lisp)
(require 'core-go)
(require 'core-python)
(require 'core-rust)

(org-babel-load-file "~/.emacs.d/core.org")
