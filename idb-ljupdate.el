;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; LJUPDATE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq message-directory "~/.ljdrafts/")
(setq lj-fill-function (quote lj-fill-by-paragraph))

(require 'ljupdate)
(load-file "~/.emacs.d/vendor/ljupdate/lj-fill.el")