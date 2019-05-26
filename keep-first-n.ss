;;@author Jason Millson
;;date: 1/29/19
;;function to keep first n elements of list xs
;;Checks for negative values of n and also values of n larger than size of xs

(define (keep-first-n n xs)
  [cond (( = n 0) '())
        ((< n 0 )'(Error! Negative value of n.))
        ((< (size-of-list 0 xs) n) '(Error! N is greater than list size))
        (else (cons (car xs) (keep-first-n (- n 1) (cdr xs))))
   ]
  )

;;helper function to determine size of list
(define (size-of-list size xs)
  (if (equal? '() xs) (+ size 0) ;;base case
      (size-of-list (+ 1 size) (cdr xs)) ;;recursive case
      )
  )
