#lang racket

(define target 10001)
(define (divisor? x) (λ (k) (not (= 0 (modulo x k)))))
(define (prime? x) (stream-andmap (divisor? x) (in-range 2 x)))

(define (get-prime n)
  (define (inner n acc lastp counter)
    (if (<= n counter)
        lastp
        (if (prime? acc)
            (inner n (+ 2 acc) acc (add1 counter))
            (inner n (+ 2 acc) lastp counter))))
  (inner n 3 0 1))

(displayln (format "The 10001th prime is ~a" (get-prime target)))


