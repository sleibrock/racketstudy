#lang racket
; Sum of even-valued Fibonacci's under 4 million (pe#2)

(define maximum 4000000)

; Boring recursive method
(define (fiborec x)
    (cond
        ((= x 0) 0)
        ((= x 1) 1)
        (else (+ (fiborec (sub1 x)) (fiborec (sub1 (sub1 x)))))))

; New super cool method
(define (fibolist high cont)
    (if (empty? cont)
      (fibolist high '(2 1))
      (if (> (car cont) high)
        cont
        (fibolist high
            (cons 
                (+ (car cont) (car (cdr cont)))
                cont)))))

(define (main)
  (display "Sum of all even Fibonaccis under ")
  (displayln maximum)
  (displayln 
    (apply + 
        (filter even? (fibolist maximum '()))))) ; iterative list cons method

(time (main))
