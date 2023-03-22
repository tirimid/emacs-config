(defun install-pkg-list (lst)
  (dolist (pkg lst)
	(unless (package-installed-p pkg)
	  (package-install pkg))))

(defun setup-packages ()
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))
  (install-pkg-list theme-package-list)
  (install-pkg-list mode-package-list))
