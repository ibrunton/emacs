;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; LaTeX mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'latex-mode-hook 'auto-fill-mode)
(add-hook 'tex-mode-hook 'auto-fill-mode)

(eval-after-load 'latex-mode '(setq tab-width 8))
(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c C-c") add-nocite-prompt))

(eval-after-load 'bibtex-mode
  '(define-key bibtex-mode [(tab)] 'self-insert-command))

