## ¿Qué es un Algebraic Data Type (ADT)?

Un **Algebraic Data Type (ADT)** es una forma de definir un tipo cuyos valores posibles están limitados a un conjunto de alternativas previamente declaradas. Esto permite modelar conceptos del dominio de manera segura, ya que una variable de ese tipo solo puede tomar alguno de los valores especificados.

Al conocer todos los valores válidos de un tipo, el compilador puede detectar errores antes de ejecutar el programa. Si se intenta utilizar un valor que no pertenece al tipo definido, la compilación falla.

## ¿Cómo impide Haskell que se pasen estados inválidos?

Haskell posee un sistema de tipos estático y estricto. Como el compilador conoce todos los valores válidos de cada tipo durante la compilación, puede verificar que las funciones reciban únicamente datos correctos.

Si se intenta pasar un valor que no pertenece al tipo esperado, el programa no compilará. De esta manera, muchos errores se detectan antes de la ejecución, aumentando la seguridad y la confiabilidad del código.

## ¿Cómo modelamos los colores del semáforo?

Modelamos los colores del semáforo utilizando ADTs. Definimos tres tipos de datos:

```haskell
data EstadoActual = EnRojo | EnAmarillo | EnVerde
data ColorDestino = Rojo | Amarillo | Verde
data ResultadoTransicion = ResultadoTransicion EstadoActual String
```

- `EstadoActual` representa el color en el que se encuentra actualmente el semáforo.
- `ColorDestino` representa el color al que se desea realizar la transición.
- `ResultadoTransicion` agrupa los dos valores devueltos por la función `transicion`: el nuevo estado del semáforo y la acción que debe realizarse.

Se decidió utilizar tipos distintos para `EstadoActual` y `ColorDestino` porque representan conceptos diferentes dentro del dominio del problema. En la versión de Common Lisp esta diferencia se reflejaba mediante símbolos distintos (`en-rojo`, `en-verde`, etc. para el estado actual, y `rojo`, `verde`, etc. para el destino). En Haskell, esta distinción se expresa de manera explícita mediante tipos separados, lo que aporta mayor claridad y seguridad al programa.







## ¿Cómo afecta la Evaluación Perezosa (Lazy Evaluation) de Haskell al procesamiento de los tiempos del temporizador si existiera un flujo infinito de eventos de tráfico?

La *Evaluación Perezosa (Lazy Evaluation)* significa que Haskell no calcula una expresión hasta que su resultado es realmente necesario.

Gracias a esta característica, Haskell puede procesar un flujo infinito de eventos de tráfico sin consumir toda la memoria disponible. En lugar de evaluar todos los timestamps de una vez, los procesa de manera incremental, calculando únicamente los valores que se necesitan en cada momento.

Esto permite aplicar la función temporizador sobre una secuencia infinita de tiempos sin inconvenientes, ya que los datos se generan y consumen a medida que son requeridos. En un lenguaje con evaluación estricta, como Common Lisp, sería necesario implementar mecanismos adicionales para evitar cargar toda la secuencia en memoria y provocar un consumo excesivo de recursos.