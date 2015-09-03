#lang racket
; First triangle number with 500 divisors (pe#12)
; Triangle x = sum [1 .. x]

; Find all factors of x
; Calculates numbers from 1..sqrt(x)
; Why? because sqrt(x)*sqrt(x) = x
(define (find-factors x acc cont)
    (if (= acc (add1 (floor (sqrt x))))
      cont
      (find-factors x (add1 acc)
        (if (= 0 (modulo x acc))
          (append (list acc (floor (/ x acc))) cont)
          cont))))

; Function to loop until we find a number with 500 or more divisors
(define (find-highest n sum)
  (let* ((nsum (+ sum n))
        (fact (find-factors nsum 1 '())))
    (if (<= 500 (length fact))
      nsum
      (find-highest (add1 n) nsum))))

(define (main)
  (display "Triangle num with 500 divisors:: ")
  (displayln (find-highest 1 0)))

(time (main))
