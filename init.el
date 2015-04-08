(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

; package repositories
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

; install el-get if not installed
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; TODO: refresh local el-get index of packages every once in a while
;(el-get-emacswiki-refresh el-get-recipe-path-emacswiki)
;(el-get-elpa-build-local-recipes)

; load custom recipes
(add-to-list 'el-get-recipe-path    "~/.emacs.d/recipes")

; list of recipes, packages, and libraries to install/load
(setq recipes '(cider
		paredit
    projectile
    fiplr
    js2-mode
    ac-js2
    ;company-mode
    ))

; initilize package.el
(package-initialize)

; download and initialize recipes/packages/libraries
(el-get 'sync recipes)

;; always show line numbers
(global-linum-mode t)

;; turn on projectile
(projectile-global-mode)

;; soft tabs
(setq-default indent-tabs-mode nil)

;; javascript tab-width
(setq js-indent-level 2)

;; set Clojure extensions
(setq auto-mode-alist (cons '("\\.edn$" . clojure-mode) auto-mode-alist))  ; *.edn are Clojure files
(setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist)) ; *.cljs are Clojure files

;; append to exec-path so we can find lein when launched from Apple's Spotlight
(setq exec-path (append exec-path '("/usr/local/bin")))

;; make aquamacs stop asking if you want to save options that were changed by this file
;;(custom-set-variables '(aquamacs-save-options-on-quit nil))
(setq aquamacs-save-options-on-quit nil)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;(setq debug-on-error t)
