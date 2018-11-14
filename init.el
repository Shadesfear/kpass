(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(setq python-shell-interpreter "python3")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (atom-dark)))
 '(custom-safe-themes
   (quote
    ("2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "2a9039b093df61e4517302f40ebaf2d3e95215cb2f9684c8c1a446659ee226b9" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(fci-rule-color "#37474f")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (slack togetherly yasnippet-snippets yasnippet yasnippet-classic-snippets auctex virtualenvwrapper atom-dark-theme neotree gruvbox-theme markdown-mode solarized-theme smartparens rainbow-delimiters pyenv-mode powerline pomodoro org-pomodoro org-bullets nlinum multiple-cursors monokai-theme monokai-alt-theme material-theme magit jedi helm fireplace elpy dashboard anaconda-mode ace-jump-mode)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(send-mail-function (quote mailclient-send-it))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)

;;******************
;; Multiple cursors
;;******************

(require 'multiple-cursors)
(global-set-key (kbd "C-<") 'mc/mark-next-like-this-word)

;; *******************
;; Autocomplete
;; *******************

(require 'auto-complete)
(setq ac-dwim t)
(ac-config-default)
(setq ac-sources '(ac-source-yasnippet
ac-source-abbrev
ac-source-words-in-same-mode-buffers))
(set-face-background 'ac-candidate-face "white")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")

(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
;; *****************
;; Ace jump mode
;; ******************
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; *****************
;;Smartparens
;; ******************

(require 'smartparens-config)
(smartparens-mode 1)
(smartparens-global-mode)
(define-key global-map (kbd "C-M-a") 'sp-beginning-of-sexp)
(define-key global-map (kbd "C-M-e") 'sp-end-of-sexp)
(define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)
(show-smartparens-mode t)

(global-set-key [f8] 'neotree-toggle)
'(use-package neotree
  :bind ([f8] . neotree-toggle)
  :config (setq neo-default-system-application "open"))
(setq neo-default-system-application "open")

(require 'powerline)
(powerline-default-theme)

;;(require 'ido)
;;(ido-mode t)

(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-banner-logo-title "You probably think that you are better now, better now")
(setq dashboard-startup-banner "~/Pictures/icons/post-malone.jpeg")
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" which displays whatever image you would prefer
(global-set-key (kbd "C-x g") 'magit-status)

(require 'helm)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)
(setq helm-mode-fuzzy-match t)
(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(setq org-hide-emphasis-markers t)




(add-hook 'org-mode-hook 'variable-pitch-mode)

(add-hook 'org-mode-hook 'visual-line-mode)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
					;(ac-config-default)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; note that setting `venv-location` is not necessary if you
;; use the default location (`~/.virtualenvs`), or if the
;; the environment variable `WORKON_HOME` points to the right place
(setq venv-location "/home/chris")
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'latex)
(sp-pair "$" "$")

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(eval-after-load "org"
  '(require 'ox-md nil t))

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old
