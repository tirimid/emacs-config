(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-relative (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-according-to-mode (around smart-tabs activate)
  (let ((indent-tabs-mode indent-tabs-mode))
    (if (memq indent-line-function
              '(indent-relative
                indent-relative-maybe))
        (setq indent-tabs-mode nil))
    ad-do-it))

(defmacro smart-tabs-advice (function offset)
  `(progn
     (defvaralias ',offset 'tab-width)
     (defadvice ,function (around smart-tabs activate)
       (cond
        (indent-tabs-mode
         (save-excursion
           (beginning-of-line)
           (while (looking-at "\t*\\( +\\)\t+")
             (replace-match "" nil nil nil 1)))
         (setq tab-width tab-width)
         (let ((tab-width fill-column)
               (,offset fill-column)
               (wstart (window-start)))
           (unwind-protect
               (progn ad-do-it)
             (set-window-start (selected-window) wstart))))
        (t ad-do-it)))))

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
                c-backslash-max-column -1)
  (smart-tabs-advice c-indent-line c-basic-offset)
  (smart-tabs-advice c-indent-region c-basic-offset)
  (add-hook 'c-mode-common-hook
			(lambda ()
			  (c-set-offset 'inextern-lang 0))))
