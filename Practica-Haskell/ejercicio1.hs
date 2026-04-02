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
collect [(a,b)] = [(a,[b])]
collect ((x,y):xs) = insertar x y (collect xs)

-- func. auxiliar
insertar :: Ord k => k -> v -> [(k, [v])] -> [(k, [v])]
insertar x y [] = [(x, [y])]
insertar x y ((s, (lista)):resto)
    | x == s = (s, y:lista) : resto
    | x /= s = (s, lista) : insertar x y resto
