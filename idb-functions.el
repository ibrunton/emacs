;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ian Brunton's emacs environment
;; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Insert a tab, not smart indentation:
(defun insert-tab ()
  (interactive)
  (insert "\t"))

;; Macros to insert date and time
;; Saturday, 24 October, 2009
(defun idate ()
    "Insert date at point."
    (interactive)
    (insert (format-time-string "%A, %d %B, %Y")))
;; 09:34
(defun itime ()
    "Insert time at point."
    (interactive)
    (insert (format-time-string "%H:%M")))
;; 2055
(defun ltime ()
    "Insert time for log (no colon)."
    (interactive)
    (insert (format-time-string "%H%M")))

(defun ltime-round () ;; modified <2010-05-20 Thu>
  "Format time for log (no colon) rounded to nearest 5 minutes."
  (interactive)
  (setq thisminute (string-to-number (format-time-string "%M")))
  (setq rounded-time (cond ((= 0 (% thisminute 5)) (string-to-number (format-time-string "%H%M")))
			   ((= 1 (% thisminute 5)) (fts-by-minutes -1))
			   ((= 2 (% thisminute 5)) (fts-by-minutes -2))
			   ((= 3 (% thisminute 5)) (fts-by-minutes 2))
			   ((= 4 (% thisminute 5)) (fts-by-minutes 1))))
  (if (< rounded-time 1000)
      (concat "0" (number-to-string rounded-time))
    (number-to-string rounded-time)))

(defun insert-ltime-round ()
  "Insert time string from ltime-round()."
  (interactive)
  (insert (ltime-round)))

(defun fts-by-minutes (ftsbm-int) ;; <2010-05-20 Thu>
  "Adjusts minute by integer passed."
;;  (interactive)
  (string-to-number (format-time-string "%H%M"
		      (encode-time 0 (+ (string-to-number (format-time-string "%M")) ftsbm-int)
				   (string-to-number (format-time-string "%H"))
				   (string-to-number (format-time-string "%d"))
				   (string-to-number (format-time-string "%m"))
				   (string-to-number (format-time-string "%Y"))))))

(defun initel ()
  "Open .emacs"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun edit-log-mode ()
  "Edit log-mode"
  (interactive)
  (find-file "~/.emacs.d/log-mode.el"))

;; (defun firefox-userchrome ()
;;   "Open the Firefox userChrome.css file for editing"
;;   (interactive)
;;   (find-file "~/appdata/roaming/mozilla/firefox/profiles/xgdw82rr.default/chrome/userChrome.css"))

; simple function to zero-pad single digit integers
(defun double-digit (num)
  (interactive)
  (setq snum (number-to-string num))
  (concat (if (< num 10)
	      "0"
	    "") snum))

;; -------------------------------------------------------------------
;; Functions from SteveAckermann's .emacs
;; http://www.dotemacs.de/dotfiles/SteveAckermann.emacs.html
;; -------------------------------------------------------------------
;; Convert DOS cr-lf to UNIX newline
(defun dos2unix () (interactive) (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;;Convert UNIX newline to DOS cr-lf
(defun unix2dos () (interactive) (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

;;run the current perl program
(defun run-perl ()
  (interactive "*")
  (setq perl-buffer-name buffer-file-name)
  (shell)
  (setq perl-run-command "perl ")
  (insert perl-run-command)
  (insert perl-buffer-name))

;;debug the current perl program
(defun debug-perl ()
  (interactive "*")
  (setq perl-buffer-name buffer-file-name)
  (shell)
  (setq perl-run-command "perl -d ")
  (insert perl-run-command)
  (insert perl-buffer-name))

;;Add perl print template
(defun insert-perl-print ()
  "Add perl print template"
  (interactive "*")
  (setq steve-var "print \"\\n\";")
  (insert steve-var))

;;Add perl die template
(defun insert-perl-die ()
  "Add perl die template"
  (interactive "*")
  (setq steve-var "or die \" : $!\";")
  (insert steve-var))

(defun wrap-all-lines ()
  "Enable line wrapping"
  (interactive)
  (set-default 'truncate-lines nil))

;; Functions mainly for finding commonly used files and inserting dates.
;; by Ian Brunton 2010-01-13

(defun my-functions () ;; 2010-03-18 Thu -- for opening THIS FILE
  "Open my custom fuctions definition file."
  (interactive)
  (find-file "~/.emacs.d/idb-functions.el"))

(defun my-reading-log ()
  "Open the reading record file"
  (interactive)
  (find-file "~/Dropbox/docs/org/reading.org"))

(defun my-clear-reading-log () ;;<2010-06-09 Wed>
  "Backs up and then clears the reading record file."
  (interactive)
  (rename-file "~/Dropbox/docs/org/reading.org"
	       (concat "~/docs/org/reading-"
		       (format-time-string "%Y-%m-%d")
		       ".org"))
  (my-reading-log)
  (erase-buffer)
  (save-buffer))

(defun my-reading-list () ;;<2010-06-08 Tue>
  "Open the list of books I have yet to read."
  (interactive)
  (find-file "~/docs/reading_list.txt"))

(defun my-long-date ()
  "Insert the date in format Weekday, DD Month, YYYY"
  (interactive)
  (insert (format-time-string "%A, %d %B, %Y")))

(defun my-datestamp ()
  "Insert the date in format <YYYY-MM-DD Wkd>"
  (interactive)
  (insert (concat "<" (format-time-string "%Y-%m-%d %a") ">")))

(defun my-journal ()
  "Open journal file"
  (interactive)
  (find-file (concat "~/docs/org/"
		     (format-time-string "%Y")
		     "/journal.org")))

(defun my-firefox-userchrome ()
  "Open the Firefox userChrome.css file for editing"
  (interactive)
  (find-file "~/.mozilla/firefox/j894kerk.default/chrome/userChrome.css"))

(defun my-firefox-usercontent ()
  "Open the Firefox userContent.css file for editing"
  (interactive)
  (find-file "~/.mozilla/firefox/j894kerk.default/chrome/userContent.css"))

(defun open-before-line (obl-line)
  "Open a line before a given line."
  (interactive "nOpen before line: ")
  (goto-line obl-line)
  (open-line 1))

(defun my-training-file ()
  (interactive)
  (find-file "~/docs/training/training.org"))

(defun my-homepage ()
  (interactive)
  (find-file "~/docs/web/home/index.htm"))

(defun my-rule ()
  (interactive)
  (insert ";; ")
  (insert-char ?- 67)
  (insert "\n"))

(defun my-heading () ;; 2010-01-30 Sat
  (interactive)
  (my-rule)
  (insert ";; \n")
  (backward-char 1)
  (setq start (point))
  (forward-char 1)
  (my-rule)
  (insert "\n")
  (goto-char start))

(defun edit-snippet (which-snippet) ;; 2010-01-31 Sun
  (interactive "sSnippet: ")
  (find-file (concat "~/.emacs.d/vendor/yasnippet-0.6.1c/snippets/log-mode/"
		     which-snippet))
  (dym))

(defun my-todo (mt-task-str) ;; <2010-05-21 Fri>
  (interactive "sTask: ")
  (append-to-file (concat "* " mt-task-str "\n") nil "~/docs/todo.txt"))

(defun my-todo-list ()
  (interactive)
  (find-file "~/docs/todo.txt"))

(defun dym () ;;<2010-06-05 Sat>
  "For disabling YASnippet minor mode. Chiefly so I can remove final newlines,
until I figure out how to prevent it from requiring them in the first place."
  (interactive)
  (yas/minor-mode-off)
  (setq require-final-newline nil))

;; (defun send-email () ;;<2010-06-30 Wed>
;;   "Calls up Thunderbird compose window."
;;   (interactive)
;;   (shell-command "\"c:\\Program Files\\Mozilla Thunderbird\\thunderbird.exe\" -compose"))

;; (defun edit-pov-mode () ;;<2010-07-07 Wed>
;;   (interactive)
;;   (find-file "~/.emacs.d/pov-mode-3.2/pov-mode.el"))

;; <2011-02-26 Sat>
(defun prewrap-region (min max)
  "Wrap the region in an HTML <pre></pre> tag."
  (interactive "r")
  (goto-char min)
  (insert "<pre>")
  (goto-char (+ max 6))
  (insert "</pre>"))

(defun sig () ;; <2011-02-27 Sun>
  (interactive)
  (find-file "~/.signature"))

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; <2011-04-17 Sun>
(defun writing-buffer ()
  (interactive)
  (switch-to-buffer (get-buffer-create "new"))
  (insert "-*- mode: org; mode: auto-fill; -*-\n\n")
  (org-mode)
  (auto-fill-mode))

;;<2011-08-09 Tue>
(defun notes-buffer ()
  (interactive)
  (switch-to-buffer (get-buffer-create "new"))
  (insert "-*- mode: auto-fill; -*-\n\n\n\n")
  (insert "page\t")
  (insert-char ?- 62)
  (insert "\n")
  (auto-fill-mode)
  (previous-line 3))

;;<2011-08-27 Sat>
(defun transbg ()
  (interactive)
  (set-face-attribute 'default nil :background "unspecified-bg"))

;;<2011-09-18 Sun>
(defun minutes ()
  (interactive)
  (find-file (concat "~/Dropbox/DevDigLit/Sept-2011/meeting_minutes/"
					 (format-time-string "%Y-%m-%d")
					 ".txt"))
  (insert "-*- mode: auto-fill; -*-\n\n")
  (insert "Developing Digital Literacy\n")
  (insert (format-time-string "%A, %d %B, %Y"))
  (insert "\nAttendance: ")
  (auto-fill-mode))
