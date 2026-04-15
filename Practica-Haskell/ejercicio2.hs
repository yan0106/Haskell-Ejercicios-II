-- 2. Definir usando listas por comprensión las funciones:
-- a) cambios :: [a] -> [Int], que dada una lista, devuelve la lista de los índices en que la 
-- lista cambia.
-- Es decir, dada la lista S retorna la lista con los i tal que Si /= S(i+1)
-- cambios [1,1,1,3,3,1,1] = [2,4]

-- b) oblongoNumber :: [Int] que genera la lista de los números oblongos. Un número es oblongo si
-- es el producto de dos naturales consecutivos. Por ejemplo, los números [2,6,12,20,...]

oblongoNumber :: [Int]
oblongoNumber = [(x*(x+1)) | x <- [1..10]]

--c) abundantes :: [Integer] que es la lista de todos los números abundantes. Un número natural n
-- se denomina abundante si es menor que la suma de sus divisores propios. Por ejemplo, 12 y 30 