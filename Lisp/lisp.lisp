asdasd

(defun clasifico-triangulos (l1 l2 l3)
	(cond 
		( (or ( not(numberp l1)) (not(numberp l2)) (not(numberp l3)) )'invalido)
		( (not (lados-triangulo l1 l2 l3) )'no-es-triangulo)
			( (= l1 l2 l3 ) 'equilatero) 
			( (or (= l1 l2) (= l1 l3) (= l2 l3) )'isoceles)
			(t 'escaleno)
	)
)
