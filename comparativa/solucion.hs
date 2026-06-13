-- ========================================================
-- FUNCIÓN: transicion
-- NATURALEZA: Pura (no toca nada de afuera, solo usa lo que
--             le pasás como parámetro y devuelve un resultado)
-- ESTRATEGIA: Pattern Matching (cada línea es un caso distinto,
--             es como el cond de Lisp pero al reves: primero
--             escribís el caso y después qué hace)
-- IMPACTO: No destructiva
-- ALUMNO: SCHUGURENSKY LEANDRO DANIEL
-- ========================================================
transicion :: EstadoActual -> ColorDestino -> ResultadoTransicion
transicion EnVerde    Amarillo = ResultadoTransicion EnVerde    "cambiar-a-amarillo"
transicion EnAmarillo Rojo     = ResultadoTransicion EnAmarillo "cambiar-a-rojo"
transicion EnRojo     Verde    = ResultadoTransicion EnRojo     "cambiar-a-verde"
transicion estado     _        = ResultadoTransicion estado     "accion-por-defecto"





-- ========================================================
-- FUNCIÓN: temporizador
-- NATURALEZA: Pura (dado el mismo número siempre da el mismo
--             resultado, no depende de ninguna variable externa)
-- ESTRATEGIA: Guards (los | son como los casos del cond de Lisp,
--             se evalúan de arriba hacia abajo hasta que uno sea True)
-- IMPACTO: No destructiva
-- ALUMNO: NUÑEZ TOBIAS NAHUEL
-- ========================================================
temporizador :: Integer -> EstadoActual
temporizador tiempoUnix
    | segundos <  90  = EnRojo
    | segundos <  210 = EnVerde
    | otherwise       = EnAmarillo
    where segundos = tiempoUnix `mod` 216