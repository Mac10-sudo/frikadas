;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes '(timu-macos))
 '(custom-safe-themes
   '("5ba57614966b366177308ea5c4cf0b6bafea11deae7cefe8dd4b14e4b26fa501" default))
 '(ispell-dictionary nil)
 '(org-agenda-files
   '("~/Escritorio/agenda.org" "~/Escritorio/1.org" "~/Escritorio/2.org"))
 '(package-selected-packages
   '(multiple-cursors org-re-reveal htmlize ox-reveal company-posframe neotree ## treemacs tree-inspector latex-table-wizard ztree vertico use-package marginalia consult company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:foreground "#50a5eb" :weight ultra-bold :height 1.5)))))
(global-set-key "\C-ca" 'org-agenda)
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h)))
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(use-package treemacs
  :ensure t
  :defer 1
  :config

  (defun hacer-treemacs-resizable ()
    (if treemacs--width-is-locked
        (treemacs-toggle-fixed-width)))

  (defun cambiar-faces-de-treemacs ()
    ;; Cambio el tamaño por defecto del face
    (mapcar
     (lambda (face) (set-face-attribute face nil :height 0.8) )
     '(
       treemacs-directory-face                
       treemacs-directory-collapsed-face      
       ;;treemacs-file-face                     
       treemacs-root-face                     
       treemacs-root-unreadable-face          
       treemacs-root-remote-face              
       treemacs-root-remote-unreadable-face   
       treemacs-root-remote-disconnected-face 
       treemacs-tags-face                     
       treemacs-help-title-face               
       treemacs-help-column-face              
       treemacs-git-unmodified-face
       treemacs-git-modified-face
       treemacs-git-renamed-face
       treemacs-git-ignored-face
       treemacs-git-untracked-face
       treemacs-git-added-face
       treemacs-git-conflict-face
       treemacs-term-node-face                
       treemacs-on-success-pulse-face         
       ))
    )

  
  (add-hook 'treemacs-mode-hook #'hacer-treemacs-resizable)
  (setq treemacs-silent-refresh t)
  (treemacs-git-mode -1)
  
  (cambiar-faces-de-treemacs)
  :bind
  (("<f8>" . treemacs))


  )
(use-package company-posframe
  :ensure t
  :after (company)
  :config
  
  (company-posframe-mode 1)
  )


(use-package company
  :ensure t
  :config
  
  (company-flx-mode +1)
  (setq company-tooltip-minimum-width 70)


  (defun my-js2-mode-hook()
    (interactive)
    (setq ac-js2-evaluate-calls t)
    (auto-highlight-symbol-mode 0)
    (js2-highlight-unused-variables-mode 1)

    (defvar my-company-backends-js2-mode
      '(
        (
         company-files
         ac-js2-company
         company-dabbrev-code
         company-capf
         )
        )
      )

    (set (make-local-variable 'company-backends) my-company-backends-js2-mode))



  (add-hook 'js2-mode-hook #'my-js2-mode-hook)





  (defvar my-company-backends-prog-mode
    '(
      (
       company-capf
       company-files
       company-dabbrev-code
       company-web-html
       company-keywords
       company-emoji
       )
      )
    )


  (defvar my-company-backends-org-mode
    '(
      (
       company-files
       company-dabbrev-code
       company-dabbrev
       company-keywords
       company-emoji
       company-capf
       )
      )
    )

  (defvar my-company-backends my-company-backends-org-mode)

  ;; set default `company-backends'
  (setq company-backends my-company-backends)

  (add-hook 'after-init-hook 'global-company-mode)

  (company-quickhelp-mode 1)

  (defun my-company-backends-org-mode-function ()
    (interactive)
    (set (make-local-variable 'company-backends) my-company-backends-org-mode))

  (add-hook 'org-mode-hook #'my-company-backends-org-mode-function)

  (defun my-company-backends-prog-mode-function ()
    (interactive)
    (set (make-local-variable 'company-backends) my-company-backends-prog-mode))


  (add-hook 'prog-mode-hook #'my-company-backends-prog-mode-function)

  (global-set-key (kbd "C-.") 'company-complete)
  (define-key company-active-map [escape] 'company-abort)
  (global-company-mode)
  )
(use-package timu-macos-theme
  :ensure t
  :config
  (load-theme 'timu-macos t))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package multiple-cursors
    :ensure t
    :custom (mc/always-run-for-all t)
    :bind

      (("C-S-c C-S-c" . mc/edit-lines ))
      (("C->" . mc/mark-next-like-this ))
      (("C-<" . mc/mark-previous-like-this ))
      (("C-S-<mouse-1>" . mc/add-cursor-on-click ))
      (("C-S-c C-S-v" . mc/mark-all-like-this ))
)
(use-package org-pretty-tags
  :diminish org-pretty-tags-mode
  :ensure t
  :config
  (setq org-pretty-tags-surrogate-strings
        '(("work"  . "⚒")))


