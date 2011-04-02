;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; PASSWORDS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; the princess is in another castle:
(add-to-list 'load-path "~/.userdata")
;;Load the password file but don't complain if it doesn't exist
(load "passwords.el.gpg" 'noerror)
(load "user-info.el.gpg" 'noerror)
