(menu-bar-mode -1) 
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(show-paren-mode 't)
(custom-set-variables
;; -set-variables was added by Custom.
;; you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(inhibit-startup-screen t))

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(setq column-number-mode t)
;; (global-font-lock-mode 1)

(require 'xcscope)
(cscope-setup)
(define-key cscope-list-entry-keymap "O" 'cscope-select-entry-other-window)

(setq-default indent-tabs-mode nil)

;; (add-hook 'after-init-hook 'global-company-mode)

(require 'auto-complete)

(require 'auto-complete-config)
(ac-config-default)
(require 'yasnippet)
(yas-global-mode 1)

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.1.0/include")
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(define-key global-map (kbd "C-c ;") 'iedit-mode)

(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(semantic-mode 1)

(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(global-ede-mode 1)

(ede-cpp-root-project "my project" :file "~/dev/c++/prime_plus/usetv.cpp"
		      :include-path '("/usr/local/include"))
(global-semantic-idle-scheduler-mode 1)

;; (setenv "LD_LIBRARY_PATH" "/Library/Developer/CommandLineTools/usr/lib/")

;; (add-to-list 'load-path (expand-file-name ".emacs.d/elpa/irony-20150810.128"))
;; (require 'irony)

;; (defun my:irony-enable()
;;   (when (member-major-mode irony-known-modes)
;;     (irony-mode 1)))
