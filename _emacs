(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

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

(require 'helm-projectile)

(require 'quarto-mode)

(global-company-mode t)
(global-linum-mode t)

(straight-use-package '(nextflow-mode :type git :host github :repo "Emiller88/nextflow-mode"))

(tool-bar-mode 0)

;; theme
(load-theme 'monokai t)
(set-face-attribute 'default 'nil :height 130 :family "Monaco")
(set-cursor-color "green")

;; editing
(setq auto-save-default nil)

;; tab indent
(setq scala-indent:step 4)
(setq-default indent-tabs-mode nil)
(setq tab-witdth 4)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq nxml-child-indent 4
      nxml-attribute-indent 4
      nxml-slash-auto-complete-flag t)

;; compile
(defun f5 ()
  (interactive)
  (let* ((root (project-root (project-current)))
	 (cmd (format "cd %s; bash .f5" root)))
    (compile cmd)))

(global-set-key (kbd "<f5>") 'f5)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)


(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x p f") 'helm-projectile-find-file)

(setq helm-rg-default-directory 'git-root)
(global-set-key (kbd "<f6>") 'helm-rg)

(setq directory-abbrev-alist
      '(("^/home/sdev" . "/Users/tangyl/Repo")
        ("^/data01/home/sdev" . "/Users/tangyl/Repo")
        ))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
