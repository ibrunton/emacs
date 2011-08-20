;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; C/C++ mode hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun my-c-mode-common-hook ()
;;   (define-key c-mode-map (kbd "C-<f12>") 'compile))
;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(eval-after-load 'cc-mode
  '(define-key c-mode-map (kbd "C-<f12>") 'compile))

;; (define-key c-mode-map (kbd "C-<f12>") 'compile)