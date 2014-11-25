;;;; compiler-macro.asd

(asdf:defsystem #:compiler-macro
  :description "Utilities for writing compiler macros."
  :author "Bike <aeshtaer@gmail.com>"
  :license "WTFPL"
  :version "0.1"
  :depends-on (#:introspect-environment)
  :components ((:file "package")
	       (:file "condition" :depends-on ("package"))
	       (:file "type-util" :depends-on ("package"))
	       (:file "misc" :depends-on ("package"))
	       (:file "kinds" :depends-on ("misc" "package"))
	       (:file "infer" :depends-on ("condition" ; for STYLE-WARN
					   "type-util" "package"))
	       (:file "form-type" :depends-on ("misc" "infer"
					       "type-util" "package"))
	       (:file "hint" :depends-on ("condition" "package")))
  ;; cargo culted from bordeaux
  :in-order-to ((asdf:test-op (asdf:load-op compiler-macro-test)))
  :perform (asdf:test-op :after (op c) (asdf:oos 'asdf:test-op :compiler-macro-test)))
