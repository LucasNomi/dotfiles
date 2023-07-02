;; PERFORMANCE 
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; SHOW TIME TO LOAD EMACS
(defun display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'scroll-lock-mode)

;; EMACS STARTS IN SCROLL-LOCK
(add-hook 'emacs-startup-hook #'display-startup-time)

;; VISUAL CONFIG
(setq inhibit-startup-screen t)
(setq visible-bell t)
(setq scroll-margin 10)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq-default cursor-type 'box)
(setq-default cursor-in-non-selected-windows 'bar)
(blink-cursor-mode -1)
(setq use-dialog-box nil)
(setq vc-follow-symlinks t)
(global-hl-line-mode t)
(global-linum-mode)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(column-number-mode t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; PLACEHOLDER FOR TYPESCRIPT MODE
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js-mode))

;; KEYBINDS
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; SET BACKUP AND AUTO-SAVE DIRS
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
(unless (file-exists-p "~/.emacs.d/auto-saves/")
  (make-directory "~/.emacs.d/auto-saves/"))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-saves" t)))

;; SET CUSTOM FILE 
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

;; PACKAGE SETUP
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; INSTALL USE-PACKAGE IF IT DOES NOT EXIST
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; LOAD ALL PLUGINS CONFIG 
(load-file "~/.emacs.d/plugins/auto-package-update/load-auto-package-update.el")
(load-file "~/.emacs.d/plugins/diminish/load-diminish.el")
(load-file "~/.emacs.d/plugins/doom-themes/load-doom-themes.el")
(load-file "~/.emacs.d/plugins/ivy/load-ivy.el")
(load-file "~/.emacs.d/plugins/which-key/load-which-key.el")
(load-file "~/.emacs.d/plugins/lsp/load-lsp.el")
(load-file "~/.emacs.d/plugins/evil/load-evil.el")
(load-file "~/.emacs.d/plugins/yasnippet/load-yasnippet.el")
  
