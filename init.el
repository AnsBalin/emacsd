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
(unless (package-installed-p 'ef-themes)
  (package-refresh-contents)
  (package-install 'ef-themes))
(unless (package-installed-p 'catppuccin-theme)
  (package-refresh-contents)
  (package-install 'catppuccin-theme))

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
(setq evil-want-C-i-jump nil)
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
(setq org-src-preserve-indentation t)
(setq org-hide-leading-stars t)
(setq org-hide-emphasis-markers t)
(setq org-agenda-files '("~/Dropbox/orgs/emacs.org" "~/Dropbox/orgs/daily.org"))
(require 'org)
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))

;;(load-theme 'catppuccin :no-confirm)
(require 'ef-themes)
(setq ef-themes-headings
	(quote ((1 light regular 1.5)
		(2 regular 1.3)
		(3 regular 1.1)
		(agenda-date 1.3)
		(agenda-structure regular light 1.8)
		(t regular))))
(ef-themes-select 'ef-day)

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
                    :family "Iosevka NFP"
                    :height 120  ;; Size in 1/10pt, so 110 is 11pt
                    :weight 'normal)

(set-face-attribute 'variable-pitch nil
		    :family "ETBembo"
		    :height 140)

;; mac specific
(setq ns-right-alternative-modifier 'none) ;; make it so i can type # with right-option

