#lang racket
; Largest palindrome product for 3digit * 3digit (pe#4)
(require racket/trace)

; Can't have values more than 3 digits
(define MAXIMUM 1000)
(define MINIMUM  100)

; This will take a long time, loooooooong time...
(define (build-list low high)
  (for*/list ((i (in-range low high))
              (j (in-range low high)))
             (* i j)))

; Racket doesn't have it's own string reverse - why????????
; of course they can't wrap (l->s (reverse (s->l x)))
; String -> String
(define (string-reverse st)
    (list->string (reverse (string->list st))))

; Number -> Boolean
(define (palindrome? x)
    (let* ((strnum (number->string x))
           (lngth (string-length strnum))
           (middle (floor (/ lngth 2))))
         (string=?
            (substring strnum 0 middle)
            (string-reverse 
              (substring strnum 
                         (if (odd? lngth) (add1 middle) middle)
                         lngth))))) 

; Test method (not used but hey)
(define (test-palindrome s)
    (printf "Is '~a' a palindrome? " s)
    (displayln (if (palindrome? s) "Yes!" "No!")))

(define (main)
  (display "Largest 3digit*3digit palindrome is ")
  (displayln (apply max (filter palindrome? (build-list MINIMUM MAXIMUM)))))

(time (main))
