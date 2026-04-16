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


