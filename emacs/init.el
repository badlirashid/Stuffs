;;; init.el --- Badli emacs init configuration

;; Copyright 2021 Badli

;; Author   :  Badli
;; Version  :  0.2
;; Created  :  2021-MAC-03
;; Revision :  2021-MAC-11

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; Badli Emacs init.el configuration file.  Using minimal packages.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,

;; Boston, MA 02110-1301, USA.

;;; Code:

(load-theme 'wombat)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))
(when (fboundp 'tooltip-mode)
  (tooltip-mode -1))
(when (fboundp 'column-number-mode)
  (column-number-mode 1))
(when (fboundp 'line-number-mode)
  (line-number-mode 1))

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq-default
 inhibit-startup-message t
 initial-major-mode 'text-mode
 initial-scratch-message nil
 use-dialog-box nil
 tramp-mode nil
 make-backup-files nil
 version-control nil
 tab-width 2
 indent-tabs-mode nil
 select-enable-clipboard t)

(add-to-list 'load-path' "~/.emacs.d/lisp/dash")
(add-to-list 'load-path' "~/.emacs.d/lisp/diminish")
(add-to-list 'load-path' "~/.emacs.d/lisp/rainbow-delimiters")
(add-to-list 'load-path' "~/.emacs.d/lisp/company-mode")

(require 'package)
(require 'dash)
(require 'company)
(require 'pos-tip)
(require 'company-quickhelp)
(require 'diminish)
(require 'rainbow-delimiters)
(require 'flymake)
(require 'flyspell)
(require 'org)
(require 'org-habit)
(package-initialize)

;;
(fset 'yes-or-no-p 'y-or-n-p)

(ido-mode)
(setq ido-everywhere 1
      ido-enable-flex-matching 1 )

(add-hook 'prog-mode-hook #'linum-mode)

(add-hook 'linum-mode-hook #'electric-pair-local-mode)

(setq show-paren-delay 0)
(add-hook 'electric-pair-mode-hook #'show-paren-mode)

(add-hook 'show-paren-mode-hook #'rainbow-delimiters-mode)

(setq company-minimum-prefix-length 1)
(add-hook 'rainbow-delimiters-mode-hook #'company-mode)

(setq company-quickhelp-delay 1)
(add-hook 'company-mode-hook #'company-quickhelp-mode)

(setq ruby-flymake-use-rubocop-if-available nil)
(setq python-check-command "python")

(add-hook 'company-quickhelp-mode-hook #'flymake-mode)

(add-hook 'flymake-mode-hook #'flyspell-prog-mode)

(add-hook 'text-mode-hook #'flyspell-mode)
(add-hook 'org-mode-hook #'flyspell-mode)

(setq org-agenda-files '("/tmp/test.org"))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(diminish 'eldoc-mode)
(diminish 'company-mode " C")

; keys
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(provide 'init)
;;; init.el ends here
