(require 'cl-lib)
(require 'package)

(add-to-list 'load-path "~/.emacs.d/lisp")

(load "langmodes.el")
(load "themehack.el")
(load "style.el")
(load "pkg.el")

(defun remove-nuisance ()
  (setq ring-bell-function 'ignore
        create-lockfiles nil
        temporary-file-directory "~/.emacs.d/tmp-files/"
        backup-directory-alist `((".*" . ,temporary-file-directory))
        auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
  (blink-cursor-mode 0))

(setup-packages)
(add-all-theme-directories)
(load-theme 'phoenix-dark-pink t)
(setup-emacs-aesthetic-changes)
(setup-general-code-style)
(remove-nuisance)
(setup-all-lang-modes)
(electric-pair-mode)
