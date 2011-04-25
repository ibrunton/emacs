;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment:
;; GUI, window behaviour, and so on
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; start at home
(cd "~")

;; a few functions use this
(setq idb-root-dir "~/")

;; highlight during query
(setq query-replace-highlight t)        

;; highlight incremental search
(setq search-highlight t)               

;; Show matching parenthesis.
(show-paren-mode t)

;; Dont show the GNU splash screen
(setq inhibit-startup-message t)

;; Don't beep, but flash
(setq visible-bell t)

;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Open unidentified files in text mode
(setq default-major-mode 'text-mode)

;; Auto-fill text files:
;(setq text-mode-hook 'turn-on-auto-fill)

;; Current line and column number in mode line
(global-linum-mode t)
(setq linum-format "%d ")
(setq column-number-mode t)

;; Don't wrap long lines
(set-default 'truncate-lines t)

;; don't make backup files
(setq make-backup-files nil)

;; No menu bar or toolbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; titlebar = buffer unless filename
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; font lock
(global-font-lock-mode t)

;; bookmarks
(setq bookmark-default-file "~/.emacs.d/bookmarks"
      bookmark-save-flag 1)

;; don't auto add final newline:
(setq-default require-final-newline nil)

;; allow erase-buffer:
(put 'erase-buffer 'disabled nil)

;; set window width
;; (defun set-frame-size ()
;;   (interactive)
;;   (add-to-list 'default-frame-alist (cons 'width 90)))
;; (set-frame-size)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cursor
;; copied from http://emacs-fu.blogspot.com/2009/12/changing-cursor-color-and-shape.html
;; & modified Monday, 07 December, 2009
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Change cursor color according to mode; inspired by
;; http://www.emacswiki.org/emacs/ChangingCursorDynamically
(setq djcb-read-only-color       "gray")
;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; (hbar. HEIGHT); see the docs for set-cursor-type
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq djcb-read-only-cursor-type 'hbar)
(setq djcb-overwrite-color       "red")
(setq djcb-overwrite-cursor-type 'box)
(setq djcb-normal-color          "white")
(setq djcb-normal-cursor-type    'box)

(defun djcb-set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."

  (cond
    (buffer-read-only
     (set-cursor-color djcb-read-only-color)
     (setq cursor-type djcb-read-only-cursor-type))
    (overwrite-mode
     (set-cursor-color djcb-overwrite-color)
     (setq cursor-type djcb-overwrite-cursor-type))
    (t 
     (blink-cursor-mode -1)
     (set-cursor-color djcb-normal-color)
     (setq cursor-type djcb-normal-cursor-type))))

(add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)

;; Color theme
(require 'color-theme)
(load "color-theme-djcb-dark")
(color-theme-djcb-dark)
