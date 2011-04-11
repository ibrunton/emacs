;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; website: ibrunton.wordpress.com
;; email: ibrunton@accesswave.ca
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; library paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d")
;; add all top-level subdirectories to load path:
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;; keep third party libraries seperate in ~/.emacs.d/vendor
(add-to-list 'load-path "~/.emacs.d/vendor")
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))

;; GUI, other visual behaviours:
(load-library "idb-environment")

;; keybindings:
(load-library "idb-keybindings")

;; passwords:
(load-library "idb-passwords")

;; various functions:
(load-library "idb-functions")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; libraries loaded as-is, without customisations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'generic-x)

(require 'log-mode)

(require 'tumble)

;;(require 'mu)

;;(require 'vc-git)
;;(load "/usr/share/emacs/site-lisp/git.el")
;;(load "/usr/share/emacs/site-lisp/git-blame.el")

(require 'lagn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customised libraries
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; log mode:
;;(load-library "log-mode")

;; POV-Ray:
(load-library "idb-pov")

;; Org mode + Remember mode:
(load-library "idb-org")

;; YASnippet:
(load-library "idb-yasnippet")

;; Recent files:
(load-library "idb-recentf")

;; Python mode, Pymacs, Ropemacs:
;;(load-library "idb-python")

;; LaTeX mode:
(load-library "idb-latex")

;; Wanderlust:
;;(load-library "idb-wl")

;; ljupdate:
(load-library "idb-ljupdate")

;; org2blog (wordpress):
(load-library "idb-org2blog")

;; shell functions:
(load-library "idb-shell")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUSTOM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(face-font-family-alternatives (quote (("courier" "fixed") ("courier" "CMU Typewriter Text" "fixed") ("Sans Serif" "helv" "helvetica" "arial" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(mark-even-if-inactive t)
 '(mu-worlds (quote (["FurryMuck" "muck.furry.com" 8888 "guest" "guest"])))
 '(scroll-bar-mode (quote right))
 '(transient-mark-mode 1))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "LightGray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Courier 10 Pitch"))))
 '(font-lock-comment-face ((t (:foreground "#ff8c00" :slant italic)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Display time in the mode line
;; Put this line last to prove (by the time in the mode line) 
;; that the .emacs loaded without error to this point.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)
(server-start)
