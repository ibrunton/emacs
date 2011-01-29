;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; KEYBINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; setting the PC keyboard's various keys to Super or Hyper, for emacs running on Windows.
; This is tested on Lennart Borgman's Windows emacsw32 distro.
; http://ourcomments.org/Emacs/EmacsW32Util.html
;; 2010-01-29 Fri: window keys commented out, because they're used outside of emacs
(setq ;w32-pass-lwindow-to-system nil 
      ;w32-pass-rwindow-to-system nil 
      w32-pass-apps-to-system nil 
      ;w32-lwindow-modifier 'super ;; Left Windows key 
      ;w32-rwindow-modifier 'super ;; Right Windows key 
      w32-apps-modifier 'hyper) ;; Menu key


(global-set-key [f1] 'goto-line)
(global-set-key [(shift f1)] 'open-before-line)
(global-set-key [f2] 'comment-region)
(global-set-key [(shift f2)] 'uncomment-region)
(global-set-key [f3] 'shell)
(global-set-key [f4] 'indent-region)
(global-set-key [(shift f4)] 'wrap-all-lines)

(global-set-key [f5] 'initel)
;;(global-set-key [f6] 'edit-log-mode)
(global-set-key [f7] 'eval-buffer)
(global-set-key [(shift f7)] 'eval-region)
(global-set-key [f8] 'turn-on-auto-fill)
(global-set-key [(shift f8)] 'turn-off-auto-fill)

(global-set-key [f9] 'log)
(global-set-key [(shift f9)] 'log-training)
;;(global-set-key [f10] 'log-up)
(global-set-key [f11] 'my-datestamp)
(global-set-key [(shift f11)] 'my-long-date)
(global-set-key [f12] 'ltime)
(global-set-key [(shift f12)] 'ltime-round)

(global-set-key "\C-xw" 'wrap-this-line)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-xt" 'insert-tab)

;; Use home/end to go to beginning/end of file, not line;
;; because ^A/^E are easy to hit but M-<> are not
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

;; copy-and-paste to/from system clipboard <2011-01-29 Sat>
(global-set-key [(shift delete)] 'clipboard-kill-region)
(global-set-key [(control insert)] 'clipboard-kill-ring-save)
(global-set-key [(shift insert)] 'clipboard-yank)
