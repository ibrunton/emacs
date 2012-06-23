;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; Deft MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'deft nil 'noerror)
  (setq
   deft-extension "org"
   deft-directory "~/Dropbox/docs/deft/"
   deft-text-mode 'org-mode
   deft-auto-save-interval 10.0)
  )