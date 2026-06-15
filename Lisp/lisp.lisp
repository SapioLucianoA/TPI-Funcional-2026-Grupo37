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
(defun ciclos-por-tiempo (segundos-totales segundos-luz-roja segundos-luz-roja-intermitente segundos-luz-verde segundos-luz-verde-intermitente segundos-luz-amarilla segundos-luz-amarilla-intermitente )

(floor segundos-totales (duracion-ciclo segundos-luz-roja segundos-luz-roja-intermitente segundos-luz-verde segundos-luz-verde-intermitente segundos-luz-amarilla segundos-luz-amarilla-intermitente ))

)


;; ========================================================
;; FUNCIÓN: distribucion-por-hora
;; NATURALEZA: Pura
;; ESTRATEGIA: Operaciones matematicas(proporcion y composicion)
;; IMPACTO: No destructiva
;; ALUMNO: JOSEFINA VALLEJOS ROMERO
;; ========================================================

(defun distribucion-por-hora()
	(list
	   (list 'rojo (*(float(/ 90 216))100))
	   (list 'amarillo (*(float(/ 6 216))100))
	   (list 'verde (*(float(/ 120 216))100))
	 )
)


;; ========================================================
;; CARGA DE LIBRERIA
;; LIBRERIA: local-time
;; ALUMNO: CESAR GABRIEL PRIETO
;; ========================================================

(ql:quickload "local-time")

;; ========================================================
;; FUNCIÓN: convertir-fecha
;; NATURALEZA: Pura (Para un mismo tiempo Unix retorna siempre la misma fecha)
;; ESTRATEGIA: Composición de Funciones (Uso de funciones de local-time)
;; IMPACTO: No destructiva
;; ALUMNO: CESAR GABRIEL PRIETO
;; ========================================================

(defun convertir-fecha (tiempo-unix)

	(local-time:format-timestring
		nil
		(local-time:unix-to-timestamp tiempo-unix)
	)

)

;; ========================================================
;; FUNCIÓN: registrar-cambio
;; NATURALEZA: Impura (Realiza salida por pantalla mediante format)
;; ESTRATEGIA: Secuencial (Obtiene una fecha y luego genera un mensaje)
;; IMPACTO: No destructiva
;; ALUMNO: CESAR GABRIEL PRIETO
;; ========================================================

(defun registrar-cambio (tiempo-unix color-anterior color-nuevo)

	(format t
		"Tiempo ~A: la luz ha cambiado de ~A a ~A~%"
		(convertir-fecha tiempo-unix)
		color-anterior
		color-nuevo
	)
)

;; ========================================================
;; FUNCIÓN: generar-informe
;; NATURALEZA: Impura (Genera un archivo de texto)
;; ESTRATEGIA: Escritura Secuencial en Archivo
;; IMPACTO: No destructiva
;; ALUMNO: CESAR GABRIEL PRIETO
;; ========================================================

(defun generar-informe (datos)

	(with-open-file
		(stream
		 "informe-ejecucion-semaforo.txt"
		 :direction :output
		 :if-exists :supersede
		 :if-does-not-exist :create)

		(format stream "Informe de Ejecucion del Sistema Semaforico~%")
		(format stream "=========================================~%")

		(dolist (dato datos)
			(format stream "~A~%" dato)
		)

		(format stream "~%--- Fin del Informe ---~%")
	)

)


;; ----------------------------------------------------------------
;;   REQUERIMIENTO 7:ASEGURAMIENTO DE LA CALIDAD
;; ----------------------------------------------------------------


;; --------------------------------------------------------
;; Pruebas para 'temporizador'
;; --------------------------------------------------------

 ;;Caso de normal: Transicion valida

(transicion 'rojo-intermitente 'verde)
;; Esperado:(ROJO-INTERMITENTE "cambiar-a-verde")

;; Caso de alternativo:otra transicion valida

(transicion 'verde 'verde-intermitente)
;; Esperado:(VERDE "cambiar-a-verde-intermitente")

;; Caso de error:transicion invalida

(transicion 'rojo 'verde)
;;Esperado:(ROJO ACCION-POR-DEFECTO)


;; --------------------------------------------------------
;; Pruebas para 'temporizador'
;; --------------------------------------------------------

 ;;Caso de normal:tiempo dentro de un rango rojo

(temporizador 50)
;; Esperado:ROJO

;; Caso de alternativo:tiempo negativo (sigue siendo válido)

(temporizador -4)
;; Esperado:AMARILLO

;; Caso de error:parametro invalido

(temporizador 'jojo)
;;Esperado:JOJO is not a real number


;; --------------------------------------------------------
;; Pruebas para 'duracion-ciclo'
;; --------------------------------------------------------

 ;;Caso de normal: 


;; Esperado:

;; Caso de alternativo:


;; Esperado:


;; Caso de error:


;;Esperado:


;; --------------------------------------------------------
;; Pruebas para 'recomendacion-ciclo'
;; --------------------------------------------------------

 ;;Caso de normal: 


;; Esperado:


;; Caso de alternativo:


;; Esperado:


;; Caso de error:


;;Esperado:


;; --------------------------------------------------------
;; Pruebas para 'ciclos-por-tiempo'
;; --------------------------------------------------------

 ;;Caso de normal: 


;; Esperado:

;; Caso de alternativo:


;; Esperado:

;; Caso de error:


;;Esperado:


;; --------------------------------------------------------
;; Pruebas para 'distribucion-por-hora'
;; --------------------------------------------------------

;; Caso normal:ejecucion correcta

(distribucion-por-hora)
;; Esperado:((ROJO 41.666664) (AMARILLO 2.777778) (VERDE 55.555557))

;; Caso alternativo

(length(distribucion-por-hora))
;; Esperado:3

;; Caso de error:llamada con argumento

(distribucion-por-hora 3600)
;; Esperado:se han entregado demasiados argumentos a DISTRIBUCION-POR-HORA



;; --------------------------------------------------------
;; Pruebas para ''
;; --------------------------------------------------------

 ;;Caso de normal: 

;; Esperado:

;; Caso de alternativo:


;; Esperado:

;; Caso de error:


;;Esperado:
