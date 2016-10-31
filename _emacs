                                        ;(file-name-directory load-file-name)
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(setq default-process-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

(defun require-package (pkg)
  (unless (package-installed-p pkg)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install pkg)))

(require-package 'monokai-theme)
(require-package 'darkokai-theme)
(require-package 'csharp-mode)
(require-package 'projectile)
(require-package 'grizzl)
(require-package 'helm)
(require-package 'helm-ag)
;(require-package 'ace-isearch)
;(require-package 'helm-core)
;(require-package 'helm-projectile)
;(require-package 'helm-flycheck)
(require-package 'helm-descbinds)
(require-package 'image+)
;(require-package 'auto-complete)
(require-package 'company)
;(require-package 'cider)
;(require-package 'cider-decompile)
;(require-package 'nlinum)
(require-package 'fsharp-mode)
(require-package 'yasnippet)
;(require-package 'smart-tabs-mode)
(require-package 'dired+)
(require-package 'helm-swoop)
;(require-package 'ace-jump-mode)
(require-package 'ace-window)
(require-package 'w32-browser)
;(require-package 'direx)
(require-package 'bookmark+)
(require-package 'avy)
(require-package 'magit)
;(require-package 'paradox)
;(require-package 'aggressive-indent)
;(require-package 'helm-projectile)
(require-package 'powershell)
(require-package 'yasnippet)
(require-package 'dired-details)
(require-package 'dired-details+)
;(require-package 'powerline)
;(require-package 'yafolding)
;(require-package 'origami)
(require-package 'omnisharp)
;(require-package 'flycheck)
;(require-package 'ensime)
;(require-package 'scala-mode2)
;(require-package 'sbt-mode)
(require-package 'vlf) ;; read very large file
;(require-package 'smart-mode-line)
;(require-package 'vimish-fold)
(require-package 'window-number)
;(require-package 'persp-mode)
;(require-package 'nyan-mode)
                                        ;(require-package 'spaceline)
(require-package 'ido-vertical-mode)
(require-package 'smex)

; smart-mode-line
; https://github.com/Malabarba/smart-mode-line
;(setq sml/no-confirm-load-theme t)
;(setq sml/theme 'respectful)
;(sml/setup)

(require 'vlf-setup)

;(setq projectile-completion-system 'helm)
;(helm-projectile-on)

(when (window-system)
  (set-face-font 'default "Consolas")
  (set-face-attribute 'default nil :family "Consolas" :height 120)
  (load-theme 'darkokai t)
                                        ;(load-theme 'monokai t)
  )

;; tab
(setq-default indent-tabs-mode nil)
(setq tab-witdth 4)
(setq-default tab-width 4)
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

(require 'dired+)

;(unless (eq system-type 'cygwin)
;  (setq magit-git-executable (concat (getenv "TOOLBOX") "/PortableGit/cmd/git.exe")))
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
(ido-mode 1)                                        ;(require 'helm-swoop)
(ido-vertical-mode 1)

(require 'ido-vertical-mode)
(require 'helm)
;(helm-mode 1)
;(helm-autoresize-mode 1)
;(setq helm-bookmark-show-location t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x c o") 'helm-occur)
(global-set-key (kbd "C-x c i") 'helm-imenu)
(global-set-key (kbd "C-x j") 'ace-jump-mode)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x w") 'ace-window)
(global-set-key (kbd "<f12>") 'w32explore)
(global-set-key (kbd "C-;") 'avy-goto-char-2)
;(global-set-key (kbd "C-x C-c") 'helm-projectile-ag)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-h b") 'helm-descbinds)
;(global-set-key (kbd "<f7>") 'compile)
;(global-set-key (kbd "C-x v f") 'vimish-fold)
;(global-set-key (kbd "C-x v v") 'vimish-fold-delete)
                                        ;(global-set-key (kbd "C-x v t") 'vimish-fold-toggle)
(global-set-key (kbd "C-x v a") 'outline-show-all)
(global-set-key (kbd "C-x v h") 'outline-hide-body)
(global-set-key (kbd "C-x v t") 'outline-toggle-children)
(global-set-key (kbd "C-x v v") 'outline-toggle-children)
(global-set-key (kbd "C-x v n") 'outline-next-heading)
(global-set-key (kbd "C-x v p") 'outline-previous-heading)
(global-set-key (kbd "C-c C-n") 'outline-next-heading)
(global-set-key (kbd "C-c C-p") 'outline-previous-heading)

;(push '("\\.ps1$" . powershell-mode) auto-mode-alist)

(if (eq system-type 'cygwin)
    (add-to-list 'load-path "/TOOLBOX/config/emacs")
  (add-to-list 'load-path (concat (getenv "TOOLBOX") "/config/emacs")))

(defun cygpath (p)
  (if (eq system-type 'cygwin)
      (shell-command-to-string (format "cygpath '%s'" p))
    p))

;(require 'smart-compile)
(global-set-key (kbd "<f7>") 'psenv-compile)
(defun psenv-compile ()
  (interactive)
  (compile
   (format "powershell %s build" "d:/code/psenv/psenv.ps1")))

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

(setq company-dabbrev-downcase nil)
(global-company-mode 1)

(require 'window-number)
;(require 'spaceline-config)
(window-number-mode)

(require 'yasnippet)
(yas-global-mode 1)
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
(require 'server)

;(defun server-ensure-safe-dir (dir) "Noop" t)
                                        ;(setq server-use-tcp t)

