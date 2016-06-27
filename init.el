(package-initialize)

(add-to-list 'load-path "~/.emacs.d/core/")

(require 'core-booting)
(require 'core-builtin)
(require 'core-editing)
(require 'core-utility)
(require 'core-windows)

(require 'core-c++)
(require 'core-clojure)
(require 'core-go)
(require 'core-python)
(require 'core-rust)
