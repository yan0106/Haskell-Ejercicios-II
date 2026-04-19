-- 5. Definir las siguientes funciones usando foldr:

-- a) map :: (a -> b) -> [a ] -> [b ] que dada una función y una lista, aplica la función a cada 
-- elemento de la lista.

-- resultado con lambda:

map :: (a -> b) -> [a] -> [b]
map f xs = foldr (\x acc -> (f x) : acc) [] xs

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

-- b) filter :: (a -> Bool) -> [a] -> [a], que dado un predicado y una lista xs, devuelve una lista
-- con los elementos de xs que satisfacen el predicado.

filter :: (a -> Bool) -> [a] -> [a]
filter f xs = foldr (\x acc -> if f x then x : acc else acc) [] xs 
-- la semilla y lo que devuelve la función anónima deben ser del mismo tipo que el valor
-- que se espera obtener (en este caso, una lista [a])

-- c) unzip :: [(a, b)] -> ([a],[b]), que dada una lista de tuplas xs retorna una tupla de listas donde
-- cada una corresponde a los primeros y segundos elementos de los pares respectivamente.
-- Ej. unzip [('a', 1), ('z', 7), ('h', 9)] = ("azh", [1, 7, 9])

unzip :: [(a, b)] -> ([a],[b])
unzip xs = foldr (\(x, y) (as, bs) -> (x:as, y:bs)) ([], []) xs

{- Notas:
x :: (a, b)
acc :: ([a], [b])
semilla :: ([], [])
-}

-- d) pair2List ::(a, [b]) -> [(a, b)] que dado un par formado por un valor x y una lista xs convierta
-- a la lista xs en una lista de pares, formada con los elementos de xs y x.
-- Ej. pair2List (x ; [y1 ; y2 ; y3 ]) = [(x ; y1 ); (x ; y2 ); (x ; y3 )]

pair2List :: (a, [b]) -> [(a, b)]
pair2List (x, ys) = foldr (\y acc -> (x, y) : acc) [] ys

-- e) maxSec :: [(Int, Int)] -> (Int, Int), que dada una lista de pares de naturales que represente a
-- una lista de segmentos de la recta, calcule el segmento más largo de la misma.
-- Ej. maxSec [(1, 2), (0, 7), (4, 6)] = (0, 7)

-- Puede definir una función auxiliar maxL :: (Int, Int) -> (Int, Int) -> (Int, Int), que dados dos
-- pares de naturales que representan a dos segmentos de la recta, devuelva el segmento cuya
-- longitud sea máxima.
-- Ej. maxL (1, 2) (0, 7) = (0, 7)

-- func. auxiliar:
maxL :: (Int, Int) -> (Int, Int) -> (Int, Int)
maxL (x, y) (v, z)
    | (y - x) > (z - v) = (x, y)
    | otherwise = (v, z)
-- Nota: la longitud de un segmento (a,b) es b - a

maxSec :: [(Int, Int)] -> (Int, Int)
maxSec (x:xs) = foldr maxL x xs

-- se usa x como semilla porque se necesita una tupla (uso la primera tupla)
-- foldr le pasa las dos tuplas a maxL la inicial x y el acc

-- con lambda:
maxSec2 :: [(Int, Int)] -> (Int, Int)
maxSec2 (x:xs) = foldr (\seg acc -> maxL seg acc) x xs
-- si la lambda solo recibe los argumentos y se los pasa directamente a una función sin modificarlos,
-- (sin agregar lógica), se puede reemplazar la lambda por esa función directamente (como el primer caso)