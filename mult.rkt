#lang racket

(define (mult num1 num2)
  (display
   (string-append
    (~a num1 #:min-width (+ (max (string-length (~a num2)) (string-length (~a num2))) 2) #:align 'right #:left-pad-string " ")
    "\nx "
    (~a num2 #:min-width (- (max (string-length (~a num1)) (string-length (~a num2))) 2) #:align 'right #:left-pad-string " ")
    "\n"
    ;(~a #:min-width (max (string-length (~a num1)) (+ (string-length (~a num2)) 2)) #:align 'right #:left-pad-string "-")
    (string-append " " (make-string (- (string-length (~a (* num1 num2))) 1) #\-))
    (productCalc num1 (reverseList (string->list (~a num2))) 0 "" (string-length (~a (* num1 num2))))
    "\n"
    (make-string (string-length (~a (* num1 num2))) #\-)
    "\n"
    (~a (* num1 num2))
    )))

(define (productCalc num1 numList level stringToPrint width) (if (not(null? numList))  (productCalc num1 (cdr numList) (+ level 1) (if (not(= (* num1 (string->number (make-string 1 (car numList)))) 0)) (string-append stringToPrint "\n" (~a (* num1 (string->number (make-string 1 (car numList)))) #:align 'right #:left-pad-string " " #:min-width (- width level) ) ) stringToPrint) width) stringToPrint)  )

(define (reverseList l) ; Borrowed this function from the net
  (if (null? l)
     '()
     (append (reverseList (cdr l)) (list (car l)))
  )
)