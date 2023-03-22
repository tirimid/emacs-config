(defvar theme-package-list '(atom-one-dark-theme))

(defun add-all-theme-directories ()
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/phoenix-dark-pink")
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/replace-colorthemes"))
