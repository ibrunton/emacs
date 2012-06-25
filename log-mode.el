;; log-mode settings

;; Keymap
(defvar log-mode-map nil "Keymap for Log mode")

(unless log-mode-map
  (setq log-mode-map (make-sparse-keymap))
  (define-key log-mode-map (kbd "<f6>") 'edit-log-mode))


;; Faces for log-mode (below)
(make-face 'log-mode-training-face)
(set-face-attribute 'log-mode-training-face nil :foreground "OliveDrab4") ;;"green3")
(make-face 'log-mode-headache-face)
(set-face-attribute 'log-mode-headache-face nil :foreground "black" :weight 'bold)
(set-face-attribute 'log-mode-headache-face nil :background "gold")
(make-face 'log-mode-caffeine-face)
(set-face-attribute 'log-mode-caffeine-face nil :foreground "CornflowerBlue")
(make-face 'log-mode-diet-face)
(set-face-attribute 'log-mode-diet-face nil :foreground "black" :weight 'bold)
(set-face-attribute 'log-mode-diet-face nil :background "firebrick")
(make-face 'log-mode-ddiet-face)
(set-face-attribute 'log-mode-ddiet-face nil :foreground "firebrick")
(make-face 'log-mode-jo-face)
(set-face-attribute 'log-mode-jo-face nil :foreground "DarkOrchid" :weight 'bold)
(make-face 'log-mode-time-face)
(set-face-attribute 'log-mode-time-face nil :foreground "LightSteelBlue")
(make-face 'log-mode-dateline-face)
(set-face-attribute 'log-mode-dateline-face nil :foreground "red" :weight 'bold)
(make-face 'log-mode-bob-face) ; bob = Black On Black
(set-face-attribute 'log-mode-bob-face nil :foreground "gray35")
(make-face 'log-mode-insomnia-face)
(set-face-attribute 'log-mode-insomnia-face nil :foreground "gray55")
(make-face 'log-mode-timestamp-face)
(set-face-attribute 'log-mode-timestamp-face nil :foreground "DarkTurquoise" :underline t)
(make-face 'log-mode-note-face)
(set-face-attribute 'log-mode-note-face nil :foreground "OliveDrab2")

;; For my personal log files: syntax highlighting
(define-generic-mode log-mode
  '(";;") ; comment line
  '(;"Weight" "Breakfast"
    "Nap" "Work" "XXXX" ;"Walk"
    "Itchy Belly Spot" "Itchy Spot"
;;    "greens+" "Coffee" "Tribex"
    "Mike" "Mikey" "Butler"
    ;; Islamic prayers:
    "Fajr" "Dhuhr" "Asr" "Maghrib" "Isha" "Witr" "Qunut" "Tasbih" "Salat"
    "Dhikr"
    "Meditation"
    ;; games
    "AssaultCube" "Half-Life 2" "Portal" "H.A.W.X." "Chrome"
    ;; TV programmes
    "Farscape" "CSI"
) ; keywords
  '(("\\(\\$t\\)\\(.*?\\)\\(\\$\\)" (1 'log-mode-bob-face)
     (2 'log-mode-training-face)
     (3 'log-mode-bob-face))
    ("\\(\\$s\\)\\(.*?\\)\\(\\$\\)" (1 'log-mode-bob-face)
     (2 'log-mode-training-face)
     (3 'log-mode-bob-face))
    ("\\(\\$h\\)\\(.*?\\)\\(\\$\\)" (1 'log-mode-bob-face)
     (2 'log-mode-headache-face)
     (3 'log-mode-bob-face))
    ("^\\(.*?\\)\\(\\$H\\)" (1 'log-mode-headache-face)
     (2 'log-mode-bob-face))
    ("^\\(.*?\\)\\(\\$T\\)" (1 'log-mode-training-face)
     (2 'log-mode-bob-face))
    ("\\(\\$c\\)\\(.*?\\)\\(\\$\\)" (1 'log-mode-bob-face)
     (2 'log-mode-caffeine-face)
     (3 'log-mode-bob-face))
    ("^\\(.*?\\)\\(\\$C\\)" (1 'log-mode-caffeine-face)
     (2 'log-mode-bob-face))
    ("\\(\\$d\\)\\(.*?\\)\\(\\$\\)" (1 'log-mode-bob-face)
     (2 'log-mode-diet-face)
     (3 'log-mode-bob-face))
    ("\\(\\$e\\)\\(.*?\\)\\(\\$\\)" (1 'log-mode-bob-face)
     (2 'log-mode-ddiet-face)
     (3 'log-mode-bob-face))
    ("\\(\\$[xo]\\)\\(.*?\\)\\(\\$\\)" (1 'log-mode-bob-face)
     (2 'log-mode-jo-face)
     (3 'log-mode-bob-face))
    ("^\\(.*?\\)\\(\\$[XO]\\)" (1 'log-mode-jo-face)
     (2 'log-mode-bob-face))
    ("^\\(\\<[[:upper:]]\\w+, [0-9]\\{2\\} \\<[[:upper:]]\\w+, [0-9]\\{4\\}\\)$" (1 'log-mode-dateline-face))
    ("^\\[\\{0,1\\}\\(22[45][0-9]\\|23[0-5][0-9]\\|0[0-5][0-5][0-9]\\).*?$" . 'log-mode-insomnia-face)
    ("<[0-9]\\{4\\}\\-[01][0-9]\\-[0123][0-9] [SMTWF][ouehra][neduit]>" . 'log-mode-timestamp-face)
    ("\\([0-9]\\{4\\}\\)" (1 'log-mode-time-face))
;; Add /italic/, _underline_, *bold*
    ("\\(/[-a-zA-Z0-9 ]+/\\)" (1 'italic))
    ("\\(_[-a-zA-Z0-9/ ]+_\\)" (1 'underline))
    ("\\(\\*[-a-zA-Z0-9/]+\\*\\)" (1 'bold))
    ("\\(> .*\\)" (1 'log-mode-note-face))
    ) ; face regexps
  '("/docs/log/") ; auto-mode
  nil ; functions
  "Log Mode") ; description string

;


;; basic function to open the log file
(defun log (&optional nogotoend)
  "Open today's log file. If opening for the first time, insert the date.
Make directories as needed.
If file is already open in a buffer, switch to that buffer.
If passed &optional nogotoend, do not move point to the end of the file. Otherwise, do."
  (interactive)
  (setq log-dir (concat idb-root-dir "Dropbox/docs/log/"
			 (format-time-string "%Y/%m/")))
  (setq log-file (concat log-dir (format-time-string "%d")))

  ; if buffer already open, go to it:
  (setq log-buffer (find-buffer-visiting log-file))
  (if log-buffer
      (switch-to-buffer log-buffer)
    ; if not, open it:
    (find-file log-file))

  ; if first visit to the file, insert the date:
  (unless (file-exists-p log-file)
      (insert (concat (format-time-string "%A, %d %B, %Y") "\n\n"))
      (make-directory log-dir t)
      (save-buffer))

  ; go to the end of the buffer:
  (unless nogotoend (goto-char (point-max)))

  (if (file-exists-p (concat log-file ".journal"))
      (message "Journal file exists for this date."))

  (if (file-exists-p (concat log-file ".plan"))
      (message "Plan file exists for this date.")))

;; end of _log() -----------------------------------------------------

(defun log-up ()
  "Calls log() and appends the time of rising."
  (interactive)
  (log)
  (insert (concat (format-time-string "%H%M")) ":\tUp.\n"))

;; end of log-up() ---------------------------------------------------

(defun log-insert-time ()
  "Calls log() and inserts current time."
  (interactive)
  (log)
  (insert (format-time-string "%H%M")))
;; end of log-insert-time() ------------------------------------------

(defun log-breakfast () ;; updated 2010-01-12, <2010-03-21 Sun>
  "Inserts the breakfast menu into log() automatically, based on the day of the week."
  (interactive)
  (setq weekday (format-time-string "%u"))
  (setq lb-oj "1/2 c OJ"
	lb-granola "peanuts + currants + dates + sunflower seeds + coconut + chia seed + flax seed + hemp seed + milk"
	lb-cc "1/2 c cc"
	lb-egg "1 egg"
	lb-greens "1/3 scoop greens+"
	lb-protein "1 protein"
	lb-protein-c "1 protein + 1/2 c almond milk + creatine"
	lb-vitamins "1 multivitamin, 1 vitamin D";"1 CLA, 1 multivitamin, 1 vitamin D"
	lb-bcaa "2 BCAA"
	lb-prep "preparing lunch")
  (setq lb-main (concat lb-granola "; " lb-oj "; " lb-cc "; "))
  (log)
  (wrap-insert (concat (cond ((equal weekday "7") ; Sunday
		 (concat "Breakfast: " lb-main "2 eggs; " lb-protein "; " lb-vitamins))
		((equal weekday "1") ; Monday
		 (concat "Breakfast: " lb-main "2 eggs; " lb-vitamins))
		((equal weekday "2") ; Tuesday
		 (concat "Breakfast: " lb-main "1 egg; " lb-protein-c "; " lb-prep "; "
			 lb-vitamins ", " lb-bcaa))
		((equal weekday "3") ; Wednesday
		 (concat "Breakfast: " lb-main "2 eggs; " lb-vitamins))
		((equal weekday "4") ; Thursday
		 (concat "Breakfast: " lb-main "1 egg; " lb-protein-c "; " lb-prep "; "
			 lb-vitamins))
		((equal weekday "5") ; Friday
		 (concat "Breakfast: " lb-main "1 egg; " lb-protein-c "; " lb-prep "; "
			 lb-vitamins ", " lb-bcaa))
		((equal weekday "6") ; Saturday
		 (concat "Breakfast: " lb-main "2 eggs; " lb-vitamins)))
	       " to " (format-time-string "%H%M") ".\n")))


(defun wrap-insert (str)
  (interactive)
  (setq start (point))
  (insert str)
  (goto-char start)
  (setq wrap-length 60) ;; will wrap /after/ this many chars
  (forward-char 8) ; tab length
  (while (progn (forward-char wrap-length)
		(not (looking-at "\n")))
    (while (progn (forward-char 1)
		  (not (looking-at " "))))
    (delete-char 1) ;; delete the space
    (insert "\n\t")))

(defun wrap-this-line ()
  "Wrap the current line, indenting after the first wrap."
  (interactive)
  (beginning-of-line)
  (setq wrap-beginner "\n\t")
  (if (looking-at ";")
      (setq wrap-beginner "\n;;\t"))
  (setq wrap-length 60)
  (forward-char 8)
  (while (progn (forward-char wrap-length)
		(not (eolp)))
    (while (progn (forward-char 1)
		  (not (looking-at " "))))
    (delete-char 1)
    (insert wrap-beginner)))

(defun log-training ()
  "Open today's training log file. If file does not exist, insert snippet to expand."
  (interactive)
  (setq training-dir (concat idb-root-dir "Dropbox/docs/log/"
		     (format-time-string "%Y/%m/")))
  (setq training-file (concat training-dir
			      (format-time-string "%d")
			      ".training"))
  (find-file training-file)
  (unless (file-exists-p training-file)
      (insert (concat (format-time-string "%A, %d %B, %Y") "\n\ntraining"))
      (append-to-file ";;\t.TRAINING file created\n"
		      nil (concat idb-root-dir "Dropbox/docs/log/"
				  (format-time-string "%Y/%m/%d")))

      (make-directory training-dir t)))

(defun log-last-week () ;; 2010-02-01 Mon
  "Open log file from 1 week ago today."
  (interactive)
  (find-file (concat idb-root-dir "Dropbox/docs/log/" (log-backward-x-days 7))))

(defun log-training-last-week () ;; 2010-02-01 Mon
  "Open training log file from 1 week ago today."
  (interactive)
  (find-file (concat idb-root-dir "Dropbox/docs/log/" (log-backward-x-days 7) ".training")))

(defun log-yest ()
  "Open yesterday's log file."
  (interactive)
  (find-file (concat idb-root-dir "Dropbox/docs/log/" (log-backward-x-days 1))))

(defun log-backward-x-days (lbxd-int);; 2010-03-17 Wed
  "Return x days backward from today."
;;  (interactive)
  (format-time-string "%Y/%m/%d"
		      (encode-time 0 0 0
				   (- (string-to-number (format-time-string "%d")) lbxd-int)
				   (string-to-number (format-time-string "%m"))
				   (string-to-number (format-time-string "%Y")))))

;; functions for planning and inserting:
(defun log-insert-plan (&optional noclear)
  (interactive)
  (log)
  (setq plan-file (concat idb-root-dir "Dropbox/docs/log/" (format-time-string "%Y/%m/%d")
			  ".plan"))
  (insert-file-contents plan-file)
  (unless noclear (log-clear-plan)))

(defun log-clear-plan ()
  (interactive)
  (setq plan-file (concat idb-root-dir"Dropbox/docs/log/" (format-time-string "%Y/%m/%d")
			  ".plan"))
  (delete-file plan-file))

(defun log-set-plan ()
 (interactive)
 (setq plan-file (concat idb-root-dir "Dropbox/docs/log/"
			 ;; FIXME: change this to like what log-last-week uses
			 ;; so it will work across month boundaries:
			 (format-time-string "%Y/%m/")
			 (double-digit (+ 1 (string-to-number
					     (format-time-string "%d"))))
			 ".plan"))
 (find-file plan-file))

;; same, for workouts (today, not tomorrow)
(defun log-set-workout-plan ()
 (interactive)
 (setq lw-plan-file (concat idb-root-dir "Dropbox/docs/log/" (format-time-string "%Y/%m/%d")
			     ".workout-plan"))
 (find-file lw-plan-file))

(defun log-insert-workout-plan ()
  (interactive)
  (log)
  (setq lw-plan-file (concat idb-root-dir "Dropbox/docs/log/" (format-time-string "%Y/%m/%d")
			     ".workout-plan"))
  (insert-file-contents lw-plan-file)
  (log-clear-workout-plan))

(defun log-clear-workout-plan ()
  (interactive)
  (setq lw-plan-file (concat idb-root-dir "Dropbox/docs/log/" (format-time-string "%Y/%m/%d")
			     ".workout-plan"))
  (delete-file lw-plan-file))

;; log plan functions using YASnippet --------------------------------
;; (defun log-set-workout-plan ()
;;   (interactive)
;;   (find-file idb-root-dir "elisp/yasnippet-0.6.1c/snippets/text-mode/log-mode/workout"))

;; (defun log-set-plan ()
;;   (interactive)
;;   (find-file idb-root-dir "elisp/yasnippet-0.6.1c/snippets/text-mode/log-mode/plan"))

(defun log-weight (lw-w)
  "Adds weight measurement to log file, and appends date and weight to weight file."
  (interactive "sWeight: ")
  (log)
  (insert (concat "Weight:\t" lw-w "\n"))
  (save-buffer) ;; log buffer
  (setq weight-file (concat idb-root-dir "Dropbox/docs/log/"
			    (format-time-string "%Y/%m")
			    "/weight"))
  (append-to-file (concat (format-time-string "%Y-%m-%d")
			  "\t" lw-w "\n") nil weight-file))
  ;; (find-file weight-file)
  ;; (goto-char (point-max))
  ;; (insert (concat (format-time-string "%Y-%m-%d")
  ;; 		  "\t" lw-w "\n"))
  ;; (save-buffer)) ;; weight file

(defun log-journal () ;; 2010-02-28 Sun
  "Creates a file for longer journal entries alongside log file."
  (interactive)
  (setq log-journal-file (concat idb-root-dir "Dropbox/docs/log/"
				 (format-time-string "%Y/%m/%d")
				 ".journal"))
  (find-file log-journal-file)
  (goto-char (point-max))
  (unless (file-exists-p log-journal-file)
    (append-to-file ";;\t.JOURNAL file created\n"
		    nil (concat idb-root-dir "Dropbox/docs/log/"
				(format-time-string "%Y/%m/%d")))
    (insert (format-time-string "%A, %d %B, %Y")))
  (insert (concat "\n\n;;\t"
		  ;;(format-time-string "%H%M")
		  (ltime-round)
		  "\t------------------------------------------------------\n\n"))
  (auto-fill-mode))

(defun log-show-month () ;;<2010-03-24 Wed>
  "Outputs a whole month's logs in a new buffer."
  (interactive)
  (setq month-path (concat idb-root-dir "Dropbox/docs/log/"
			   (log-show-month-get-month)))
  (cd month-path)
  (switch-to-buffer (generate-new-buffer (concat "Month-" (format-time-string "%Y-%m"))))
  (log-mode)
  (dolist (thisfile (directory-files month-path nil "^[0123][0-9]$"))
    (goto-char (point-max))
    (insert-file-contents thisfile)
    (goto-char (point-max))
    (insert "\n\n")
    (goto-char (point-max)))
  (toggle-read-only t))

(defun log-show-month-journal () ;;<2010-04-17 Sat>
  "Outputs a whole month's JOURNAL logs in a new buffer."
  (interactive)
  (setq month-path (concat idb-root-dir "Dropbox/docs/log/"
			   (log-show-month-get-month)))
  (cd month-path)
  (switch-to-buffer (generate-new-buffer (concat "Month-" (format-time-string "%Y-%m"))))
  (log-mode)
  (dolist (thisfile (directory-files month-path nil "^[0123][0-9]\\.journal$"))
    (goto-char (point-max))
    (insert-file-contents thisfile)
    (goto-char (point-max))
    (insert "\n\n")
    (goto-char (point-max)))
  (toggle-read-only t))

(defun log-show-month-training () ;;<2010-04-17 Sat>
  "Outputs a whole month's TRAINING logs in a new buffer."
  (interactive)
  (setq month-path (concat idb-root-dir "Dropbox/docs/log/"
			   (log-show-month-get-month)))
  (cd month-path)
  (switch-to-buffer (generate-new-buffer (concat "Month-" (format-time-string "%Y-%m"))))
  (log-mode)
  (dolist (thisfile (directory-files month-path nil "^[0123][0-9]\\.training$"))
    (goto-char (point-max))
    (insert-file-contents thisfile)
    (goto-char (point-max))
    (insert "\n\n")
    (goto-char (point-max)))
  (toggle-read-only t))


(defun log-show-month-get-month ()
  "Gets year and month for log-show-month()."
  (interactive)
  (setq lsmgm-y (read-string "Year: " nil nil (format-time-string "%Y") nil))
  (setq lsmgm-m (read-string "Month: " nil nil (format-time-string "%m") nil))
  (concat lsmgm-y "/" lsmgm-m))


;; end of log commands -----------------------------------------------

;; key bindings ------------------------------------------------------
;(define-key log-mode-map (kbd "<f6>") 'edit-log-mode)

(provide 'log-mode)
