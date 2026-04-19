-- 5. Definir las siguientes funciones usando foldr:

-- a) map :: (a -> b) -> [a ] -> [b ] que dada una función y una lista, aplica la función a cada 
-- elemento de la lista.

-- resultado con lambda:

map :: (a -> b) -> [a] -> [b]
map f xs = foldr (\x acc -> f x : acc) [] xs

{- foldr recibe:
1. una función anónima que aplica f a cada elemento x 
y lo pega adelante del acumulador acc
2. [] como valor inicial (semilla)
3. la lista xs
-}

-- resultado con func. auxiliar:

map2 :: (a -> b) -> [a] -> [b]
map2 f xs = foldr (combinar f) [] xs   
-- foldr se encarga de ir pasándole a combinar, cada elemento x y el acumulador acc en cada paso

-- func. auxiliar:
combinar :: (a -> b) -> a -> [b] -> [b]
combinar f x acc = f x : acc

