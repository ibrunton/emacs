;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; PASSWORDS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; the princess is in another castle:
(add-to-list 'load-path "~/.emacs.private")
;;Load the password file but don't complain if it doesn't exist
(load "real-passwords" 'noerror)
