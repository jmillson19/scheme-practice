;;@author Jason Millson
;;Date: 2/19/19
;;Function to take the intersecction, union, and difference of two sets
(define (setOps L1 L2) 
  ;; define helper functions here
  ;;Function to remove duplicates from list
  ;;this is helpful for the union function
  (define (removeDupes xs)
  (cond ((null? xs)'())
        ((elementOf (car xs) (cdr xs)) (removeDupes (cdr xs)))
        (else (cons (car xs) (removeDupes (cdr xs))))))
  ;;Function to check whether an item is an element of a list
  ;;For some reason my "contains" wasn't working as hoped, so
  ;;I made up this simple function
  (define (elementOf x xs)
    [cond ((null? xs) #f)
          ((equal? x (car xs)) #t)
          (else (elementOf x (cdr xs)))
          ]
    )

  (define (intersect xs ys)
    [cond ((null? xs) '()) ;;empty list
          ((elementOf (car xs) ys) (cons (car xs) (intersect (cdr xs) ys))) ;;if element of both, add to list
          (else (intersect (cdr xs) ys)) ;;not element of both, continue w/out appending
          ]
    )
  ;;Uses the removeDupes function to prevent duplicate elements in the set
  (define (union xs ys)
  [cond ((null? xs) (removeDupes ys)) ;;if xs is empty, then just give the rest of ys (w/out dupes)
        ((elementOf (car xs) ys) (removeDupes(cons (car xs) (union (cdr xs) ys)))) ;;build list if its an element of both, include it, remove dupes
        (else (cons (car xs) (union (cdr xs) ys))) ;;not an element of both, so just add it and continue
        ]
  )
  (define (difference xs ys)
    [cond ((null? xs) '()) ;;base case
          ((elementOf (car xs) ys) (difference (cdr xs) ys));; if member of xs is an element of ys, remove it from the difference
          (else (cons (car xs) (difference (cdr xs) ys))) ;;not an element of y, so add it to the difference list
          ]
    )
      (begin
         (display "Set 1: ")
         (display L1)
         (newline)
         (display "Set 2: ")
         (display L2)
         (newline)
         (display "____________Set Operations_____________")
         (newline)
         (display "Intersection: ")
         (display (intersect L1 L2))
         (newline)
         (display "Union: ")
         (display (union L1 L2))
         (newline)
         (display "Difference: ")
         (display (difference L1 L2))
         (newline)
         (newline)
      )
   )
(setOps '(1 2 3 4 7 8) '(0 2 3 5))
(setOps '(6 7 8) '(2 3))
(setOps '() '(2 3 5))