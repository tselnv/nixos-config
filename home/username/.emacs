(setq inhibit-startup-screen t) ;; turn off start screen
(tool-bar-mode 0)
(setq frame-resize-pixelwise t) ;; to avoid blank space at screen edge

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes '(misterioso))
 '(package-selected-packages
   '(racket-mode proof-general attrap use-package dante lsp-haskell lsp-mode lsp-ui)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; for navigation
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


(set-frame-font "Monospace 12")



(require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



(toggle-frame-maximized)

;; (desktop-save-mode 1)			




;; Coq symbols

(global-prettify-symbols-mode 1)

(setq coq-symbols-list '(lambda ()
        (mapc (lambda (pair) (push pair prettify-symbols-alist))
            '(("forall". ?∀)
              ("exists". ?∃)
              ("~" . ?¬)
              ("/\\" . ?⋀)
              ("\\/" . ?⋁)
              ("=>". ?⇒)
              ("->". ?→)
              ("<-" . ?←)
              ("<->" . ?↔)
              ("nat" . ?ℕ)
              ("*" . ?×)))))

;; Prettify Coq script editor

(add-hook 'coq-mode-hook coq-symbols-list)

;; Prettify Coq output in proofs
(add-hook 'coq-goals-mode-hook coq-symbols-list)


;; (global-set-key [f2] "∀")
;; (global-set-key [f3] "∃")
;; (global-set-key [f4] "⇒")


;; it doesn't work
;; (add-hook 'racket-mode-hook coq-symbols-list)
;; (add-hook 'racket-mode-hook #'racket-unicode-input-method-enable)
