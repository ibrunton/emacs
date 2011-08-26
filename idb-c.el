;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; C/C++ mode hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun my-c-mode-common-hook ()
;;   (define-key c-mode-map (kbd "C-<f12>") 'compile))
;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode t)

(eval-after-load 'cc-mode
  '(define-key c-mode-map (kbd "C-<f12>") 'compile))

;; (define-key c-mode-map (kbd "C-<f12>") 'compile)