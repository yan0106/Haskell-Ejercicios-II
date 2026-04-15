-- 2. Definir usando listas por comprensión las funciones:
-- a) cambios :: [a] -> [Int], que dada una lista, devuelve la lista de los índices en que la 
-- lista cambia.
-- Es decir, dada la lista S retorna la lista con los i tal que Si /= S(i+1)
-- cambios [1,1,1,3,3,1,1] = [2,4]

-- b) oblongoNumber :: [Int] que genera la lista de los números oblongos. Un número es oblongo si
-- es el producto de dos naturales consecutivos. Por ejemplo, los números [2,6,12,20,...]

oblongoNumber :: [Int]
oblongoNumber = [x*(x+1) | x <- [1..]] --genera una lista infinita

--c) abundantes :: [Integer] que es la lista de todos los números abundantes. Un número natural n
-- se denomina abundante si es menor que la suma de sus divisores propios. Por ejemplo, 12 y 30 son abundantes
-- pero 5 y 28 no lo son. Por ejemplo, abundantes = [12,18,20,24,30,36..]

abundantes :: [Integer]
abundantes = [n | n <- [1..], n < sum (divisores n [1..n-1])]

-- 'n <- [1..]', genera el n natural
-- 'n < sum (divisores n [1..n-1])', evalúa la condición. Voy de [1..n-1] porque es el rango de los 
-- divisores propios del número.
-- los sumo con 'sum'

-- n < (sum divisores n)
-- dp: mod n d == 0

-- función aux.
divisores :: Integer -> [Integer] -> [Integer]
divisores n [] = []
divisores n (x:xs)
    | mod n x == 0 = x : divisores n xs
    | otherwise = divisores n xs

-- d) eco, que devuelve la cadena obtenida a partir de la cadena xs repitiendo cada elemento tantas veces como
-- indica su posición. Por ejemplo: eco "hola" = "hoolllaaaa"

eco :: [Char] -> [Char]
eco xs = [ c | (x, n) <- myzip xs [1..], c <- repetirLetra n x]

--func. auxiliar
myzip :: [a] -> [b] -> [(a, b)]
myzip [] [] = []
myzip _ [] = []
myzip [] _ = []
myzip (x:xs) (z:zs) = (x,z) : myzip xs zs

-- func. auxiliar
repetirLetra :: Int -> Char -> [Char] -- repite el carácter x tantas veces como indique n
repetirLetra 0 x = []
repetirLetra n x
    | n >= 1 = x : repetirLetra (n-1) x
    | n < 1 = []

