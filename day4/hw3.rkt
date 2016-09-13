#lang racket

;;; Student Name: Bill Wong
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from David Abrahams, Annabel Consilvio
;;;     and/or using these external resources: Google

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.


(define (assq key lst)
  (if (empty? lst)
    #f
    (if (eq? key (first (first lst)))
      (first lst)
      (assq key (rest lst))
    )
  )
)

(define operator-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)
        (list 'EQ =)
        (list 'NEQ (lambda (x y) (not (= x y))))
        (list 'ANND (lambda (x y) (and x y)))
        (list 'ORR (lambda (x y) (or x y)))
        (list 'NOTT not)))

(assq 'ADD operator-list) ;--> '(ADD #<procedure:+>)
(assq 'ANND operator-list) ;--> '(ANND #<procedure>)
(assq 'FOO operator-list) ;--> #f


;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

; (define (calculate x)
;   (if (number? x)
;     x

;   )
; )


(define (evaluate key lst)
  (if (empty? lst)
    #f
    (if (eq? key (first (first lst)))
      (second (first lst))
      (evaluate key (rest lst))
    )
  )
)

(define (calculate x)
  (if (number? x)
    x
    ((evaluate (first x) operator-list) (second x) (third x))
  )
)

(display "Evaluate:\n")
(evaluate 'ADD operator-list) ;--> '(ADD #<procedure:+>)
(evaluate 'GT operator-list) ;--> '(ANND #<procedure>)
(evaluate 'FOO operator-list) ;--> #f

(calculate '(ADD 5 4)) ; -> 7
(calculate '(MUL 5 4)) ; -> 20
