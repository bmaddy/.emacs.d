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
    (eval-print-last-sexp)

    ;; refresh local el-get index of packages
    (el-get-emacswiki-refresh el-get-recipe-path-emacswiki)
    (el-get-elpa-build-local-recipes)))

; load custom recipes
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

; list of recipes, packages, and libraries to install/load
(setq recipes '(cider))

; download and initialize recipes/packages/libraries
(el-get 'sync recipes)

;; set Clojure extensions
(setq auto-mode-alist (cons '("\\.edn$" . clojure-mode) auto-mode-alist))  ; *.edn are Clojure files
(setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist)) ; *.cljs are Clojure files

;(setq debug-on-error t)

;(load-file "~/.emacs.d/clojure-starter-kit-init.el")
;(load-file "~/.emacs.d/clojure-starter-kit.el")

