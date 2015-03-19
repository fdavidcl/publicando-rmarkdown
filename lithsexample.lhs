---
title: Ejemplo de Programación Literaria en Haskell
author: David Charte
date: Document Freedom Day - OSL
---

Haskell literario
===========================

El compilador de Haskell, GHC, tiene soporte *built-in* para Haskell literario,
una forma de escribir en dicho lenguaje en la que las líneas de código van
precedidas de símbolos `>`. Por ejemplo,

~~~markdown
 > main :: IO()
 > main = putStr "Hello World!"
~~~

Ejemplo: Factorial
===========================

La definición del factorial en Haskell es tan simple como se da en Matemáticas,
de forma inductiva:

> fact :: Int -> Int
> fact 0 = 1
> fact n = n * fact (n - 1)

Ahora podemos preguntar a Haskell el factorial de cualquier número, ya que
lo tiene definido para cualquier natural:

> main :: IO()
> main = putStr ((show (fact 10)) ++ "\n")

Este archivo `.lhs` se puede compilar a LaTeX y a PDF desde `pandoc`:

~~~bash
pandoc --to latex --from markdown+lhs lithsexample.lhs \
  -o lithsexample.pdf
~~~

Compilando este mismo archivo con GHC podemos comprobar el resultado:

~~~bash
$ ghc litexample.lhs
[1 of 1] Compiling Main     ( lithsexample.lhs, lithsexample.o )
Linking lithsexample ...

$ ./lithsexample
3628800
~~~