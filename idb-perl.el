;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; (C)PERL MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))

(setq cperl-indent-level 4)
(setq cperl-invalid-face (quote off))
(setq cperl-autoindent-on-semi t)
(setq cperl-electric-keywords t)
(setq cperl-electric-linefeed t)
(setq cperl-electric-parens nil)
(setq cperl-hairy t)

(add-hook 'cperl-mode-common-hook
	'(lambda ()
	   (setq tab-width 4)))
