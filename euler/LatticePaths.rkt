#lang racket

; Paths in a directed Graph (Lattice Paths #15)
; only able to go down or right in a 20x20 grid
; turns out this is just a Binomial Coefficient problem of counting
; using the formula Path(n) = Sum(Paths(Children(N)))
; but this roughly equates to Binom(N) = (2*N)! / (N!)^2
; This would have been better than brute-force constructing a graph in Racket
(define (fact n)
  (if (= n 0)
      1
      (stream-fold * 1 (in-range 1 (add1 n)))))

(define (binom n)
  (/ (fact (* 2 n)) (expt (fact n) 2)))

(time (displayln (binom 20)))
