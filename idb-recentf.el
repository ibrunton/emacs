;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; RECENTF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'recentf)
(recentf-mode 1)

(setq recentf-save-file "~/.config/recentf")

(load "recentf-buffer")
(global-set-key [?\C-c ?r ?f] 'recentf-open-files-in-simply-buffer)
