;;; init.el --- Where the magic begins
;;
;; portions borrowed from Emacs Starter Kit
;;
;; This is first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the same
;; way that the noonday sun does the stars. It is not just bigger and
;; brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; allows syntax highlighting to work
 (global-font-lock-mode 1)
;;; --- start original kal.el

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "/usr/local/scala/misc/scala-tool-support/emacs")
;(require 'scala-mode-auto)

(setq custom-file "~/.emacs.d/kal/custom.el")
(load custom-file 'noerror)

;; go mode
(setq load-path (cons "/usr/local/go/misc/emacs" load-path))
(require 'go-mode-load)

(global-auto-revert-mode t)

;; showoff mode
;;(add-to-list 'load-path "~/.emacs.d/vendor/showoff-mode")
;;(require 'showoff-mode)
;;(add-to-list 'auto-mode-alist '("\\.md$" . showoff-mode))


(load "kal/ecb")
(load "kal/env")
(load "kal/global")
(load "kal/defuns")
(load "kal/bindings")
(load "kal/tabs")
(load "kal/disabled")
(load "kal/fonts")
(load "kal/utf-8")
(load "kal/scratch")
(load "kal/grep")
(load "kal/diff")
(load "kal/ido")
(load "kal/dired")
(load "kal/recentf")
(load "kal/rectangle")
;;(load "kal/org")
(load "kal/zoom")
(load "kal/flymake")
(load "kal/javascript")
(load "kal/ri-emacs")
(load "kal/mac")
(load "kal/server-mode")
(load "kal/shell-mode")
(load "kal/markdown-mode")
(load "kal/private" 'noerror)
;(load 'kal/color-theme)
;(load 'maxframe)
;(load "kal/yasnippet")

;; (load "kal/hl-line")
;; (load "kal/iswitchb")

(vendor 'ruby-mode)
;(vendor 'go-mode)
;(vendor 'rinari)
(load "kal/haml-mode")
(load "kal/sass-mode")
;;(vendor 'textmate)
;;(vendor 'filladapt)
(vendor 'coffee-mode)
(vendor 'htmlize)
;;(vendor 'full-ack      'ack 'ack-same 'ack-find-same-file 'ack-find-file 'ack-interactive)
;;(vendor 'cdargs        'cv 'cdargs)
(vendor 'magit         'magit-status)
;;(vendor 'psvn          'svn-status)
;;(vendor 'js2-mode      'js2-mode)
;(vendor 'markdown-mode 'markdown-mode)
;;(vendor 'textile-mode  'textile-mode)
;;(vendor 'csv-mode      'csv-mode)
(vendor 'yaml-mode     'yaml-mode)
;;(vendor 'inf-ruby      'inf-ruby)
;;(vendor 'rcodetools    'xmp)
;(vendor 'yasnippet)
;;(vendor 'jekyll)
;;(vendor 'lua-mode      'lua-mode)
;;(vendor 'feature-mode)
;;(vendor 'mode-line-bell)
;;(vendor 'revbufs       'revbufs)

;; (vendor 'ruby-electric 'ruby-electric-mode)
;; (vendor 'auctex)

(transient-mark-mode 1) ; makes the region visible
(line-number-mode 1)    ; makes the line number show up
(column-number-mode 1)  ; makes the column number show up

(add-to-list 'load-path   "~/.emacs.d/plugins/yasnippet-0.6.1c")
    (require 'yasnippet) ;; not yasnippet-bundle
    (yas/initialize)
    (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

(add-to-list 'auto-mode-alist '("Guardfile" "Rakefile" . ruby-mode))

(add-hook 'c-mode-common-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

;; cycle through buffers with Ctrl-Tab (like Firefox)
(global-set-key (kbd "<C-tab>") 'bury-buffer)

;;showing trailing whitespace
(add-hook 'makefile-mode-hook
  (lambda()
    (setq show-trailing-whitespace t)))

;;showing line numbers
;;(add-hook 'ruby-mode-hook
;;  (lambda() (linum-mode 1)))

;;(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
;;(global-set-key (kbd "C-<f5>") 'linum-mode)
