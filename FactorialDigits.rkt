#lang racket
; Factorial Digit Sum (pe#20)

(define (sum-fact-digits x)
  (for/sum
    (( c (string->list 
      (number->string 
        (for/product ((z (in-range 1 (add1 x)))) z)))))
    (- (char->integer c) 48)))

(define (main)
  (display "Sum of digits of 100! is: ")
  (displayln (sum-fact-digits 100)))

(time (main))

