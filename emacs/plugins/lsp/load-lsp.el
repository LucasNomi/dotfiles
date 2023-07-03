(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "C-c l")
  :hook
  (c-mode . lsp-mode)
  (python-mode . lsp-mode)
  (js-jsx-mode . lsp-mode)
  :config
  (lsp-enable-which-key-integration t)
  (setq lsp-inlay-hint-enable t)
  (setq lsp-log-io nil))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :custom (lsp-ui-doc-position 'bottom))

(use-package lsp-ivy
  :ensure t
  :after lsp)

(use-package flycheck
  :ensure t
  :hook (lsp-mode . flycheck-mode))
