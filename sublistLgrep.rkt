#lang racket
(define (sublist list1 list2) (if (<= (length list1) (length list2)) (if (not (sublistRecurse1 list1 list2)) (sublist list1 (cdr list2)) #t) #f))

(define (sublistRecurse1 list1 list2) (if (<= (length list1) (length list2)) (if (member (car list1) list2)(sublistRecurse2 (cdr list1) (cdr (member (car list1) list2))) #f) #f))

(define (sublistRecurse2 list1 list2) (if (<= (length list1) (length list2))(if (null? list1) #t (if (and (list? list1) (list? list2))(if (equal? (car list1)(car list2)) (sublistRecurse2 (cdr list1)(cdr list2)) #f) (display list1))) #f))

(define (lgrep list1 listOfLists) (realLgrep list1 listOfLists '()))

(define (realLgrep list1 listOfLists toPrintList) (if (not (null? listOfLists)) (if (sublist list1 (car listOfLists)) (realLgrep list1 (cdr listOfLists) (cons (car listOfLists) toPrintList)) (realLgrep list1 (cdr listOfLists) toPrintList) ) (display toPrintList)))