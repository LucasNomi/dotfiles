(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(defun display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'display-startup-time)

(add-hook 'emacs-startup-hook #'scroll-lock-mode)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-face-attribute 'default nil :font "JetBrains Mono" :height 200)
(setq inhibit-startup-screen t)
(setq visible-bell t)
(setq scroll-margin 10)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(global-linum-mode)
(setq use-dialog-box nil)
(column-number-mode t)

(setq-default cursor-type 'box)
(setq-default cursor-in-non-selected-windows 'bar)
(blink-cursor-mode -1)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq vc-follow-symlinks t)

(defvar --backup-directory (concat user-emacs-directory "backups"))
(unless (file-exists-p --backup-directory)
  (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))

(setq backup-by-copying t
      delete-old-versions t
      delete-by-moving-to-trash t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq delete-auto-save-files t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(load-file "~/.emacs.d/plugins/auto-package-update/load-auto-package-update.el")
(load-file "~/.emacs.d/plugins/diminish/load-diminish.el")
(load-file "~/.emacs.d/plugins/doom-themes/load-doom-themes.el")
(load-file "~/.emacs.d/plugins/evil/load-evil.el")
(load-file "~/.emacs.d/plugins/which-key/load-which-key.el")
(load-file "~/.emacs.d/plugins/ivy/load-ivy.el")
(load-file "~/.emacs.d/plugins/lsp/load-lsp.el")
(load-file "~/.emacs.d/plugins/company/load-company.el")
(load-file "~/.emacs.d/plugins/yasnippet/load-yasnippet.el")
(load-file "~/.emacs.d/plugins/editorconfig/load-editorconfig.el")

(add-to-list 'auto-mode-alist '("\\.ts\\'" . js-mode))
