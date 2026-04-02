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

agregar :: a -> [[a]] -> [[a]]
agregar x [] = []
agregar x (y:ys) = (x:y) : (agregar x ys)

-- d) paresIguales :: Int -> Int -> Int -> Int -> Bool, toma 4 números enteros y retorna True si de dos en dos
-- son iguales (en cualquier orden), en los demás casos retorna False. Por ejemplo: paresIguales 3 1 1 2 = False
-- paresIguales 3 1 3 1 = True, paresIguales 3 3 1 1 = True, paresIguales 3 1 1 3 = True

