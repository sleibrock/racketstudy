#lang racket
; Area Under a Curve using Calculus and iterative approach
; Riemman Sum = dx * [ f(x) | x = [a..b] ]

; Procedure -> Real -> Real -> Real -> Real -> Real
(define (under-curve fx dx a b acc)
  (if (>= a b)
      (* dx acc)
      (under-curve fx dx (+ a dx) b
                   (+ acc (fx a)))))

(define (square x) (* x x))
(define (ad-square x) (/ (* x x x) 3))

(define (under-curve-ad a b)
  (- (ad-square b) (ad-square a)))

(define (main)
  (display "Iterative: ")
  (displayln (under-curve square 0.1 1 10 0))
  (display "Mathematical: ")
  (displayln (under-curve-ad 1 10)))

