;; MIT License

;; Copyright (c) [year] [fullname]

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.


(defun howdoi-insert (query)
  "Runs the 'howdoi' command with the given QUERY and inserts the output into the current buffer."
  (interactive "sCommand: ")
  (let ((output (shell-command-to-string (concat "howdoi " query ))))
    ;; insert output into current buffer
    (insert output)))


(defun howdoi-and-run-the-script-in-shell(query)
  "Runs the 'howdoi' command with the given QUERY and runs the command in the shell."
  (interactive "sCommand: ")
  (let ((output (shell-command-to-string (concat "howdoi " query ))))
    ;; run the command in the shell
    (shell-command output)))


(defun howdoi-and-explain(query)
  "Runs the 'howdoi' command with the given QUERY and opens the first explanation in a explainshell.com"
  (interactive "sCommand: ")
  (let ((output (shell-command-to-string (concat "howdoi " query ))))
    ;; open url in browser
    (browse-url (concat "https://explainshell.com/explain?cmd=" output))
    ))


(defun howdoi-and-run-the-script-in-shell-and-explain(query)
  "Runs the 'howdoi' command with the given QUERY, opens the first explanation in a browser,
   runs the command in the shell, and inserts the output into the current buffer."
  (interactive "sCommand: ")
  (let ((output (shell-command-to-string (concat "howdoi " query ))))
    ;; open url in browser
    (browse-url (concat "https://explainshell.com/explain?cmd=" output))
    (shell-command output)
    ))

(defun howdoi-all (query)
  "Runs the 'howdoi' command with the '-a' flag and the given QUERY, and displays the output in a new buffer
   on the right side of the frame."
  (interactive "sCommand: ")
  (let ((output (shell-command-to-string (concat "howdoi -a " query ))))
    (split-window-right)
    (with-current-buffer (get-buffer-create "*howdoi-all*")
      (erase-buffer)
      (insert output)
      (display-buffer (current-buffer)))))
