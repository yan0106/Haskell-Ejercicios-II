{- 1. El modelo de color RGB es un modelo aditivo que tiene al rojo, verde y azul como colores
primarios. Cualquier otro color se expresa en términos de las proporciones de estos tres colores 
que es necesario combinar en forma aditiva para obtenerlo. Dichas proporciones caracterizan a cada
color de manera biunivoca, por lo que usualmente se utilizan estos valores como representacion de
un color.
Definir un tipo Color en este modelo y una función mezclar que permita obtener el promedio
componente a componente entre dos colores.-}

type Color = (Int, Int, Int) -- 0 -> 255 (256) 2^.. ?

data Color2 = C (red::Int, green::Int, blue::Int) -- record

data Color3 = Negro 
            | Blanco 
            | Gris Int 
            | C Int Int Int deriving Show

mezclar :: Color -> Color -> Color
mezclar (r1,g1,b1) (r2,g2,b2) = (div (r1+r2) 2, div (g1+g2) 2, div (b1+b2) 2)

-- 2.
type Cursor = Int
type Linea = (String, Cursor)

vacia = ("",0)

moverIzq (xs,0) = (xs,0)
moverIzq (xs,n) = (xs, n-1)
--"Hola"
moverDer (xs,p) | p >= length xs = (xs,p)
                | otherwise = (xs,p+1)

insertar c (xs,p) = (ins p c xs, p+1)

ins 0 c xs = c:xs
ins n c (x:xs) = x : ins (n-1) c xs

