;;@author Jason Millson
;;@Date 2/25/19
;;Program to print out information regarding square matrices
;;such as the row size, sum of rows, and if the row sums are equal.
(define (magic? matrix)
   
    ;; define helper functions here
  
  ;;Adds up all the elements of row
  (define (addRow xs)
    [cond ((null? xs) 0)
          (else (+ (car xs) (addRow (cdr xs))))
          ]
    )
  ;;Creates a list of the row sums
  (define (magicRows matrix)
    [cond ((null? matrix) '())
          (else (cons (addRow (car matrix)) (magicRows (cdr matrix))))
          ]
    )
  ;;Uses apply to check if all elements of a list are the same.
  (define (list-equal xs)
    [cond ((null? xs) #f)
          (else (apply = xs))
          ]
    )
  ;;Prints information regarding the sum list created by magicRows
  (define (sumStatement xs)
    [cond ((list-equal xs) (display "Row sums are identical!"))
          ((null? xs) (display "The matrix is empty."))
          (else (display "Row sums are not the same."))
          ]
    )
      (begin
         (display "____________Info_____________")
         (newline)
         (display matrix)
         (newline)
         (display "Number of elements in each row: ")
          ;; display the length here
         ;;Done by simple call of matrix length as they are guarenteed to be square matrices
         (display (length matrix))
         (newline)
          ;; print the list with row sum's using the expression:
         (display (magicRows matrix))
         (newline)
   
          ;; more here, to print the rest of the required output
         (sumStatement (magicRows matrix))
         (newline)
      )
   
   )
(magic? '((1 2 3 4 5) (2 3 4 5 1) (3 4 5 1 2) (4 5 1 2 3) (5 1 2 3 4)))
(magic? '((1 2 3) (2 3 3) (4 2 1)))
(magic? '())