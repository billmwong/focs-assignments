#lang racket

;;; Student Name: Bill Wong
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from David Abrahams
;;;     and/or using these external resources: Google

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

(define (assq key lst)
  (if (empty? lst)
    #f
    (if (eq? key (first (first lst)))
      (first lst)
      (assq key (rest lst))
    )
  )
)

(define (run-repl)
  (display "welcome to my repl.  type some scheme-ish")
  (newline)
  (repl operator-list))

(define (repl op-list)
  (display "> ")
  (display (calculate (read) op-list))
  (newline)
  (repl op-list))

(define (evaluate key lst)
  (if (empty? lst)
    #f
    (if (eq? key (first (first lst)))
      (second (first lst))
      (evaluate key (rest lst))
    )
  )
)

(define (look-up op lookup-list)
  (second (assq op lookup-list))
)

(define (elem-to-op elem lst)
  (if (list? elem)
    (calculate elem lst)
    (look-up elem lst)
  )
)

(define (my-zip l1 l2)
  (if (or (null? l1) (null? l2))
    l2
    (cons (list (first l1) (first l2)) (my-zip (rest l1) (rest l2)))
  )
)

(define (first-is lst word)
  (if (list? lst)
    (if (eq? (first lst) word)
      #t
      #f
    )
    #f
  )
)

(define (calculate x lst)
  (if (first-is x 'DEFINE)
    (repl (append lst (list (list (second x) (third x)))))
    (if (first-is x 'LAMBDA)
      (list 'CLOSURE (second x) (third x) lst)
      (if (list? x)
        (let ([op (elem-to-op (first x) lst)])
          (if (first-is op 'CLOSURE)
            (calculate (third op) (append (my-zip (second op) (rest x)) (fourth op)))
            (apply op (map (lambda (l) (calculate l lst)) (rest x)))
          )
        )
        (if (symbol? x)
          (look-up x lst)
          x
        )
      )
    )
  )
)

(run-repl)
