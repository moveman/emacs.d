(use-package racer
  :defer t
  :init
  (setq racer-rust-src-path
        (concat (substring (shell-command-to-string "rustc --print sysroot") 0 -1)
                "/lib/rustlib/src/rust/src"))
  (add-hook 'rust-mode-hook 'racer-mode)
  :config
  (evil-set-initial-state 'racer-help-mode 'motion))

(use-package rust-mode
  :defer t)

(bind-map private-rust-mode-map
  :evil-keys (",")
  :major-modes (rust-mode))

(bind-keys
 :map private-rust-mode-map
 ("fb" . rust-format-buffer)
 ("hh" . racer-describe)
 ("gg" . racer-find-definition))

(provide 'core-rust)
