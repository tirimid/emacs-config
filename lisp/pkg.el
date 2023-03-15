(defun setup-packages ()
  (setq my-config-pkg-list '(rust-mode go-mode))
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
	(package-refresh-contents))
  (dolist (pkg my-config-pkg-list)
	(unless (package-installed-p pkg)
	  (package-install pkg))))
