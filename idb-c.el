;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; C/C++ mode hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(defun my-c-mode-common-hook ())

(eval-after-load 'c-mode
  '(define-key c-mode-map (kbd "C-<f12>") 'compile))