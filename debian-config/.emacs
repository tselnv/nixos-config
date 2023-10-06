(setq inhibit-startup-screen t) ;; turn off start screen
(tool-bar-mode 0)
(setq frame-resize-pixelwise t) ;; to avoid blank space at screen edge

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
;; '(package-selected-packages
;;   (quote
;;    (attrap use-package dante lsp-haskell lsp-mode lsp-ui)))
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (set-frame-font "Ubuntu Mono 16")
(set-frame-font "Noto Sans Mono 13" nil t)


(require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(toggle-frame-maximized)


;; (desktop-save-mode 1)			
(put 'upcase-region 'disabled nil)

;; added by kolay
(setq make-backup-files nil) ; stop creating ~ files
