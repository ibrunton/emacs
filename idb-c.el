;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; C/C++ mode hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun my-c-mode-common-hook ()
;;   (define-key c-mode-map (kbd "C-<f12>") 'compile))
;; (add-hook 'c-initialization-hook 'my-c-mode-common-hook)

;; (setq-default c-basic-offset 4
;; 	      tab-width 4
;; 	      indent-tabs-mode t)

(add-hook 'c-mode-common-hook
  '(lambda() 
     ;; C-c o to find related .h/.c file
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)
    (setq tab-width 4)))

;; key for compiling:
(eval-after-load 'cc-mode
  '(define-key c-mode-map (kbd "C-<f12>") 'compile))
;; because the above doesn't work in terminal:
(eval-after-load 'cc-mode
  '(define-key c-mode-map (kbd "C-c C-c") 'compile))

;; (define-key c-mode-map (kbd "C-<f12>") 'compile)
