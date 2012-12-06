;; -------------------------------------------------------------------
;; Ian Brunton's emacs environment
;; website: ibrunton.wordpress.com
;; email: ibrunton@accesswave.ca
;; -------------------------------------------------------------------

;; -------------------------------------------------------------------
;; library paths
;; -------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d")
;; add all top-level subdirectories to load path:
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;; keep third party libraries separate in ~/.emacs.d/vendor
(add-to-list 'load-path "~/.emacs.d/vendor")
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))

;; GUI, other visual behaviours:
(load-library "idb-environment")

;; Icicles
;;(load-library "idb-icicles")

;; keybindings:
(load-library "idb-keybindings")

;; passwords:
;;(load-library "idb-passwords")

;; various functions:
(load-library "idb-functions")

;; aliases
(load-library "idb-alias")

;; -------------------------------------------------------------------
;; libraries loaded as-is, without customisations
;; -------------------------------------------------------------------

(require 'generic-x)

(require 'log-mode)

(require 'tumblr-mode)

(require 'wc)

;;(require 'mu)

;;(require 'vc-git)
;;(load "/usr/share/emacs/site-lisp/git.el")
;;(load "/usr/share/emacs/site-lisp/git-blame.el")

;;(require 'lagn)

;; -------------------------------------------------------------------
;; customised libraries
;; -------------------------------------------------------------------

;; text mode:
(load-library "idb-text")

;; log mode:
(load-library "log-mode")

;; POV-Ray:
;;(load-library "idb-pov")

;; Org mode + Remember mode:
(load-library "idb-org")

;; YASnippet:
(load-library "idb-yasnippet")

;; Recent files:
(load-library "idb-recentf")

;; Wanderlust:
;;(load-library "idb-wl")

;; ljupdate:
;;(load-library "idb-ljupdate")

;; org2blog (wordpress):
(load-library "idb-org2blog")

;; deft
(load-library "idb-deft")

;; markdown
(load-library "idb-markdown")

;; diary/calendar
(load-library "idb-diary")

;; -------------------------------------------------------------------
;; programming languages
;; -------------------------------------------------------------------

;; C/C++ mode
(load-library "idb-c")

;; Perl mode
(load-library "idb-perl")

;; Python mode, Pymacs, Ropemacs:
(load-library "idb-python")

;; LaTeX mode:
(load-library "idb-latex")

;; lua mode (mostly for awesome wm config):
(load-library "idb-lua")

;; shell functions:
;;(load-library "idb-shell")
(setq eval-expression-debug-on-error t) 

;; indentation
;;(load-library "idb-indent")

;; -------------------------------------------------------------------
;; CUSTOM
;; -------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(color-theme-legal-frame-parameters "\\(color\\|mode\\)$")
 '(delete-selection-mode nil)
 '(face-font-family-alternatives (quote (("courier" "fixed") ("courier" "CMU Typewriter Text" "fixed") ("Sans Serif" "helv" "helvetica" "arial" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(mark-even-if-inactive t)
 '(mu-worlds (quote (["FurryMuck" "muck.furry.com" 8888 "guest" "guest"])))
 '(org-agenda-files (quote ("~/Dropbox/docs/org/todo.org")))
 '(recentf-auto-cleanup (quote never))
 '(scroll-bar-mode (quote right))
 '(transient-mark-mode 1))

;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :foreground "LightGray" :background "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Courier New"))))
;;  '(font-lock-comment-face ((t (:foreground "#ff8c00" :background "black" :slant italic))))
;;  '(linum ((t (:inherit (shadow default) :foreground "#ff8c00" :background "black" ))))
;;  '(region ((t (:background "#8899aa" :foreground "black")))))


;; -------------------------------------------------------------------
;; Display time in the mode line
;; Put this line last to prove (by the time in the mode line) 
;; that the .emacs loaded without error to this point.
;; -------------------------------------------------------------------

(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)
;;(server-start) ;; do I need this with --daemon?
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
