(defpackage :cl-autowrap.asdf
  (:use #:cl #:asdf))

(in-package :cl-autowrap.asdf)

(eval-when (:execute :compile-toplevel :load-toplevel)
  (proclaim '(optimize (debug 3) (safety 3) (space 0) (speed 0))))

(defsystem :cl-autowrap
  :description "Import c2ffi specs and generate CFFI wrappers"
  :author "Ryan Pavlik"
  :license "BSD-2-Clause"
  :version "1.0"

  :depends-on (:alexandria :cffi :cl-json :cl-ppcre :defpackage-plus
               :uiop :trivial-features)
  :pathname "autowrap"
  :serial t

  :components
  ((:file "package")
   (:file "util")
   (:file "conditions")
   (:file "c2ffi")
   (:file "wrapper")
   (:file "sffi")
   (:file "alloc")
   (:file "errno")
   (:file "parse")
   (:file "bitmask")))

(defsystem :cl-autowrap/libffi
  :description "Optional libffi extension for call-by-value"
  :author "Ryan Pavlik"
  :license "BSD-2-Clause"
  :version "1.0"

  :depends-on (:cl-autowrap :cl-plus-c)
  :pathname "autowrap-libffi"
  :serial t

  :components
  ((:module #:autowrap-spec
    :pathname "spec"
    :components
    ((:static-file "libffi.h")))
   (:file "library")
   (:file "autowrap")
   (:file "package")
   (:file "types")
   (:file "libffi")))
