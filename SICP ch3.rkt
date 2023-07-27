#lang scheme

;Let: used for local scope of variables nd local evaluation of functions using those same variables

;examples using let:

;when all varaibles in the (let) function are defined, only local variables are used 
(let
    ((a 4)
     (b 3))
  (+ a b))

;when using a variable or a function with a variable to define a local scope variable using let;
;the variable in the defining function is taken from global scope/global environment 

(define a 100)

(let
    ((a 4)
     (b (+ a 1)))
  (+ a b)) 

