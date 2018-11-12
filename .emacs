;; ;; ; ;; ;;
;; GENERAL ;;
;; ;; ; ;; ;;

(require 'paren) (show-paren-mode t)    ;; Display matching parentheses
(setq-default column-number-mode t)     ;; Show column numbers
(setq backup-by-copying-when-linked t)  ;; emacs won't break hard links
(setq ring-bell-function 'ignore)       ;; no beeping
(xterm-mouse-mode t)                    ;; this is an emacs sin please forgive me emacs gods

;; general formatting
(setq require-final-newline t)          ;; forces final newline
(add-hook 'before-save-hook
	  'delete-trailing-whitespace)  ;; saving clears extra w-space

;; gets melpa packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" .
				   "http://melpa.milkbox.net/packages/")
	       t)
  )

;; ;; ;; ;; ;;
;; KEYBOARD ;;
;; ;; ;; ;; ;;

;; bash shell shortcut
(global-set-key (kbd "M-s M-s") 'shell)

;; bind C-x C-z to zoom the current frame
(require 'zoom-window)
(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
(setq zoom-window-mode-line-color "Red")

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

;; ;; ;;; ;; ;;
;; SHORTCUTS ;;
;; ;; ;;; ;; ;;

;; reverts buffer without confirmation
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))

;; ;; ;; ;;
;; MODES ;;
;; ;; ;; ;;

;; for text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; for python shell
(require 'python)
(setq python-shell-interpreter "python3")

;; ;; ;; ;; ;; ;; ;;
;; OTHER PACKAGES ;;
;; ;; ;; ;; ;; ;; ;;

;; for ido (powerful autocomplete)
;; http://emacswiki.org/emacs/InteractivelyDoThings
;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)

;; for nlinum
(setq nlinum-format "%3d ")
(global-set-key (kbd "M-n") 'nlinum-mode)

;; yasnippets
(add-to-list 'load-path
	     ".emacs.d/elpa/yasnippet*")
(require 'yasnippet)
(yas-global-mode 1)
