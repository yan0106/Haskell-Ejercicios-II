{- 4. Dado el siguiente tipo algebraico:

data Aexp = Num Int | Prod Aexp Aexp | Div Aexp Aexp

a) Defina un evaluador eval :: Aexp -> Int. ¿Cómo maneja los errores de división por 0?
b) Defina un evaluador seval :: Aexp -> Maybe Int. -}

data Aexp = Num Int | Prod Aexp Aexp | Div Aexp Aexp

eval :: Aexp -> Int
eval (Num n)      = n
eval (Prod a b) = eval a * eval b
eval (Div a b)  = if (intB == 0) then error "No se puede dividir por 0" 
                    else div intA intB
                    where intB = (eval b)
                          intA = (eval a)
                
-- aplico Pattern Matching para desarmar el paquete, con ( ) que "abre" el tipo de dato algebraico Aexp.
-- llamo de forma recursiva a (eval a) o (eval b) para que me devuelva n = Int
-- manejo el error de dividir por 0 con un if 

seval :: Aexp -> Maybe Int
seval (Num n) = Just n
seval (Prod a b) = case (seval a, seval b) of
    (Just intA, Just intB) -> Just (intA * intB)
    _                      -> Nothing
seval (Div a b) = case (seval a, seval b) of
    (Just intA, Just intB) -> if intB == 0 
                              then Nothing 
                              else Just (div intA intB) 
    _                      -> Nothing
    