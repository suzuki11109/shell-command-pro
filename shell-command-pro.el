;;; shell-command-pro.el --- A collection of useful shell & compile commands -*- lexical-binding: t; -*-

;; Author: Aki Suzuki <suzuki11109@gmail.com>
;; URL: https://github.com/suzuki11109/shell-command-pro
;; Version: 0.0.1
;; Package-Requires: ((emacs "27.0"))
;; Created: September 1, 2024
;; Modified: September 1, 2024
;; Keywords: convenience, tools, shell-command, async-shell-command, compile

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This package provides a collection of useful shell & compile commands.

;;; Code:

;;;###autoload
(defun async-shell-command-from-history ()
  "Run `async-shell-command' with a choice from its command history."
  (interactive)
  (let* ((command (completing-read
                   (if shell-command-prompt-show-cwd
                       (format-message "Async shell command in `%s': "
                                       (abbreviate-file-name default-directory))
                     "Async shell command: ")
                   shell-command-history nil nil nil 'shell-command-history)))
    (async-shell-command command)))

;;;###autoload
(defun async-shell-command-in-dir (dir &optional command)
  "Run `async-shell-command' in the selected directory."
  (interactive "DAsync shell command in: ")
  (let ((default-directory dir))
    (if command
        (async-shell-command command)
      (call-interactively #'async-shell-command))))

;;;###autoload
(defun compile-from-history ()
  "Run `compile' with a choice from compile history."
  (interactive)
  (let* ((command (completing-read
                   (format-message "Compile command in `%s': " (abbreviate-file-name default-directory))
                   compile-history nil nil nil 'compile-history)))
    (compile command)))

;;;###autoload
(defun compile-in-dir (dir &optional command)
  "Run `compile' in the selected directory."
  (interactive "DCompile in: ")
  (let ((default-directory dir))
    (if command
        (compile command)
      (call-interactively #'compile))))

(provide 'shell-command-pro)
;;; shell-command-pro.el ends here
