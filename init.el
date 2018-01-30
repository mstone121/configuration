;; Package stuff
(package-initialize)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; Save backups elsewhere
(setq backup-directory-alist '(("." . "~/emacs-saves")))

;; whitespace bad
(add-hook 'before-save-hook 'whitespace-cleanup)
