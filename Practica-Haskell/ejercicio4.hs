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

-- f) foo6 x y z = x ++ y z

{- Inferencia:
1. y :: (a->[b])
2. z :: a
3. x :: [b]
4. resultado:: [b]
-}

foo6 :: [b] -> (a->[b]) -> a -> [b]

-- g) foo7 a b = if b a then head a else []

{- Inferencia:
1. a :: [[t]] -- el nombre del tipo tiene que ser distinto a la variable
2. b :: ([[t]] -> Bool)
3. resultado if:: [t]
4. resultado else:: [t]
-}

foo7 :: [[t]] -> ([[t]] -> Bool) -> [t]

-- h) foo8 a b = if b a then a else []

{- Inferencia:
1. a :: [t]
2. b :: ([t]->Bool)
3. resultado if:: [t]
4. resultado else:: [t]
-}

foo8 :: [t] -> ([t] -> Bool) -> [t]

-- i) foo9 a b = if b a then head (:a) else (:[])

{- Inferencia:
1. a :: [t]
2. b :: ([t] -> Bool)
3. resultado then:: t -> [t]
4. resultado else:: t -> [t]
-}

foo9 :: [t] -> ([t] -> Bool) -> (t -> [t])

{- Inferencia2:
1. a :: t
2. b :: (t -> Bool)
3. resultado then:: [t] -> [t]
4. resultado else:: [t] -> [t]

foo9 :: t -> (t -> Bool) -> ([t] -> [t])

VER CUÁL ES CORRECTA
-}