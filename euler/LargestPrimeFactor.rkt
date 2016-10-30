#lang racket

(define test-number 600851475143)
(define (divisor? x) (λ (k) (not (= 0 (modulo x k)))))
(define (prime? x) (stream-andmap (divisor? x) (in-range 2 x)))

(define (largest-pfactor N)
  (define (inner N div acc)
    (if (div . > . N)
        acc
        (if (and (= 0 (modulo N div)) (prime? div))
            (inner (/ N div) div div)
            (inner N (add1 div) acc))))
  (inner N 2 0))

(displayln (format "Largest factor of ~a is ~a" test-number (largest-pfactor test-number)))
