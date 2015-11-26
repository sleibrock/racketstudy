; Merge Sort in Racket
; Von Neumann Merge Sort imp

; Problems: (length lst) is an O(n) operation

; Merge sort implementation
; if length == 0 or 1 -> return the list because it's "sorted"
; else                -> cut the list up and sort the pieces
(define (msort lst)
  (define len (length lst))
  (if (or (= len 0) (= len 1))
    lst
    (mjoin '() '() '())))

; Merge sort joiner
; If (head a) < (head b)      -> (cons new (cons (head a) '()))
; else if (head b) < (head a) -> (cons new (cons (head b) '()))
; if either list is empty     -> (cons new (cons a b))
(define (mjoin lst left right)
  )
