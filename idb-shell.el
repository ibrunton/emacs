;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DJCB functions for terminal programs
;; http://emacs-fu.blogspot.com/2008/12/running-console-programs-inside-emacs.html
;; <2011-04-11 Mon>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-buffer-name "terminal")

;; (defun djcb-term-start-or-switch (prg &optional use-existing)
;;   "* run program PRG in a terminal buffer. If USE-EXISTING is non-nil "
;;   " and PRG is already running, switch to that buffer instead of starting"
;;   " a new instance."
;;   (interactive)
;;   (let ((bufname (concat "*" prg "*")))
;;     (when (not (and use-existing
;;                  (let ((buf (get-buffer bufname)))
;;                    (and buf (buffer-name (switch-to-buffer bufname))))))
;;       (ansi-term prg prg))))

;; (defmacro djcb-program-shortcut (name key &optional use-existing)
;;   "* macro to create a key binding KEY to start some terminal program PRG; 
;;     if USE-EXISTING is true, try to switch to an existing buffer"
;;   `(global-set-key ,key 
;;      '(lambda()
;;         (interactive)
;;         (djcb-term-start-or-switch ,name ,use-existing))))

;; (djcb-program-shortcut "bash" (kbd "<S-f1>") t) 
;; (djcb-program-shortcut "muttwolf" (kbd "<f4>") t)  ; mail client
;; (djcb-program-shortcut "muttian" (kbd "<S-f4>") t)
;; ;; (djcb-program-shortcut "irssi" (kbd "<S-f7>") t)  ; irc client