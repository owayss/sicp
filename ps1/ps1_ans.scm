;;; Exercise 1

;;; No error in (fold 1 2)


;;; Exercise 2

;(fact 5)
;Unspecified return value

(define fact
  (lambda (n)
    (if (= n 0)
	(* n (fact (- n 1))))))
;Value: fact

(fact 5)
;Unspecified return value


(define fact
  (lambda (n)
    (if (= n 0)
	1
	(* n (fact (- n 1))))))
;Value: fact

(fact 5)
;Value: 120

(fact 243)
;Value: 57651072073405564859932599378988824389544612769748785289578514753791226660795447787952561780489668440613028916503471522241703645767996810695135226278296742637606115134300787052991319431412379312540230792060250137088708811794424564833107085173464718985508999858791970609491066045711874321516918150905413944789377156315207186998055591451670633898714567745386826936678840548225648089961727875705444538167142818292862812160000000000000000000000000000000000000000000000000000000000


;;; Exercise 3

(define comb
  (lambda (n k)
    (/ (fact n) (* (fact k) (fact (- n k))))))
;Value: comb

(comb 8 7)
;Value: 8

(comb 243 90)
;Value: 193404342391239489855973693417880600543891038618846567058277413638164


;;; Exercise 4

COPYING
-------

This tutorial descends from a long line of Emacs tutorials
starting with the one written by Stuart Cracraft for the original Emacs.

This version of the tutorial, like GNU Emacs, is copyrighted, and
comes with permission to distribute copies on certain conditions:

Copyright (c) 1985 Free Software Foundation

   Permission is granted to anyone to make or distribute verbatim copies
   of this document as received, in any medium, provided that the
   copyright notice and permission notice are preserved,
   and that the distributor grants the recipient permission
   for further redistribution as permitted by this notice.

   Permission is granted to distribute modified versions
   of this document, or of portions of it,
   under the above conditions, provided also that they
   carry prominent notices stating who last altered them.

The conditions for copying Emacs itself are slightly different
but in the same spirit.  Please read the file COPYING and then
do give copies of GNU Emacs to your friends.
Help stamp out software obstructionism ("ownership") by using,
writing, and sharing free software!


;;; Exercise 8
;;; command is `indent-s-expr`


;;; Exercise 11


(define foo1
  (lambda (x)
    (* x x)))
;Value: foo1

((lambda (x)
   (/ (foo1 x) x)) 3)


(define foo2
  (lambda (x y)
    (/ x y)))
;Value: foo2

(foo2 9 3)
;Value: 3


(define foo3
  (lambda (x)
    (lambda (y)
      (/ x y))))
;Value: foo3

((foo3 9) 3)
;Value: 3


(define foo4
  (lambda (x)
    (x 3)))
;Value: foo4

(foo4 (lambda (x) x))
;Value: 3

(define foo5
  (lambda (x)
    (cond ((= x 2)
	   (lambda () x))
	  (else
	   (lambda () (* x 3))))))
;Value: foo5

((foo5 1))
;Value: 3


(define foo6
  (lambda (x)
    (x (lambda (y) (y y)))))
;Value: foo6

((foo6 (lambda (x) (lambda (y) y))) 3)
;Value: 3





