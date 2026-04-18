-- 4. Dar el tipo de las siguientes funciones o expresiones:
-- a) foo1 p = if p then (p ^) else (p ^)

foo1 :: Bool -> (Bool -> Bool) 

-- recibe un bool y devuelve una función que recibe un bool 'p' y espera otro bool

-- b) foo2 x y z = x (y z)

foo2 :: (b -> c) -> (a -> b) -> a -> c  -- (firma: de afuera hacia adentro)

{- Inferencia de tipos: 
(de adentro hacia afuera)
1. z :: a (tipo solo)
2. y :: a -> b (función)
3. x :: b -> c (función)
-}

-- c) foo3 x y z = x y z 

{- Inferencia:
1. y :: a
2. z :: b
3. x :: (a->b->c)
-}

foo3 :: (a->b->c) -> a -> b -> c

-- d) foo4 x y z = x y : z

{- Inferencia:
1. y :: a
2. z :: [b]
3. x :: (a->b)
4. resultado :: [b]
-}

foo4 :: (a->b) -> a -> [b] -> [b]

-- e) foo5 x y z = x : y z

{- Inferencia:
1. x :: a
2. y :: (b->[a])
3. z :: b
4. resultado :: [a]
-}

foo5 :: a -> (b -> [a]) -> b -> [a]