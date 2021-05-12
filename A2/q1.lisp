(defvar l)
(defvar n)
(setf n 1)
(setf l 1)
(defun printLine (l n)
    (write n)
    (princ " ")
    (cond
        ((= l 1) (write-line ""))
        (t (printLine (- l 1) (+ n 1)))))
(defun triangle (n)
    (cond 
        ((floatp n) (print "decimal numbers are not valid input, please enter an integer"))
        ((stringp n) (print "string values are not valid input, please enter an integer"))
        ((= l (+ n 1)))
        (t 
            (printLine l 1)
            (setf l (+ l 1))
            (triangle n))))
(triangle 5)
