;; general stuff
(require 'paren) (show-paren-mode t)    ;; Display matching parentheses
(setq-default column-number-mode t)     ;; Show column numbers
(global-set-key (kbd "M-s M-s") 'shell) ;; bash shell shortcut
;; general formatting
(setq require-final-newline t)          ;; forces final newline
(add-hook 'before-save-hook
	  'delete-trailing-whitespace)  ;; saving clears extra w-space


;; gets melpa packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" .
"http://melpa.milkbox.net/packages/") t)
  )

;; for ido (powerful autocomplete)
;; http://emacswiki.org/emacs/InteractivelyDoThings
;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)

;; for nlinum
(setq nlinum-format "%3d ")
(global-set-key (kbd "C-M-n") 'nlinum-mode)

;; use arrow keys to move between windows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; fixes a bug with S-up
(define-key global-map (kbd "<select>") 'windmove-up)

;; make arrow keys work with shell
(eval-after-load "shell"
  '(define-key shell-mode-map (kbd "<up>") 'comint-previous-input))
(eval-after-load "shell"
  '(define-key shell-mode-map (kbd "<down>") 'comint-next-input))

;; ;; ;; ;;
;; MODES ;;
;; ;; ;; ;;

;; for text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; turn on ruby-electric by default
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; for python shell
(require 'python)
(setq python-shell-interpreter "python3")

;; for feature-mode (cucumber)
;; https://github.com/michaelklishin/cucumber.el
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; for ruby-mode
(add-to-list 'auto-mode-alist
	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'"
               . ruby-mode))

;; ;; for AUCTeX
;; (require 'tex-site)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq TeX-PDF-mode t) ;; starts PDF mode by default
;; ;; from AUCTeX quickstart manual
;; (setq TeX-auto-save t) ;; for document parsing
;; (setq TeX-parse-self t) ;; for document parsing
;; (setq LaTeX-indent-level 4) ;; for \item indenting
;; (setq LaTeX-item-indent -2)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(css-indent-offset 2)
 '(ido-work-directory-list-ignore-regexps (quote (".*\\/exercism\\/.*"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )