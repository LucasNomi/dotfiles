;; IMPROVE PERFORMANCE (mostly because of lsp) 
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; SHOW TIME TO LOAD EMACS
(defun display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'display-startup-time)

;; EMACS STARTS IN SCROLL-LOCK
(add-hook 'emacs-startup-hook #'scroll-lock-mode)

;; CHANGE DEFAULT VISUAL OF EMACS
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
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

;; CHANGE DEFAULT CURSOR TYPE TO BOX ANYWHERE (AND REMOVE BLINK EFFECT)
(setq-default cursor-type 'box)
(setq-default cursor-in-non-selected-windows 'bar)
(blink-cursor-mode -1)

;; INDENTATION SETTINGS
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; VERSION CONTROL SETTINGS
(setq vc-follow-symlinks t)

;; CREATES (IF IT DOES NOT EXIST) AND CHANGES BACKUP AND AUTOSAVES DIRECTORIES
(unless (file-exists-p "~/.emacs.d/autosaves/")
  (make-directory "~/.emacs.d/autosaves/"))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves" t)))
(unless (file-exists-p "~/.emacs.d/backups/")
  (make-directory "~/.emacs.d/backups/"))
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))

;; CUSTOM SETTINGS IS SAVED IN IT'S OWN FILE 
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

;; PACKAGE SETUP AND USING MELPA AS A PACKAGE ARCHIVE
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; INSTALL USE-PACKAGE IF IT IS NOT INSTALLED
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; LOAD ALL PLUGINS CONFIG 
(load-file "~/.emacs.d/plugins/auto-package-update/load-auto-package-update.el")
(load-file "~/.emacs.d/plugins/diminish/load-diminish.el")
(load-file "~/.emacs.d/plugins/doom-themes/load-doom-themes.el")
(load-file "~/.emacs.d/plugins/evil/load-evil.el")
(load-file "~/.emacs.d/plugins/which-key/load-which-key.el")
(load-file "~/.emacs.d/plugins/ivy/load-ivy.el")
(load-file "~/.emacs.d/plugins/lsp/load-lsp.el")
(load-file "~/.emacs.d/plugins/company/load-company.el")
  
;; MODES
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js-jsx-mode))
