-- 3. Dar dos ejemplos de funciones que tengan los siguientes tipos:
-- a) (Int -> Int) -> (Bool -> Bool)

fa1 :: (Int -> Int) -> (Bool -> Bool)
fa1 f = \b -> True

{- fa1, es una función que recibe una función 'f' que trabaja con enteros y devuelve otra función (anónima, func. aux.)
que recibe un Bool 'b' y siempre devuelve True. 

Otra forma:

fa1 :: (Int -> Int) -> (Bool -> Bool)
fa1 f = siempreTrue

--func. aux:
siempreTrue :: Bool -> Bool
siempreTrue b = True

o bien:

fa1 :: (Int -> Int) -> (Bool -> Bool)
fa1 f b = True

-}

fa2 :: (Int -> Int) -> (Bool -> Bool)
fa2 f b = b

-- b) Bool -> (Int -> Bool)

fb1 :: Bool -> (Int -> Bool)
fb1 b = esMayor5

-- func. auxiliar:
esMayor5 :: Int -> Bool
esMayor5 n 
    | n > 5 = True
    | otherwise = False

fb2 :: Bool -> (Int -> Bool)
fb2 b = if b then esPar else esImpar

{- si b es True, entrego una f que recibe un Int y devuelve un Bool (esPar), si b es False, entrego otra
herramienta (esImpar) que también recibe un Int y devuelve un Bool -}

-- func. auxiliar:
esPar :: Int -> Bool
esPar n = mod n 2 == 0

-- func. auxiliar:
esImpar :: Int -> Bool
esImpar n = mod n 2 /= 0

-- c) Char -> Char

fc1 :: Char -> Char
fc1 x = x

fc2 :: Char -> Char
fc2 x
    | x == 'a' = 's'
    | otherwise = 'n'

-- d) Int -> (Int -> Bool) -> [Int]

fd1 :: Int -> (Int -> Bool) -> [Int]
fd1 n f = [n]

fd2 :: Int -> (Int -> Bool) -> [Int]
fd2 n f = if f n then [n] else []

{- si la f de (n) es True, devuelve el valor de n en una lista, y sino devuelve lista vacía -}

-- func. auxiliar (para probar en consola):
esMenor9 :: Int -> Bool
esMenor9 n = n < 9

-- e) [a] -> (a -> [b]) -> [b]

fe1 :: [a] -> (a -> [b]) -> [b]
fe1 xs f = [v | x <- xs, v <- (f x)]

fe2 :: [a] -> (a -> [b]) -> [b]
fe2 [] f = []
fe2 (x:xs) f = f x  -- tomo el primero, le aplico f y devuelvo esa lista

{- con recursión:

fe2 [] f = []
fe2 (x:xs) f = f x ++ fe2 xs f 

-}

-- f) [[a]] -> (a -> Bool) -> [a]

ff1 :: [[a]] -> (a -> Bool) -> [a]
ff1 xss p = [x | xs <- xss, x <- xs, p x]

ff2 :: [[a]] -> (a -> Bool) -> [a]
ff2 xss p = filtrar (aplanar xss) p

-- func. aux
aplanar :: [[a]] -> [a]
aplanar [] = []
aplanar (xs:xss) = xs ++ aplanar (xss)

-- func. aux.
filtrar :: [a] -> (a -> Bool) -> [a]
filtrar [] p = []
filtrar (x:xs) p 
    | p x = x : filtrar xs p
    | otherwise = filtrar xs p

