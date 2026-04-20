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
