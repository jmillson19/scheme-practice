(define (sumAdd xs)
  [cond ((equal? xs ()) 0)
        ((and(pair?(car xs)) (not (integer? (car(car xs))))) (+ 0 (sumAdd (cdr (car xs)))));;Case if there's a sublist with non number elements
        ((pair?(car xs)) (+ (car(car xs)) (sumAdd (cdr (car xs)))));;Case for sublists
        ((not(integer? (car xs))) (+ 0 (sumAdd (cdr xs))));;Case for standard non-number elements
        (else (+ (car xs) (sumAdd (cdr xs)))) ;;if shes just a standard integer we wanna add
    ]
  )
