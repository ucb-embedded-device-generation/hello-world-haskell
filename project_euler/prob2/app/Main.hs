module Main where

import Lib

main :: IO ()
main = print ( answer 10 0)

-----------------------------------------------------------
-- Infinite list implementation of fibs
-----------------------------------------------------------
-- It works by first having the list be [1, 2].
-- Then, it attaches the rest of the list recursively
-- by adding eltwise every element in fibs to the element before it in fibs.
-- Note that zipWith is basically map, combines two lists with a function. 
-- The tail fibs part does the previous thingy.
-- e.g. [1, 2, 3, 4, 5, 6, ...] is list,
--      [2, 3, 4, 5, 6, ...] is tail list (removes first element)
-- Basically, offset one list by 1.
fibs = 1 : 2 : zipWith (+) fibs (tail fibs)

----------------------------------------------------------
-- Filter out relevant fib values and sum
---------------------------------------------------------
answer :: Int -> Int -> Int
answer index sum = 
    if fibs!!index > 100 then sum
    else answer (index + 1) (sum + (fibs!!index))

-----------------------------------------------------------
-- My implementation of fib, but it's not an infinite list
-----------------------------------------------------------
fib :: Int -> Int
fib n = 
    if n <= 3 then n
    else fib (n - 1) + fib (n - 2)
