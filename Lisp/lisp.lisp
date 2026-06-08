(defun  transicion ( color-actual cambiar-a )
		(cond  
						((and (eq color-actual  'en-verde) (eq cambiar-a  'amarillo) ) (list color-actual "cambiar-a-amarillo")) 
						((and (eq color-actual  'en-amarillo)  (eq cambiar-a  'rojo) ) (list color-actual "cambiar-a-rojo"))
						((and (eq color-actual  'en-rojo ) (eq cambiar-a 'verde) ) (list color-actual "cambiar-a-verde"))
						(t (list color-actual 'accion-por-defecto))
		)
)
