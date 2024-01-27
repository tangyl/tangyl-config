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
(straight-use-package 'helm-projectile)
(straight-use-package 'go-mode)
(straight-use-package 'monokai-theme)
(straight-use-package 'kaolin-themes)
(straight-use-package 'helm-descbinds)
(straight-use-package 'treemacs)
(straight-use-package 'telephone-line)
(straight-use-package 'ein)


(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x p f") 'helm-projectile-find-file)

(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
;(setq telephone-line-height 18
;      telephone-line-evil-use-short-tag t)

(telephone-line-mode t)

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
(scroll-bar-mode -1)
(tool-bar-mode -1)

(defun open-files-in-read-only-mode ()
  ;(unless (eq major-mode 'dired-mode)
  (read-only-mode 1))


(add-hook 'find-file-hook 'open-files-in-read-only-mode)
