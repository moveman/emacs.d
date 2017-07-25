(require 'core-hydra)

(use-package ace-window
  :bind (:map core-global-map
         ("wo" . aw-flip-window)
         ("ww" . ace-window))
  :init
  (setq aw-scope 'frame))

(use-package window-purpose
  :diminish purpose-mode
  :init
  (setq purpose-user-mode-purposes '((cmake-mode . edit)
                                     (magit-mode . search)))
  (setq purpose-user-name-purposes '(("README.md" . readme)))
  :config
  (purpose-compile-user-configuration)
  (purpose-mode +1))

(use-package winner
  :bind
  (:map core-global-map
   ("wr" . winner-redo)
   ("wu" . winner-undo))
  :init
  (winner-mode +1))

(bind-keys
 :map core-global-map
 ("w." . core-move-splitter/body)
 ("w=" . balance-windows)
 ("wd" . delete-window)
 ("wm" . delete-other-windows)
 ("ws" . split-window-below)
 ("wv" . split-window-right)
 ;; ("ww" . other-window)
 ("wH" . evil-window-move-far-left)
 ("wJ" . evil-window-move-very-bottom)
 ("wK" . evil-window-move-very-top)
 ("wL" . evil-window-move-far-right)
 ("wh" . evil-window-left)
 ("wj" . evil-window-down)
 ("wk" . evil-window-up)
 ("wl" . evil-window-right))

(provide 'core-windows)
