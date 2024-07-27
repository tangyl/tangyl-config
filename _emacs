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
(straight-use-package 'cider)
(straight-use-package 'nerd-icons-dired)
(straight-use-package 'clang-format)
(straight-use-package 'xterm-color)
(straight-use-package 'highlight-indent-guides)
(straight-use-package 'which-key)
(straight-use-package 'helm-icons)
(straight-use-package 'protobuf-mode)
(straight-use-package 'treemacs-nerd-icons)

(global-company-mode t)
(doom-modeline-mode t)

(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(setq dashboard-items '((recents . 10)
                        (bookmarks . 5)
                        (projects . 5)
                        (registers . 5)))
(setq dashboard-icon-type 'nerd-icons)
(setq dashboard-display-icons-p t)

(require 'helm-projectile)
(setq helm-buffer-max-length 40)

(global-display-line-numbers-mode t)
                                        ;(straight-use-package 'treemacs-all-the-icons)

(require 'treemacs)
(require 'treemacs-nerd-icons)
(treemacs-load-theme "nerd-icons")

(require 'nerd-icons)
(require 'nerd-icons-dired)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)
(setq helm-icons-provider 'nerd-icons)
(helm-icons-enable)

(add-hook 'c++-mode-hook 'hs-minor-mode)

(global-company-mode t)
(global-display-line-numbers-mode t)

(global-hl-line-mode t)

(setq compilation-search-path '("/data/home/yilong.tang/Repo/search"))

(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x p f") 'helm-projectile-find-file)
(global-set-key (kbd "C-c TAB") 'hs-toggle-hiding)

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) . ("clangd" "--query-driver=/usr/bin/g++" "--pretty" "--log=verbose")))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)


(require 'xterm-color)
(setq compilation-environment '("TERM=xterm-256color"))
(defun my/advice-compilation-filter (f proc string)
  (funcall f proc (xterm-color-filter string)))
(advice-add 'compilation-filter :around #'my/advice-compilation-filter)
  

(defun run-compile (&optional args)
  (interactive)
  (let* ((root (project-root (project-current t)))
         (command (format "cd %s; bash .f5" root)))
    (compile command)))

(global-set-key (kbd "<f5>") 'run-compile)

;(setq telephone-line-height 18
					;      telephone-line-evil-use-short-tag t)

(setq helm-rg-default-directory 'git-root)
(global-set-key (kbd "<f6>") 'helm-rg)
(global-set-key (kbd "<f7>") 'clang-format-buffer)

(defun run-compile ()
  (interactive)
  (let* ((root (project-root (project-current t)))
         (command (format "cd %s; bash .f5" root)))
    (compile command)))

(global-set-key (kbd "<f5>") 'run-compile)
  
;(setq directory-abbrev-alist
;      '(("^/home/sdev" . "/Users/tangyl/Repo")
;	("^/data01/home/sdev" . "/Users/tangyl/Repo")
;	))
(load-theme 'kaolin-ocean t)
(set-face-font 'default "Monaco")
(set-face-attribute 'default nil :height 140)
(menu-bar-mode 1)

(unless (display-graphic-p)
  (set-face-background 'vertical-border "#181818")
  (set-face-foreground 'vertical-border (face-background 'vertical-border))
  (xterm-mouse-mode 1))

;(scroll-bar-mode -1)
;(tool-bar-mode -1)

;(scroll-bar-mode -1)
(tool-bar-mode -1)
(unless (display-graphic-p)
  (xterm-mouse-mode 1))

;(defun open-files-in-read-only-mode ()
  ;(unless (eq major-mode 'dired-mode)
;  (read-only-mode 1))


;(add-hook 'find-file-hook 'open-files-in-read-only-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)

;; python config
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(require 'transient)
(transient-define-prefix compile-menu ()
  "Compile Magic"
  :info-manual "Quick commands for compile/edit"
  [("c" "Compile" run-compile)
   ("f" "Format" (lambda ()
                   (interactive)
                   (with-current-buffer (window-buffer (minibuffer-selected-window))
                     (message (format "current bufffer %s" (current-buffer)))
                     (clang-format-buffer))))
   ("q" "Quit" transient-quit-one)])

(global-set-key (kbd "C-x m") #'compile-menu)
(global-set-key (kbd "<home>") #'compile-menu)
                

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b95f61aa5f8a54d494a219fcde9049e23e3396459a224631e1719effcb981dbd" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
