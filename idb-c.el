;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; C/C++ mode hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun my-c-mode-common-hook ()
;;   (define-key c-mode-map (kbd "C-<f12>") 'compile))
;; (add-hook 'c-initialization-hook 'my-c-mode-common-hook)

(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode t)

(eval-after-load 'cc-mode
  '(define-key c-mode-map (kbd "C-<f12>") 'compile))

;; because the above doesn't work in terminal, and C-c C-c is bound to
;; comment-region which I have elsewhere bound to F2 anyway:
(eval-after-load 'cc-mode
  '(define-key c-mode-map (kbd "C-c C-c") 'compile))

;; (define-key c-mode-map (kbd "C-<f12>") 'compile)