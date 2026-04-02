-- 1. Definir las siguientes funciones en forma recursiva:
-- a) borrarUltimo, que dada una lista borra el último elemento de la lista. No utilizar reverse, ni tail.

borrarUltimo :: [a] -> [a]
borrarUltimo [] = []
borrarUltimo [x] = []
borrarUltimo (x:xs) = x : borrarUltimo xs