
;(add-to-list 'package-archives
;             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;(setq url-proxy-service '(("http" . "127.0.0.1:1092")
                                        ;                          ("https" . "127.0.0.1:1092")))

;; Install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;(setq url-gateway-method 'socks)
;(setq socks-server '("Default server" "127.0.0.1" 1082 5))

(require 'use-package)

;; Enable defer and ensure by default for use-package
;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
(setq use-package-always-defer t
      use-package-always-ensure t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
;(setq exec-path (append exec-path '("~/.sdkman/candidates/sbt/current/bin")))
;(setq exec-path (append exec-path '("~/.sdkman/candidates/scala/current/bin")))

(setq default-process-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

(defun require-package (pkg)
  (unless (package-installed-p pkg)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install pkg)))

;(use-package color-theme-sanityinc-tomorrow :ensure t)
(use-package monokai-theme :ensure t)
(use-package helm :ensure t)
(use-package helm-ag :ensure t)
(use-package helm-descbinds :ensure t)
(use-package helm-swoop :ensure t)
(use-package helm-ls-git :ensure t)
(use-package company :ensure t)
(use-package avy :ensure t)
(use-package magit :ensure t)
(use-package projectile :ensure t)
;(use-package yasnippet :ensure t)
;(use-package dired+ :ensure t)
;(use-package dired-details :ensure t)
;(use-package dired-details+ :ensure t)
;(use-package vlf :ensure t)
;(use-package smex :ensure t)
(use-package scala-mode :interpreter ("scala" . scala-mode))
;(use-package ensime :ensure t :pin melpa-stable)
;(use-package ido-vertical-mode :ensure t)
;(use-package yaml-mode :ensure t)
;(use-package pyvenv :ensure t)
;(use-package elpy :ensure t)
; (use-package better-defaults :ensure t)

;(require-package 'monokai-theme)
;(require-package 'darkokai-theme)
;(require-package 'csharp-mode)
;(require-package 'projectile)
;(require-package 'grizzl)
;(require-package 'helm)
;(require-package 'helm-ag)
;(require-package 'ace-isearch)
;(require-package 'helm-core)
;(require-package 'helm-projectile)
;(require-package 'helm-flycheck)
;(require-package 'helm-descbinds)
;(require-package 'image+)
;(require-package 'auto-complete)
;(require-package 'company)
;(require-package 'cider)
;(require-package 'cider-decompile)
;(require-package 'nlinum)
;(require-package 'fsharp-mode)
;(require-package 'yasnippet)
;(require-package 'smart-tabs-mode)
;(require-package 'dired+)
;(require-package 'helm-swoop)
;(require-package 'ace-jump-mode)
;(require-package 'ace-window)
;(require-package 'w32-browser)
;(require-package 'direx)
;(require-package 'bookmark+)
;(require-package 'avy)
;(require-package 'magit)
;(require-package 'paradox)
;(require-package 'aggressive-indent)
;(require-package 'helm-projectile)
;(require-package 'powershell)
;(require-package 'yasnippet)
;(require-package 'dired-details)
;(require-package 'dired-details+)
;(require-package 'powerline)
;(require-package 'yafolding)
;(require-package 'origami)
;(require-package 'omnisharp)
;(require-package 'flycheck)
;(require-package 'ensime)
;(require-package 'scala-mode2)
;(require-package 'sbt-mode)
;(require-package 'vlf) ;; read very large file
;(require-package 'smart-mode-line)
;(require-package 'vimish-fold)
;(require-package 'window-number)
;(require-package 'persp-mode)
;(require-package 'nyan-mode)
                                        ;(require-package 'spaceline)
;(require-package 'ido-vertical-mode)
;(require-package 'smex)
;(use-package ensime
;             :ensure t
;             :pin melpa-stable)

;(setq ensime-typecheck-when-idle nil)
;(setq ensime-typecheck-idle-interval 5)

; smart-mode-line
; https://github.com/Malabarba/smart-mode-line
;(setq sml/no-confirm-load-theme t)
;(setq sml/theme 'respectful)
;(sml/setup)

;(require 'vlf-setup)

;(setq projectile-completion-system 'helm)
;(helm-projectile-on)

;(cond ((eq system-type 'darwin)
;       (progn
;         (setq mac-option-modifier 'super)
;         (setq mac-command-modifier 'meta))
;       nil)
;      )


;(when (window-system)
                                        ;  (load-theme 'darkokai t))


;; Enable scala-mode for highlighting, indentation and motion commands
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
)

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :init (global-flycheck-mode))

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook  (scala-mode . lsp)
         (lsp-mode . lsp-lens-mode)
  :config (setq lsp-prefer-flymake nil))

;; Add metals backend for lsp-mode
(use-package lsp-metals)

;; Enable nice rendering of documentation on hover
(use-package lsp-ui)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet)

;; Add company-lsp backend for metals
(use-package company-lsp)

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )

;; Use the Tree View Protocol for viewing the project structure and triggering compilation
(use-package lsp-treemacs
  :config
  ;(lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t)
  )



(set-face-attribute 'default 'nil :height 130 :family "Source Code Pro")

;(when (window-system)
;  (set-face-font 'default "Consolas")
;  (set-face-attribute 'default nil :family "Consolas" :height 120)
;  (load-theme 'darkokai t)
                                        ;(load-theme 'monokai t)
                                        ;  )

(load-theme 'monokai t)

;; tab
(setq-default indent-tabs-mode nil)
(setq tab-witdth 4)
(setq-default tab-width 4)
(setq c-basic-offset 4)
;(require 'smart-tabs-mode)
;(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python 'nxml)

(setq nxml-child-indent 4
      nxml-attribute-indent 4
      nxml-slash-auto-complete-flag t)

(setq font-lock-maximum-decoration
      '((c-mode . t)
        (c++-mode . 2)
        (csharp-mode . 3)
        (t . t)))

;; ido
;(ido-mode nil)
(require 'ibuffer)

;(require 'dired+)

;(unless (eq system-type 'cygwin)
(setq magit-git-executable "/usr/local/bin/git")
;; workaround for magit
(setq default-process-coding-system (cons 'utf-8-dos 'utf-8-dos))
(require 'magit)

(column-number-mode 1)
(setq inhibit-startup-screen t)
(toggle-tool-bar-mode-from-frame 0)

;(require 'auto-complete)
;(global-auto-complete-mode 1)
;(global-auto-complete-mode 0)
;(require 'helm-config)
;(ido-mode 1)                                        ;(require 'helm-swoop)
;(ido-vertical-mode 1)

(setq python-shell-interpreter "ipython")
(setq python-shell-interpreter-args "--simple-prompt --pprint")

;(require 'ido-vertical-mode)
(require 'helm)

(setq helm-swoop-speed-or-color t)

(require 'helm-ls-git)
;(helm-mode 1)
;(helm-autoresize-mode 1)
;(setq helm-bookmark-show-location t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x c o") 'helm-occur)
(global-set-key (kbd "C-x c i") 'helm-imenu)
;(global-set-key (kbd "C-x j") 'ace-jump-mode)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
                                        ;(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x w") 'ace-window)
(global-set-key (kbd "<f12>") 'w32explore)
(global-set-key (kbd "C-;") 'avy-goto-char)
;(global-set-key (kbd "C-x C-c") 'helm-projectile-ag)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h b") 'helm-descbinds)
;(global-set-key (kbd "<f7>") 'compile)
;(global-set-key (kbd "C-x v f") 'vimish-fold)
;(global-set-key (kbd "C-x v v") 'vimish-fold-delete)
                                        ;(global-set-key (kbd "C-x v t") 'vimish-fold-toggle)
;(global-set-key (kbd "C-x v a") 'outline-show-all)
;(global-set-key (kbd "C-x v h") 'outline-hide-body)
;(global-set-key (kbd "C-x v t") 'outline-toggle-children)
;(global-set-key (kbd "C-x v v") 'outline-toggle-children)
;(global-set-key (kbd "C-x v n") 'outline-next-heading)
;(global-set-key (kbd "C-x v p") 'outline-previous-heading)
;(global-set-key (kbd "C-c C-n") 'outline-next-heading)
;(global-set-key (kbd "C-c C-p") 'outline-previous-heading)

(global-set-key (kbd "C-c C-p") 'helm-ls-git-ls)

(global-set-key (kbd "<s-mouse-1>") 'hs-mouse-toggle-hiding)

;(push '("\\.ps1$" . powershell-mode) auto-mode-alist)

(if (eq system-type 'cygwin)
    (add-to-list 'load-path "/TOOLBOX/config/emacs")
  (add-to-list 'load-path (concat (getenv "TOOLBOX") "/config/emacs")))

(defun cygpath (p)
  (if (eq system-type 'cygwin)
      (shell-command-to-string (format "cygpath '%s'" p))
    p))

;(require 'smart-compile)
;(global-set-key (kbd "<f7>") 'psenv-compile)
;(defun psenv-compile ()
;  (interactive)
;  (compile
;   (format "powershell %s build" "d:/code/psenv/psenv.ps1")))

;(require 'cosmos)
             
;(require 'corext)

(require 'flymake)

(set-cursor-color "green")

;; dired
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-details-hide-link-targets nil)
(setq dired-dwim-target t)

;(setq omnisharp-server-executable-path "D:\\TOOLBOX\\OmniSharp\\dnx451\\OmniSharp.exe")
(defun my:csharp-mode-hook ()
  (omnisharp-mode 1)
  (local-set-key (kbd "M-.") 'omnisharp-go-to-definition-other-window)
  (local-set-key (kbd "M-SPC") 'omnisharp-auto-complete)
  (c-set-style "c#"))

(add-hook 'csharp-mode-hook
          'my:csharp-mode-hook)

(require 'projectile)
(defun projectile-rsync ()
  (interactive)
  (let ((root (projectile-project-root)))
    (compile (format "cd %s; bash .f5" root))))

(global-set-key (kbd "<f5>") 'projectile-rsync)
(global-set-key (kbd "<f6>") 'helm-ag-project-root)

(setq company-dabbrev-downcase nil)
(global-company-mode 1)

;(global-emojify-mode 1)

;(global-display-line-numbers-mode 1)

;(require 'window-number)
;(require 'spaceline-config)
;(window-number-mode)

;(require 'yasnippet)
;(yas-global-mode 1)

(setq scala-indent:step 4)

(setq exec-path (append exec-path '("/Users/tangyl/Anaconda/bin")))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;(atomic-chrome-start-server)
;(require 'nyan-mode)
;(nyan-mode)
;(spaceline-emacs-theme)
;(spaceline-toggle-nyan-cat-on)
;(spaceline-toggle-window-number-on)
;(spaceline-toggle-line-column-on)
;(global-nlinum-mode 1)
                                        ;(persp-mode 1)

;(require 'ace-isearch)
;(global-ace-isearch-mode +1)
;(custom-set-variables
; '(ace-isearch-input-length 5)
; '(ace-isearch-jump-delay 0.25)
; '(ace-isearch-function 'avy-goto-char-2)
; '(ace-isearch-use-jump 'printing-char))
;(define-key isearch-mode-map (kbd "M-SPC") 'ace-isearch-jump-during-isearch)
;(require 'server)

;(defun server-ensure-safe-dir (dir) "Noop" t)
                                        ;(setq server-use-tcp t)
(setq auto-save-default nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("89262e057805c65af24fd16745f4eb6869accfce41b369dd164ebcf380b65ec6" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "47590e864d867f10c38ddd98bf2d92d319c449ede20f4829680bf4dbd5865111" "bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" "b97a01622103266c1a26a032567e02d920b2c697ff69d40b7d9956821ab666cc" "69831e572dc46ced47c5309bff8fc2f4a9e237e2bad2c76f313da814a4628694" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(package-selected-packages
   (quote
    (modern-cpp-font-lock thrift cmake-mode scala-mode vlf use-package projectile monokai-theme magit helm-swoop helm-ls-git helm-descbinds helm-ag company avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
