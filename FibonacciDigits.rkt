#lang racket
; Find Fibonacci number with over 1000 digits (pe#25)
(define MAXIMUM 1000)

(define (digit-length number)
  (string-length (number->string number)))

(define (find-fibonacci ind cont)
  (if (<= MAXIMUM (digit-length (car cont)))
    ind
    (find-fibonacci
      (add1 ind)
      (list
        (+ (first cont) (second cont))
        (first cont)))))

(define (main)
  (display "Index of fib with over 1k digits is ")
  (displayln (find-fibonacci 2 '(1 1))))

(time (main))
