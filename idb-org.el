;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; ORG/REMEMBER modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'org-install)

(add-to-list 'auto-mode-alist
	     '("\\.org$" . org-mode))

(define-key mode-specific-map [?a] 'org-agenda)

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))))


(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

;;(define-key global-map [(shift f8)] 'remember)
(global-set-key [(control meta ?r)] 'remember)
(global-set-key "\M-R" 'remember)

;; These Org/Remember settings changed from custom-set-variables to setq
;; 2010-01-13
(setq org-agenda-custom-commands
      (quote
       (("d" todo "DELEGATED" nil)
	("c" todo "DONE|DEFERRED|CANCELLED" nil)
	("w" todo "WAITING" nil)
	("W" agenda "" ((org-agenda-ndays 21)))
	("A" agenda "" ((org-agenda-skip-function
			 (lambda nil
			   (org-agenda-skip-entry-if
			    (quote notregexp) "\\=.*\\[#A\\]")))
			(org-agenda-ndays 1)
			(org-agenda-overriding-header "Today's Priority #A tasks: ")))
	("u" alltodo "" ((org-agenda-skip-function
			  (lambda nil
			    (org-agenda-skip-entry-if
			     (quote scheduled)
			     (quote deadline)
			     (quote regexp) "<[^>\n]+>")))
			 (org-agenda-overriding-header "Unscheduled TODO entries: "))))))

(setq org-agenda-files (quote ("~/Dropbox/docs/org/todo.org")))
(setq org-agenda-ndays 7)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-window-setup (quote current-window))
(setq org-deadline-warning-days 14)
(setq org-default-notes-file "~/Dropbox/docs/org/notes.org")
(setq org-directory "~/Dropbox/docs/org/")
(setq org-fast-tag-selection-single-key (quote expert))
(setq org-remember-store-without-prompt t)
(setq org-remember-templates
      (quote
       (("Task" ?t "* TODO %?\n  SCHEDULED: %t\n  %u" "~/Dropbox/docs/org/todo.org" "Tasks")
	("Appointments" ?a "* %?\n %u" "~/Dropbox/docs/org/todo.org" "Appointments")
	("Note" ?n "* %u %?" "~/Dropbox/docs/org/notes.org" "Notes")
	("Finances" ?f "%t %^{Type(DC,PP,Cash,Dep,XF)} | %^{Amount} | %^{Vendor} | %^{Memo}%?" "~/Dropbox/docs/org/bank.org")
;;	("Bookmark" ?k "* %(insert(buffer-file-name (current-buffer)))%!" "~/Dropbox/docs/org/bookmarks.org" "Bookmarks")
;;	("Journal" ?j "* %^{Head Line} %U %^g\n%i%?" "~/Dropbox/docs/org/journal.org")
	("Reading" ?r "* %^{Title} %t%?" "~/Dropbox/docs/org/reading.org" "Reading")
;;	("Email" ?e "* TODO %^{Email} :email:\n  SCHEDULED: %t" "~/Dropbox/docs/org/todo.org" "Email")
;;	("Call" ?c "* TODO %^{Call} :call:\n  SCHEDULED: %t" "~/Dropbox/docs/org/todo.org" "Call")
	("Birthday" ?b "* %^{Name} :birthday:\n  SCHEDULED: %t%? " "~/Dropbox/docs/org/todo.org" "Birthdays")
	("Movies" ?m "* %^{Title} %t%?" "~/Dropbox/docs/org/movies.org" "Movies")
	)))

(setq remember-annotation-functions (quote (org-remember-annotation)))
(setq remember-handler-functions (quote (org-remember-handler)))
