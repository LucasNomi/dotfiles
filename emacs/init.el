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

(setq inhibit-startup-screen t)
(setq visible-bell t)
(setq scroll-margin 10)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(blink-cursor-mode -1)
(setq use-dialog-box nil)
(setq vc-follow-symlinks t)
(global-hl-line-mode t)
(global-display-line-numbers-mode)
(setq-default display-line-numbers-width 3)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(column-number-mode t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-saves" t)))
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

(use-package auto-package-update
  :ensure t
  :custom
  (auto-package-update-interval 60)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "23:00"))

(use-package diminish
  :ensure t)

(use-package doom-themes
	:ensure t
  :init (load-theme 'doom-homage-black t)
	:config
	(setq doom-themes-enable-bold t)
	(setq doom-themes-enable-italic t)
	(doom-themes-visual-bell-config))

(use-package swiper
  :ensure t)

(use-package counsel
  :ensure t)

(use-package ivy
  :diminish
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-initial-inputs-alist nil) 
  :bind
  (("C-s" . swiper)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x b" . counsel-ibuffer)
  :map ivy-minibuffer-map
  ("TAB" . ivy-alt-done)))

(use-package which-key
  :defer 0
  :diminish
  :ensure t
  :config
  (which-key-mode t)
  (setq which-key-popup-type 'side-window)
  (setq which-key-side-window-location 'right)
  (setq whick-key-side-window-max-width 0.5))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "C-c l")
  :config (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :custom (lsp-ui-doc-position 'bottom))

(use-package lsp-ivy
  :ensure t
  :after lsp)
