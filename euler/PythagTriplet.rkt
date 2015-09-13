#lang racket
; a < b < c; a^2 + b^2 = c^2; a + b + c = 1000
; Haskell answer: [(a,b,c) | c <- [1..1000],
;                            b <- [1..c],
;                            a <- [1..b],
;                            a^2 + b^2 == c^2,
;                            a+b+c == 1000] = (200,375,425)

(define (triplet? a b c)
  (and
   (= (+ (expt a 2) (expt b 2)) (expt c 2))
   (= 1000 (+ a b c))))

(define (diff a b)
  (- 1000 (+ a b)))

(define (find-triplet a b start)
  (if (< a 0)
      (find-triplet (sub1 start) 0 (sub1 start))
      (let ((c (diff a b)))
        (if (triplet? a b c)
            (list a b c)
            (find-triplet (sub1 a) (add1 b) start)))))

(define (main)
  (displayln "The triplet solution is: ")
  (displayln (find-triplet 1000 0 1000)))

(time (main))
