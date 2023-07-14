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
