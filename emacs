;;; package --- Summary

;;; Commentary:

;;; Code:

(require 'package)
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/markdown-mode"))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "C-c C-e") #'markdown-do))

(load-theme 'solarized-light-high-contrast t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  )

(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim)
  )

(defun turn-on-python-black () (python-black-on-save-mode 1))
(add-hook 'python-mode-hook 'turn-on-python-black)

(use-package powerline
  :init (powerline-default-theme)
  )

(smartscan-mode 1)


(setq whitespace-line-column 79)
(setq whitespace-style '(spaces tabs newline space-mark tab-mark newline-mark face lines-tail))
(setq whitespace-display-mappings
      '(
	(space mark nil)
	(newline-mark nil) ;(newline-mark 10 [172 10])
	(tab-mark 9 [183 9] [92 9])
	))
(setq whitespace-global-modes '(not org-mode web-mode "Web" emacs-lisp-mode
				    fundamental-mode fundamental-ansi-mode
				    tex-mode))
(global-whitespace-mode)

(define-derived-mode fundamental-ansi-mode fundamental-mode "fundamental ansi"
  "Fundamental mode that understands ANSI colors."
  (require 'ansi-color)
  (ansi-color-apply-on-region (point-min) (point-max)))

(defun match-paren (arg)
  "Go to the matching paren when on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(global-set-key "\M-p" 'match-paren)

(global-auto-revert-mode 1)

(setopt use-short-answers t)

(bind-key "C-c c" 'comment-region)
(bind-key "C-c u" 'uncomment-region)
(bind-key "C-c r" 'revert-buffer-quick)
(bind-key "C-c g" 'goto-line)
(bind-key "C-`" 'next-error)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(markdown-mode python-black flycheck dockerfile-mode yaml-mode solarized-theme))
 '(python-black-extra-args '("--preview" "--unstable" "--verbose" "--line-length=79"))
 '(require-final-newline t)
 '(show-paren-delay 0.05)
 '(show-paren-mode t nil (paren))
 '(show-paren-style 'parenthesis)
 '(show-trailing-whitespace t)
 '(truncate-lines t)
 '(use-short-answers t)
 '(visible-bell t)
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#cdcdcd" :background "#262626")))))

(provide '.emacs)
;;; .emacs ends here
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
