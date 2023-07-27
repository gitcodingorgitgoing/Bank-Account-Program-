#lang scheme
(require test-engine/racket-tests)


;LET: 
;Let: used for local scope of variables and local evaluation of functions using those same variables
;let definitions structure (name value)
;let full functions structure (definitions) (function)

;The three scopes
;global scope
;the outer scope (nested let function)
;the inner scope (primary let function) 



;examples using let:

;when all varaibles in the (let) function are defined, only local variables are used 
(let
    ((a 4)    ;definition
     (b 3))   ;definition 
  (+ a b))    ;function 


;when using a variable or a function with a variable to define a local scope variable using let,
;the variable in the defining function is taken from global scope/global environment.
;Additionally, if that same variable is then used in the same let function for the function input
;of the structure of let, then that variable will also be taken from the global scope/env. when
;used in that function 

(define a 100)

(let
    ((a 4)
     (b (+ a 1)))
  (+ a b))


;we can bypass the use of the global variable rule stated above by nesting our let functions 
(let
    ((a 4))
  (let
      ((b (+ a 1)))
    (+ a b)))


;example on how to place let inside a variable 
(define congo
  (let
    ((a 4)
     (b (+ a 1)))
  (+ a b)))

congo 

;example on how to palce let inside a function
(define (let-test x)
  (let
      ((a (* 2 x x))
       (b (+ 1 x))
       (c 5))
    (+ a b c)))

(let-test 10)



;BEGIN:
;evaluates a function or a variable without it having to be named explicitly after it has been defined
;can be placed within a larger function or at the start of a function

;examples:

(begin (define x 10) x)

(+ 3 (begin
       (print "food")
       2))


;SET
;turns a variable into something else

;example:
(define y 12)

(set! y (add1 y))

y


;MAKESHIFT BANK ACCOUNT 
;So the magic of the makeshift bankacoount is that you have functions that are created to manipulate the value of one specific varaible.
;the magic is mostly contained within the (set!) primitive, in which one can transform the value of a variable into something else,
;by either just giving it a different value or running the variable through a certain function



;defining balance
(define balance 100)

;defining withdraw function
;here the (set!) primitive is nested within the (begin) primitive in order to allow the if statement to run smoothly from one situational possibility to the other 
(define (withdraw amount)
  (if
   (>= amount balance) "insufficient funds"
   (begin
     (set! balance (- balance amount))
           balance)))

(withdraw 30)


;defining deposit function

(define (deposit amount)
  (begin
    (set! balance (+ balance amount))
    balance))

(deposit 20) 
    


(require test-engine/racket-tests)

;PASS PROTECTED BANK ACCOUNT:

;defining balance2
(define balance2 100) 


;defining test-password function

(check-expect (enter-password-test "kingship") balance2)
(check-expect (enter-password-test "poop") "Incorrect Password") 

(define (enter-password-test password)
  (if
   (string=? "kingship" password) balance2
   "Incorrect Password"))


;creating nested if statement to implement enter-password into withdraw and deposit functions
;(if
; (string=? "kingship" enter-password) (Insert interior if-statement)
; "Incorrect Password")



;defining withdraw2 function


(define (withdraw2 enter-password amount)
  (if
   (string=? "kingship" enter-password)
  (if
   (>= amount balance2) "insufficient funds"
   (begin
     (set! balance2 (- balance2 amount))
           balance2))
  "Incorrect Password")) 

(check-expect (withdraw2 "kingship" 20) 80) 
(check-expect (withdraw2 "poop" 20) "Incorrect Password") 


;defining deposit2 function:

(define (deposit2 enter-password amount)
  (if
   (string=? "kingship" enter-password)
  (begin
    (set! balance2 (+ balance2 amount))
   balance2)
  "Incorrect Password"))



(check-expect (deposit2 "kingship" 20) 100) 
(check-expect (deposit2 "poop" 20) "Incorrect Password") 















