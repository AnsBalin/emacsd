;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path
	     (expand-file-name "~/repos/all-the-icons-dired"))
(package-initialize)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))
(unless (package-installed-p 'evil-org)
  (package-install 'evil-org))
(unless (package-installed-p 'evil-surround)
  (package-install 'evil-surround))
(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))
(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))
(unless (package-installed-p 'all-the-icons)
  (package-refresh-contents)
  (package-install 'all-the-icons))

;; Completion narrowing
(unless (package-installed-p 'vertico)
  (with-demoted-errors "%s%"
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'vertico)))
(with-demoted-errors "%s" (vertico-mode +1))

(setq completion-styles '(partial-completion substring flex))

;; Completion annotations
(unless (package-installed-p 'marginalia)
  (with-demoted-errors "%s"
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'marginalia)))
(with-demoted-errors "%s" (marginalia-mode +1))


(setq evil-want-C-u-scroll t)
(setq evil-want-C-d-scroll t)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
;; Enable Evil
(require 'evil)

;; Evil config
(setq evil-remap-state-maps t)
(setq evil-remap-normal-state-maps t)
(evil-mode 1)

(require 'evil-collection)
(evil-collection-init)

;; org mode
(transient-mark-mode 1)
(require 'org)
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))

(unless (package-installed-p 'catppuccin-theme)
  (package-refresh-contents)
  (package-install 'catppuccin-theme))
(load-theme 'catppuccin :no-confirm)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(setq enable-recursive-minibuffers t)

;; org mode globals
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; dired config
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(setq delete-by-moving-to-trash t)
;; cant remember what this is 
(add-hook 'dired-load-hook (lambda () (require 'dired-x)))
;; all the icons
(load "all-the-icons-dired.el")
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(setq default-directory "~/")

(set-face-attribute 'default nil
                    :family "JetBrains Mono"
                    :height 100  ;; Size in 1/10pt, so 110 is 11pt
                    :weight 'normal)

;; mac specific
(setq ns-right-alternative-modifier 'none) ;; make it so i can type # with right-option
