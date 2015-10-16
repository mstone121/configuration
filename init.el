(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq my:el-get-packages
      '(web-mode
	rainbow-mode
	helm
	yasnippet
	auto-complete	
	))

(el-get 'sync my:el-get-packages)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(setq web-mode-code-indent-offset   4)
(setq web-mode-css-indent-offset    4)
(setq web-mode-markup-indent-offset 4)

(setq web-mode-ac-sources-alist
	  '(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
		("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
		("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

(add-hook 'web-mode-before-auto-complete-hooks
		  '(lambda ()
			 (let ((web-mode-cur-language
					(web-mode-language-at-pos)))
			   (if (string= web-mode-cur-language "php")
				   (yas-activate-extra-mode 'php-mode)
				 (yas-deactivate-extra-mode 'php-mode))
			   (if (string= web-mode-cur-language "css")
				   (setq emmet-use-css-transform t)
				 (setq emmet-use-css-transform nil)))))

;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (format "%s/%s/%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
	  `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
	  `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
	  emacs-tmp-dir)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-width 4)
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
