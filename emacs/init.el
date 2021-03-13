;;; init.el --- Badli Emacs init configuration -*- lexical-binding: t -*-

;; Copyright (C) 2021 Badli Rashid

;; Author  :    Badli Rashid
;; Created :    2021-MAC-03
;; URL     :    https://github.com/badlirashid/Stuffs
;; Version :    0.0.6


;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; Badli boring Emacs init.el configuration file.
;; Taken from various sources.

;;; Licenses:

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

;; https://www.gnu.org/licenses/

;;; Code:

;;;; Theme
(load-theme 'wombat)

;;;; Display
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))
(if (fboundp 'tooltip-mode) (tooltip-mode -1))
(if (fboundp 'column-number-mode) (column-number-mode 1))
(if (fboundp 'line-number-mode) (line-number-mode 1))

;;;; Encoding Systems
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;;; Default Options
(setq-default
 inhibit-startup-message t
 initial-major-mode 'text-mode
 initial-scratch-message nil
 use-dialog-box nil
 tramp-mode nil
 fill-column 80
 tab-width 2
 indent-tabs-mode nil
 select-enable-clipboard t)

;;;;; Backup Options
(setq-default
 make-backup-files nil
 version-control nil)

;;;; Paths
(add-to-list 'load-path' "~/.emacs.d/lisp/dash")
(add-to-list 'load-path' "~/.emacs.d/lisp/diminish")
(add-to-list 'load-path' "~/.emacs.d/lisp/company-mode")
(add-to-list 'load-path' "~/.emacs.d/lisp/company-quickhelp")
(add-to-list 'load-path' "~/.emacs.d/lisp/pos-tip")
(add-to-list 'load-path' "~/.emacs.d/lisp/rainbow-delimiters")
(add-to-list 'load-path' "~/.emacs.d/lisp/yaml-mode")
(add-to-list 'load-path' "~/.emacs.d/lisp/inf-ruby")

;;;; Requires
(require 'package)
(require 'dash)
(require 'company)
(require 'pos-tip)
(require 'company-quickhelp)
(require 'flymake)
(require 'flyspell)
(require 'diminish)
(require 'rainbow-delimiters)
(require 'org)
(require 'org-habit)
(require 'yaml-mode)
(require 'inf-ruby)
(package-initialize)

;;;; Begins
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Colors or Colours ?
(setq ispell-program-name "aspell"
      ispell-extra-args '("-l en_GB -a")
      ispell-dictionary "en_GB")

;;;; IDO
(ido-mode)
(setq ido-everywhere 1
      ido-enable-flex-matching 1)

(defun turn-code-feature-on ()
  "Turn on code features."
  (linum-mode 1)
  (electric-pair-local-mode 1)
  (rainbow-delimiters-mode 1)
  (setq show-paren-delay 0)
  (show-paren-mode 1))

(defun turn-code-completion-on ()
  "Enable code completion feature."
  (setq company-minimum-prefix-length 1)
  (company-mode 1)
  (setq company-quickhelp-delay 1)
  (company-quickhelp-mode 1))

(defun turn-code-syntax-check-on ()
  "Code checking for Ruby and Python."
  (setq ruby-flymake-use-rubocop-if-available t)
  (setq python-flymake-command '("flake8" "-"))
  (flymake-mode 1))

;;;; Add our hooks
(add-hook 'prog-mode-hook #'turn-code-feature-on)
(add-hook 'prog-mode-hook #'turn-code-completion-on)
(add-hook 'prog-mode-hook #'turn-code-syntax-check-on)

(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'text-mode-hook #'flyspell-mode)
(add-hook 'org-mode-hook #'flyspell-mode)

;;;; Inf-Ruby
(autoload 'inf-ruby "inf-ruby" "Run Inf-Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(eval-after-load 'inf-ruby
  '(define-key inf-ruby-minor-mode-map
     (kbd "C-c C-s") 'inf-ruby-console-auto))

;;;; YAML
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;;;; ORG
(setq org-agenda-files '("/tmp/test.org"))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;;; Diminish
(diminish 'eldoc-mode)
(diminish 'company-mode " C")

;;;; KEYS
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(provide 'init)
;;; init.el ends here
