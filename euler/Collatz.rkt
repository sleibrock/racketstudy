#lang racket
; Collatz conjecture - find longest chain under 1M (pe#14)
; n -> n/2 (n is even)
; n -> 3n + 1 (n is odd)

(define MINIMUM 1)
(define MAXIMUM 1000000)

; Instead of recursion, write an iterative Collatz function
(define (collatz n c)
  (if (>= 1 n)
    c
    (collatz
      (if (even? n) (/ n 2) (+ 1 (* 3 n)))
      (add1 c))))

; Find the largest chain
; highest-pair is (x f(x)), first -> x, second -> f(x) 
(define (largest-chain start highest-pair)
  (if (> start MAXIMUM)
    (car highest-pair)
    (let ((comp (collatz start 1)))
      (largest-chain 
        (add1 start)
        (if (> comp (second highest-pair)) 
          (list start comp) 
          highest-pair)))))

(define (main)
  (printf "Iterations for 13: ~a\n" (collatz 13 1))
  (display "Largest chain under 1M: ")
  (displayln (largest-chain MINIMUM '(0 0))))

(time (main))
