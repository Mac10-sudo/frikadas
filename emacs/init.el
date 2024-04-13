(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(tsdh-dark))
 '(custom-safe-themes
   '("26a8f9baf6a7887110c25e0bc5aff033e54555251bd80233ad99e33b32e5f3f6" "fc6697788f00629cd01f4d2cc23f1994d08edb3535e4c0facef6b7247b41f5c7" "d916b686ba9f23a46ee9620c967f6039ca4ea0e682c1b9219450acee80e10e40" "a63355b90843b228925ce8b96f88c587087c3ee4f428838716505fd01cf741c8" "6e219d6b6a3f7e22888b203fd5492e12133ba40512be983858f05b42806fa573" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "b53db91fd0153783f094a2d5480119824b008f158e07d6b84d22f8e6b063d6e2" default))
 '(ensime-sem-high-faces
   '((var :foreground "#000000" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#000000")
     (varField :foreground "#600e7a" :slant italic)
     (valField :foreground "#600e7a" :slant italic)
     (functionCall :foreground "#000000" :slant italic)
     (implicitConversion :underline
			 (:color "#c0c0c0"))
     (implicitParams :underline
		     (:color "#c0c0c0"))
     (operator :foreground "#000080")
     (param :foreground "#000000")
     (class :foreground "#20999d")
     (trait :foreground "#20999d" :slant italic)
     (object :foreground "#5974ab" :slant italic)
     (package :foreground "#000000")
     (deprecated :strike-through "#000000")))
 '(package-selected-packages
   '(nyan-mode all-the-icons-completion company-emoji company-web evil all-the-icons-nerd-fonts centaur-tabs kotlin-mode ox-reveal reveal-in-folder reveal-in-osx-finder epresent tmux-mode tramp-term web-mode git intellij-theme tangotango-theme sudo-edit ssh company-quickhelp company-flx multiple-cursors org-bullets timu-caribbean-theme company-box company-posframe auctex treemacs ztree marginalia consult use-package vertico company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :height 1.5))))
 '(org-level-1 ((t (:height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :box nil :height 1.3)))))

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

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



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

(use-package latex
  :ensure auctex
  :config
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

; Para que funcione correctamente el resaltado de sintaxis, hay que informar a Auctex de los entornos /verbatim/ utilizados:

(setq LaTeX-verbatim-environments
      '("verbatim" "verbatim*" "listadotxt" "PantallazoTexto" "listadosql" "listadoshell" "listadojava"))


(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))


; Para imenu, defino una macro de Latex que no hace nada, pero que detecto en imenu.
(add-to-list 'TeX-outline-extra '("imenu" 2))
(add-to-list 'TeX-outline-extra '("imenu1" 1))
(add-to-list 'TeX-outline-extra '("imenu2" 2))
(add-to-list 'TeX-outline-extra '("imenu3" 3))
(add-to-list 'TeX-outline-extra '("imenu4" 4))

; En Ubuntu, Evince puede sincronizarse con Emacs para saber a qué parte de código corresponde una parte del PDF y viceversa
(setq TeX-view-program-selection '((output-pdf "Okular")))
(setq TeX-source-correlate-mode t)
(add-hook 'latex-mode-hook 'TeX-source-correlate-mode)

(setq TeX-source-correlate-start-server t)



; Modifico el comando Latex para incluir =-shell-escape=, de forma que Latex pueda arrancar programas de ayuda (por ejemplo, *Inkscape* para convertir SVG a PDF)

(setq LaTeX-command-style
   (quote (("" "%(PDF)%(latex) %(file-line-error) -shell-escape %(extraopts) %S%(PDFout)"))))


; Se pueden previsualizar los entornos =tikzpicture= y =tabular= directamente en el buffer de Emacs ([[https://www.gnu.org/software/auctex/manual/preview-latex.html][https://www.gnu.org/software/auctex/manual/preview-latex.html]])

(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t) )
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tabular}" t) )
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{homeworkProblem}" t) )

; Añadir XeLatex
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
     		'("XeLaTeX" "xelatex -interaction=nonstopmode %s"
		  TeX-run-command t t :help "Run xelatex") t))

;; En =Termux= se necesita especificar la camino a la /shell/ para ejecutar comandos de /Latex/
(if
      (file-exists-p "/data/data/com.termux/files/usr/bin/sh")
      (setq TeX-shell  "/data/data/com.termux/files/usr/bin/sh"))
)

(use-package company-posframe
  :ensure t
  :after (company)
  :config
  
  (company-posframe-mode 1)
  )


(use-package org-bullets
  :hook (( org-mode ) . org-bullets-mode))
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

(setq  custom-safe-themes  (quote
                            ("fc6697788f00629cd01f4d2cc23f1994d08edb3535e4c0facef6b7247b41f5c7"
                             "d916b686ba9f23a46ee9620c967f6039ca4ea0e682c1b9219450acee80e10e40" 
                             "a63355b90843b228925ce8b96f88c587087c3ee4f428838716505fd01cf741c8"
                             "6e219d6b6a3f7e22888b203fd5492e12133ba40512be983858f05b42806fa573"
                             "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" 
                             "b53db91fd0153783f094a2d5480119824b008f158e07d6b84d22f8e6b063d6e2" 
                             default)))

(defvar my-dark-theme 'my-tangotango)
(defvar my-light-theme 'intellij)


(defun tema-claro()
  (interactive)
  (disable-theme my-dark-theme)
  (load-theme my-light-theme t)
  )

(defun tema-oscuro ()
  (interactive)
  (disable-theme my-light-theme)
  (load-theme my-dark-theme t)
  )

(run-with-idle-timer 2 nil #'tema-oscuro)

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

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


(require 'centaur-tabs)
(centaur-tabs-mode t)
(global-set-key (kbd "C-<prior>")  'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "slant")
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-close-button "X")
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "*")
  (setq centaur-tabs-label-fixed-length 8)
  (centaur-tabs-change-fonts "arial" 120)
	  
	  

(use-package all-the-icons
  :ensure t)
  
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

(require 'nyan-mode)
(nyan-mode)
