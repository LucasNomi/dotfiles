(use-package auto-package-update
  :ensure t
  :custom
  (auto-package-update-interval 60)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "23:00"))
