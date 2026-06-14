;; ========================================================
;; FUNCIÓN: transicion
;; NATURALEZA: Pura (Depende exclusivamente de sus parámetros, no altera el entorno)
;; ESTRATEGIA: Evaluación Condicional (Implementada mediante 'cond' y 'and')
;; IMPACTO: No destructiva
;; ALUMNO: SAPIO LUCIANO
;; ========================================================
(defun transicion (color-actual cambiar-a)
  (cond  

    ((and (eq color-actual 'rojo) (eq cambiar-a 'rojo-intermitente)) (list color-actual "cambiar-a-rojo-intermitente")) 
    ((and (eq color-actual 'rojo-intermitente) (eq cambiar-a 'verde)) (list color-actual "cambiar-a-verde"))
    
    ((and (eq color-actual 'verde) (eq cambiar-a 'verde-intermitente)) (list color-actual "cambiar-a-verde-intermitente"))
    ((and (eq color-actual 'verde-intermitente) (eq cambiar-a 'amarillo)) (list color-actual "cambiar-a-amarillo"))
    
    ((and (eq color-actual 'amarillo) (eq cambiar-a 'amarillo-intermitente)) (list color-actual "cambiar-a-amarillo-intermitente"))
    ((and (eq color-actual 'amarillo-intermitente) (eq cambiar-a 'rojo)) (list color-actual "cambiar-a-rojo"))
    
    (t (list color-actual 'accion-por-defecto))
  )
)
;; ========================================================
;; FUNCIÓN: temporizador (nombre antigüo timer)
;; NATURALEZA: Pura (Para un mismo tiempo Unix de entrada, el resultado es siempre predecible y constante, sin depender de estados externos)
;; ESTRATEGIA: Composición Matemática y Condicional (Uso de 'mod', 'let' y 'cond')
;; IMPACTO: No destructiva
;; ALUMNO: SAPIO LUCIANO
;; ========================================================
(defun temporizador (tiempo-unix) 
  (let ((segundos (mod tiempo-unix 225)))
      (cond 
        ((< segundos 90) 'rojo)
        ((and (>= segundos 90) (< segundos 93)) 'rojo-intermitente)
        ((and (>= segundos 93) (< segundos 213)) 'verde)
        ((and (>= segundos 213) (< segundos 216)) 'verde-intermitente)
        ((and (>= segundos 216) (< segundos 222)) 'amarillo)
        (t 'amarillo-intermitente)
      )
  )
)
;; ========================================================
;; FUNCIÓN: duracion-ciclo
;; NATURALEZA: Pura (Retorna la suma exacta de sus argumentos sin efectos secundarios)
;; ESTRATEGIA: Secuencial / Operación Matemática Simple
;; IMPACTO: No destructiva
;; ALUMNO: SAPIO LUCIANO
;; ========================================================
(defun duracion-ciclo (tiempo-rojo tiempo-rojo-intermitente tiempo-verde tiempo-verde-intermitente tiempo-amarillo tiempo-amarillo-intermitente)
	(+ tiempo-rojo tiempo-rojo-intermitente tiempo-verde tiempo-verde-intermitente tiempo-amarillo tiempo-amarillo-intermitente)   
)
;; ========================================================
;; FUNCIÓN: recomendacion-ciclo
;; NATURALEZA: Pura (Solo evalúa un valor y retorna un string, sin imprimir en pantalla)
;; ESTRATEGIA: Evaluación Condicional (Implementada mediante 'cond')
;; IMPACTO: No destructiva
;; ALUMNO: SAPIO LUCIANO
;; ========================================================
(defun recomendacion-ciclo ( duracion-total-ciclo ) 
	(cond 
				((< duracion-total-ciclo 35) "rango del ciclo corta, optimo: 35-150 segundos")
				((> duracion-total-ciclo 150) "rango del ciclo larga, optimo: 35-150 segundos")
				(t "duracion optima")
	)
)
;; ========================================================
;; FUNCIÓN: ciclos-por-tiempo
;; NATURALEZA: Pura (No muta el estado, retorna un entero derivado de sus parámetros)
;; ESTRATEGIA: Composición de Funciones (Llama internamente a 'duracion-ciclo' y 'floor')
;; IMPACTO: No destructiva
;; ALUMNO: SAPIO LUCIANO
;; ========================================================
(defun ciclos-por-tiempo (segundos-totales segundos-luz-roja segundos-luz-verde segundos-luz-amarilla)

(floor segundos-totales (duracion-ciclo segundos-luz-roja segundos-luz-verde segundos-luz-amarilla ))

)