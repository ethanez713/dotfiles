;; general stuff
(require 'paren) (show-paren-mode t)          ;; Display matching parentheses
(setq-default column-number-mode t)           ;; Show column numbers
(global-set-key (kbd "M-s M-s") 'shell)       ;; bash shell shortcut
(setq require-final-newline t)                ;; forces final newline

;; gets melpa packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" .
"http://melpa.milkbox.net/packages/") t)
  )

;; for text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; for python shell
(require 'python)
(setq python-shell-interpreter "python3")

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

;; ;; for nlinum
;; (require 'nlinum)
;; (setq nlinum-format "%4d ")
;; (global-set-key (kbd "C-M-n") 'nlinum-mode)

;; ;; for AUCTeX
;; (require 'tex-site)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq TeX-PDF-mode t) ;; starts PDF mode by default
;; ;; from AUCTeX quickstart manual
;; (setq TeX-auto-save t) ;; for document parsing
;; (setq TeX-parse-self t) ;; for document parsing
;; (setq LaTeX-indent-level 4) ;; for \item indenting
;; (setq LaTeX-item-indent -2)
