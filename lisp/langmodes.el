(defun setup-lang-mode (mode-name &rest exts)
  (autoload mode-name (format "%s" mode-name) nil t)
  (dolist (ext exts)
    (add-to-list 'auto-mode-alist
				 (cons (format "\\.%s\\'" ext) mode-name))))

(defun setup-all-lang-modes ()
  (add-to-list 'load-path "~/.emacs.d/modes/glsl-mode")
  (add-to-list 'load-path "~/.emacs.d/modes/ld-mode")
  (setup-lang-mode 'go-mode 'go)
  (setup-lang-mode 'rust-mode 'rs)
  (setup-lang-mode 'glsl-mode 'glsl 'vert 'frag)
  (setup-lang-mode 'ld-mode 'ld))
