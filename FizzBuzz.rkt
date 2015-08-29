#lang racket

; Program parameters
(define BEGINNING 1)
(define END 101)

; FizzBuzzing function
(define (buzz-it x)
  (let ((a (modulo x 3))
        (b (modulo x 5)))
    (displayln 
      (cond
        ((= 0 a b) "FizzBuzz")
        ((= 0 a)   "Fizz")
        ((= 0 b)   "Buzz")
        (else      (number->string x))))))

; Main
(define (main)
  (for-each buzz-it (range BEGINNING END)))

; Run
(main)
