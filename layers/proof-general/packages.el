;;; packages.el --- proof-general layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <wenxin@archie>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `proof-general-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `proof-general/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `proof-general/pre-init-PACKAGE' and/or
;;   `proof-general/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst proof-general-packages
  '(
    company-coq
    (proof-general :location local)))

(defun proof-general/init-company-coq ()
  (use-package company-coq
    :defer t
    :config
    (add-hook 'coq-mode-hook #'company-coq-initialize)))

(defun proof-general/init-proof-general ()
  "Initialize Proof General."
  ;; Setup from Proof General README, using a path from the configuration. Proof General
  ;; lazily loads from proof-site, so there's no need to use-package it.
  (load proof-general-path)
  (spacemacs/set-leader-keys-for-major-mode 'coq-mode
    "]" 'proof-assert-next-command-interactive
    "[" 'proof-undo-last-successful-command
    "." 'proof-goto-point))
;;; packages.el ends here
