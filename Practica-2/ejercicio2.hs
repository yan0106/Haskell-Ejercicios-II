-- 2.
type Cursor = Int
type Linea = (String, Cursor)

vacia :: (String, Integer)
vacia = ("",0)

moverIzq :: (Eq b, Num b) => (a, b) -> (a, b)
moverIzq (xs,0) = (xs,0)
moverIzq (xs,n) = (xs, n-1)
--"Hola"
moverDer :: Foldable t => (t a, Int) -> (t a, Int)
moverDer (xs,p) | p >= length xs = (xs,p)
                | otherwise = (xs,p+1)

insertar :: (Eq b, Num b) => t -> ([t], b) -> ([t], b)
insertar c (xs,p) = (ins p c xs, p+1)

ins :: (Eq t1, Num t1) => t1 -> t2 -> [t2] -> [t2]
ins 0 c xs = c:xs
ins n c (x:xs) = x : ins (n-1) c xs
