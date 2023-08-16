(use-package doom-themes
	:ensure t
  :init (load-theme 'doom-one-light t)
	:config
	(setq doom-themes-enable-bold t)
	(setq doom-themes-enable-italic t)
	(doom-themes-visual-bell-config))
