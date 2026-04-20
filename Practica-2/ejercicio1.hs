{- 1. El modelo de color RGB es un modelo aditivo que tiene al rojo, verde y azul como colores
primarios. Cualquier otro color se expresa en términos de las proporciones de estos tres colores 
que es necesario combinar en forma aditiva para obtenerlo. Dichas proporciones caracterizan a cada
color de manera biunivoca, por lo que usualmente se utilizan estos valores como representacion de
un color.
Definir un tipo Color en este modelo y una función mezclar que permita obtener el promedio
componente a componente entre dos colores.-}

type Color = (Int, Int, Int) -- 0 -> 255 (256) 2^.. ?
-- type : solo un "apodo" o etiqueta para algo que ya existe (una tupla de tres enteros)

data Color2 = C { red :: Int, green :: Int, blue :: Int } -- record, con llaves
-- Tipos de Datos Algebraicos con Registro (data con llaves) : se llama Record Syntax. 
-- Haskell crea automáticamente las funciones para "extraer" los valores.
-- Si tenemos un color c, podemos poner red c y te devuelve el valor del rojo.

data Color3 = Negro 
            | Blanco 
            | Gris Int 
            | Color Int Int Int deriving Show
-- Tipos de Datos con múltiples constructores (data con |)

mezclar :: Color -> Color -> Color
mezclar (r1,g1,b1) (r2,g2,b2) = (div (r1+r2) 2, div (g1+g2) 2, div (b1+b2) 2)
-- la f está basada en el primer ejemplo (type), por eso se usa el pattern matching de tuplas: (r1, g1, b1)


