#lang racket
; Sum of Digits of a Power Computation (pe#16)
; This one probably isn't even worth writing

(define (calculate base exponent)
  (for/sum ((i (string->list (number->string (expt base exponent)))))
           (- (char->integer i) 48)))

(define (main)
    (display "Sum of digits of 2^1000 is ")
    (displayln (calculate 2 1000))
  )

(time (main))
