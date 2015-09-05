#lang racket
; Find the sum of diagonals on a number spiral (pe#28)

(define MAXIMUM (* 1001 1001))

(define (find-diag-sum acc square last-corner)
  (if (>= last-corner MAXIMUM)
    acc
    (let* ((factor (* 2 square))
           (c1 (+ last-corner factor))
           (c2 (+ c1 factor))
           (c3 (+ c2 factor))
           (c4 (+ c3 factor)))
          (find-diag-sum
            (+ acc c1 c2 c3 c4)
            (add1 square)
            c4))))

(define (main)
  (display "Finding the sum of diagonals of a 1001^2 spiral: ")
  (displayln (find-diag-sum 1 1 1)))

(time (main))
