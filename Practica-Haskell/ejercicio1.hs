-- 1. Definir las siguientes funciones en forma recursiva:
-- a) borrarUltimo, que dada una lista borra el último elemento de la lista. No utilizar reverse, ni tail.

borrarUltimo :: [a] -> [a]
borrarUltimo [] = []
borrarUltimo [x] = []
borrarUltimo (x:xs) = x : borrarUltimo xs

-- b) collect :: [(k,v)] -> toma una lista de pares (clave, valor) y asocia cada clave única con todos los valores con
-- los que estaba apareada originalmente. Por ejemplo: collect

collect :: Ord k => [(k,v)] -> [(k,[v])]
collect [] = []
collect [(x,y)] = [(x,[y])]
collect ((x,y):xs) = insertar x y (collect xs) 
-- primero agrupa el resto y luego inserta la clave y el valor en el resto agrupado

-- func. auxiliar (cómo va a integrar la clave y el valor en una lista ya agrupada)
insertar :: Ord k => k -> v -> [(k, [v])] -> [(k, [v])]
insertar x y [] = [(x, [y])]
insertar x y ((s, (lista)):resto)
    | x == s = (s, y:lista) : resto
    | otherwise = (s, lista) : insertar x y resto  -- (si x /= s)

-- c) serie, que se comporta de la siguiente manera: serie [1,2,3] = [[],[1],[1,2],[1,2,3]]. Dar su tipo más general

serie :: [a] -> [[a]]
serie [] = [[]]
serie (x:xs) = [] : agregar x (serie xs)

-- func. auxiliar
agregar :: a -> [[a]] -> [[a]]
agregar x [] = []
agregar x (y:ys) = (x:y) : (agregar x ys)

-- d) paresIguales :: Int -> Int -> Int -> Int -> Bool, toma 4 números enteros y retorna True si de dos en dos
-- son iguales (en cualquier orden), en los demás casos retorna False. Por ejemplo: paresIguales 3 1 1 2 = False
-- paresIguales 3 1 3 1 = True, paresIguales 3 3 1 1 = True, paresIguales 3 1 1 3 = True

paresIguales :: Int -> Int -> Int -> Int -> Bool
paresIguales x y z k 
    | x == y && z == k = True
    | x == z && y == k = True
    | x == k && y == z = True
    | otherwise = False

-- de forma recursiva:
paresIguales2 :: [Int] -> Bool
paresIguales2 [] = True
paresIguales2 (x:xs)
    | pertenece x xs = paresIguales2 (borrar x xs)
    | otherwise      = False

-- func. auxiliar
borrar :: Int -> [Int] -> [Int]
borrar x [] = []
borrar x (y:ys)
    | x == y = ys
    | x /= y = y : borrar x ys

-- func. auxiliar
pertenece :: Int -> [Int] -> Bool
pertenece x [] = False
pertenece x (y:ys)
    | x == y = True
    | x /= y = pertenece x ys

-- e) isosceles :: Int -> Int -> Int -> Bool que dadas la longitud de los lados de un triángulo nos dice
-- si es un triángulo isósceles
-- dato: el triángulo Isósceles tiene 2 lados iguales

isosceles :: Int -> Int -> Int -> Bool
isosceles x y z
    | x == y && x /= z = True
    | x == z && x /= y = True
    | y == z && y /= x = True
    | otherwise        = False
-- versión estricta, si tiene 3 lados iguales no es isósceles

-- de forma recursiva:
isosceles2 :: [Int] -> Bool
isosceles2 [] = False
isosceles2 (lista)
    | contar lista == 1 = True
    | otherwise = False

-- necesito que:
-- 1. Haya exactamente un par de números iguales.
-- 2. Haya exactamente un número que sea diferente a ese par.

-- func. auxiliar
contar :: [Int] -> Int -- cuenta cuántos pares de nros. iguales hay
contar [] = 0
contar (x:xs) = repetidos x xs + contar xs
-- sumo los que son iguales a 'x' y además sigo contando en el resto

-- func. auxiliar
repetidos :: Int -> [Int] -> Int -- cuenta números repetidos
repetidos x [] = 0
repetidos x (y:ys)
    | x == y = 1 + repetidos x ys
    | x /= y = 0 + repetidos x ys

-- f) ror, que dada una lista xs y un entero n, tal que n <= length xs, rota los primeros n elementos de xs
-- a la derecha ror 3 [1,2,3,4,5] = [4,5,1,2,3]. Definir una versión recursiva de ror, sin usar drop, take ni tail

ror :: Int -> [Int] -> [Int]
ror n [] = []
ror n [x] = [x]
ror n lista = restoN n lista ++ tomarN n lista

-- func. auxiliar
tomarN :: Int -> [Int] -> [Int] -- devuevo una lista con los n elementos primeros
tomarN n [] = []
tomarN n (x:xs)
    | n == 1 = [x]
    | n > 1 = x: tomarN (n-1) xs
    | n < 1 = []

-- func. auxiliar
restoN :: Int -> [Int] -> [Int] -- devuelvo una lista con el resto
restoN n [] = []
restoN n (x:xs)
    | n == 1 = xs
    | n > 1 = restoN (n-1) xs
    | n < 1 = []