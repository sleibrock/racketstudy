#lang racket
; Find the sum of all multiples of 3 or 5 below 1000 (pe#1)
; Generate a list of all numbers <1000
; Filter all numbers that are multiples of 3 or 5
; Sum them up

; Parameters
(define BEGINNING 1)
(define END 1000)

; Functions necessary
(define (is-multiple x)
  (or (= 0 (modulo x 3)) (= 0 (modulo x 5))))

; Main
(define (main)
  (displayln "Summing all numbers up")
  (displayln (apply + (filter is-multiple (range BEGINNING END)))))

; Run
(time (main))
