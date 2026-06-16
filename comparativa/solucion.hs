-- Tipos de datos
data EstadoActual
  = EnRojo
  | RojoIntermitente
  | EnVerde
  | VerdeIntermitente
  | EnAmarillo
  | AmarilloIntermitente
  deriving (Show)

data ColorDestino
  = DestRojo
  | DestRojoIntermitente
  | DestVerde
  | DestVerdeIntermitente
  | DestAmarillo
  | DestAmarilloIntermitente
  deriving (Show)

data ResultadoTransicion = ResultadoTransicion EstadoActual String
  deriving (Show)

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
transicion EnRojo               DestRojoIntermitente     = ResultadoTransicion EnRojo               "cambiar-a-rojo-intermitente"
transicion RojoIntermitente     DestVerde                = ResultadoTransicion RojoIntermitente     "cambiar-a-verde"
transicion EnVerde              DestVerdeIntermitente    = ResultadoTransicion EnVerde              "cambiar-a-verde-intermitente"
transicion VerdeIntermitente    DestAmarillo             = ResultadoTransicion VerdeIntermitente    "cambiar-a-amarillo"
transicion EnAmarillo           DestAmarilloIntermitente = ResultadoTransicion EnAmarillo           "cambiar-a-amarillo-intermitente"
transicion AmarilloIntermitente DestRojo                 = ResultadoTransicion AmarilloIntermitente "cambiar-a-rojo"
transicion estado               _                        = ResultadoTransicion estado               "accion-por-defecto"

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
    | segundos <  93  = RojoIntermitente
    | segundos <  213 = EnVerde
    | segundos <  216 = VerdeIntermitente
    | segundos <  222 = EnAmarillo
    | otherwise       = AmarilloIntermitente
    where segundos = tiempoUnix `mod` 225



-- Para probar
main :: IO ()
main = do
  print (transicion EnRojo DestRojoIntermitente) --> EnRojo "cambiar-a-rojo-intermitente"
  print (transicion EnVerde DestAmarillo)        --> EnVerde "accion-por-defecto"
  print (temporizador 100)                       --> EnVerde
  print (temporizador 500)                       --> EnRojo