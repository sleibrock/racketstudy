#lang racket
; Smallest positive number divisible by all numbers 1..20 (pe#5)

(define div-nums (range 1 21))

(define (divisible x)
    (if (andmap zero? (map (lambda (z) (modulo x z)) div-nums))
      x
      (divisible (add1 x))))

(define (main)
  (display "Smallest divisible number is... ")
  (displayln (divisible 20)))

(time (main))
