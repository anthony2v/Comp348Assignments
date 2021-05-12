(print "Lambda:")
(print ((lambda (x1 y1 x2 y2) (sqrt (+ (* (- x1 x2) (- x1 x2)) (* (- y1 y2) (- y1 y2))))) 10 5 20 5))
(print "Not Lambda:")
(defun distance (x1 y1 x2 y2)
    (print (sqrt (+ (* (- x1 x2) (- x1 x2)) (* (- y1 y2) (- y1 y2)))))
    )
(distance 10 5 20 5)
;The lambda function is more efficient in terms of memory since it's not stored in memory.
