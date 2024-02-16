;; set proxy in gui mode
(when (display-graphic-p)
  (setq url-proxy-services
	'(("http" . "127.0.0.1:7890")
	  ("https" . "127.0.0.1:7890")))
  (setenv "http_proxy" "127.0.0.1:7890")
  (setenv "https_proxy" "127.0.0.1:7890"))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
	"straight/repos/straight.el/bootstrap.el"
	(or (bound-and-true-p straight-base-dir)
	    user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://radian-software.github.io/straight.el/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(add-to-list 'exec-path "/opt/miniconda3/bin")
(add-to-list 'exec-path "/opt/homebrew/bin")

(setq image-types '(png gif tiff jpeg xpm xbm pbm))

(defun image-type-available-p (type)
    "Return t if image type TYPE is available.
Image types are symbols like `xbm' or `jpeg'."
    (if (eq 'svg type)
	nil
      (and (fboundp 'init-image-library)
	   (init-image-library type))))

(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
	      vc-ignore-dir-regexp
	      tramp-file-name-regexp))
(setq tramp-verbose 1)

;; packages
(straight-use-package 'helm)
(straight-use-package 'el-patch)
(straight-use-package 'vterm)
(straight-use-package 'magit)
(straight-use-package 'company-mode)
(straight-use-package 'scala-mode)
(straight-use-package 'helm-rg)
(straight-use-package 'nim-mode)
(straight-use-package 'yaml-mode)
(straight-use-package 'quarto-mode)
(straight-use-package 'eglot)
(straight-use-package 'julia-mode)
(straight-use-package 'typescript-mode)
(straight-use-package 'projectile)
(straight-use-package 'helm-projectile)
(straight-use-package 'go-mode)
(straight-use-package 'monokai-theme)
(straight-use-package 'kaolin-themes)
(straight-use-package 'helm-descbinds)
(straight-use-package 'treemacs)
(straight-use-package 'telephone-line)
(straight-use-package 'ein)
(straight-use-package 'doom-modeline)
(straight-use-package 'dashboard)
(straight-use-package 'nerd-icons)

(doom-modeline-mode t)

(straight-use-package 'protobuf-mode)

(straight-use-package 'all-the-icons)
(straight-use-package 'treemacs-nerd-icons)

;; dashboard setup
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard")))

(setq dashboard-items '((recents . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (registers . 5)))
(setq dashboard-icon-type 'nerd-icons)
(setq dashboard-display-icons-p t)
;(setq dashboard-set-heading-icons t)
;(setq dashboard-set-file-icons t)

;(straight-use-package 'treemacs-all-the-icons)

(require 'treemacs)
(require 'treemacs-nerd-icons)
(treemacs-load-theme "nerd-icons")

(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x p f") 'helm-projectile-find-file)

;(setq telephone-line-height 18
					;      telephone-line-evil-use-short-tag t)

(setq helm-rg-default-directory 'git-root)
(global-set-key (kbd "<f6>") 'helm-rg)

;(setq directory-abbrev-alist
;      '(("^/home/sdev" . "/Users/tangyl/Repo")
;	("^/data01/home/sdev" . "/Users/tangyl/Repo")
;	))
(load-theme 'kaolin-ocean t)
(set-face-font 'default "Monaco")
(set-face-attribute 'default nil :height 130)
(menu-bar-mode 1)

(unless (display-graphic-p)
  (set-face-background 'vertical-border "#252534")
  (set-face-foreground 'vertical-border (face-background 'vertical-border))
  (xterm-mouse-mode 1))

;(scroll-bar-mode -1)
;(tool-bar-mode -1)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(unless (display-graphic-p)
  (xterm-mouse-mode 1))

;(defun open-files-in-read-only-mode ()
  ;(unless (eq major-mode 'dired-mode)
;  (read-only-mode 1))


;(add-hook 'find-file-hook 'open-files-in-read-only-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
