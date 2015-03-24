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
 > main = print "Hello World!"
~~~

Ejemplo: Factorial
===========================

La definición del factorial en Haskell es tan simple como se da en Matemáticas,
de forma inductiva. Primero, observaremos que la función factorial lleva números
enteros en números enteros ($!:\mathbb{Z}\rightarrow\mathbb{Z}$). Vamos a 
expresar esto en Haskell:

> fact :: Int -> Int

A continuación realizaremos la definición inductiva del factorial de un número.
Por convención decimos que el factorial de $0$ es $0!=1$, y que el factorial de
algún número natural $n$ será el propio $n$ multiplicado por el factorial de
su anterior, $n! = n(n-1)!$:

> fact 0 = 1
> fact n = n * fact (n - 1)

Ahora podemos preguntar a Haskell el factorial de cualquier número, ya que
lo tiene definido para cualquier natural:

> main :: IO()
> main = print (fact 10)

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