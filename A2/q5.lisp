(defun isBST (lst)
    (cond 
        ((or (null lst) (null (cdr lst))) t)
        ((> (car lst) (car (cdr lst))) (isBST (cdr lst)))
        ((< (car lst) (car (cdr (cdr lst)))) (isBST (cdr lst)))
        (t nil)
    )
)
(print (isBST '(8 (3 (1 () ()) (6 (4 () ())( 7 () ()))) (10 (()) (14 (13) ())))))
