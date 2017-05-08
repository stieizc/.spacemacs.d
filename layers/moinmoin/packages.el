;;; packages.el --- moinmoin layer packages file for Spacemacs.
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
;; added to `moinmoin-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `moinmoin/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `moinmoin/pre-init-PACKAGE' and/or
;;   `moinmoin/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst moinmoin-packages
  '((moinmoin-mode :location local)))

(defun moinmoin/init-moinmoin-mode ()
  (load moinmoin-mode-path))
;;; packages.el ends here
