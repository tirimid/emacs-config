(defun setup-emacs-aesthetic-changes ()
  (setq default-frame-alist '((font . "Source Code Pro-9"))
        mouse-wheel-scroll-amount '(1 ((shift) . 1))
        scroll-step 1)
  (setq-default fill-column 80
                display-fill-column-indicator-character ?|)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (global-display-line-numbers-mode)
  (global-display-fill-column-indicator-mode 1))

(defun setup-general-code-style ()
  (setq c-basic-offset 4
        c-default-style "linux")
  (setq-default tab-width 4
                indent-tabs-mode t
                c-backslash-column -1
                c-backslash-max-column -1))
