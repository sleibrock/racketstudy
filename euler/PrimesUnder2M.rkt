#lang racket

; Sum of primes under 2M
; When checking primes, only check divisors up to sqrt(N)
(define ulimit 2000000)
(define plimit (compose add1 exact->inexact truncate ceiling sqrt))
(define (divisor? x) (λ (k) (not (= 0 (modulo x k)))))
(define (prime? x) (if (eqv? x 1) #f (stream-andmap (divisor? x) (in-range 2 (plimit x)))))
(displayln
 (format
  "Sum of primes under 2M is ~a"
  (stream-fold + 2 (stream-filter prime? (in-range 3 ulimit 2)))))
