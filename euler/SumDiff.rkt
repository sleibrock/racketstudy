#lang racket
; Difference between sum of squares and square of sum (pe#6)

(define (sumdiff n)
    (-
        (expt (for/sum ((i (range 1 (add1 n)))) i) 2)
        (for/sum ((i (range 1 (add1 n)))) (expt i 2))))

(define (main)
  (printf "The diff(100) is ~a\n" (sumdiff 100)))

(time (main))
