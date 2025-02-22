#lang info
(define collection "raplotest")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/raplotest.scrbl" ())))
(define pkg-desc " Automatically convert REPL output into unit tests.")
(define version "1.0")
(define pkg-authors '(wevie))
(define license 'GPL-3.0+)
