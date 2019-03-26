module Main where

import Lib

main :: IO ()
main = print( maximum (discardFalse (map palindromes listMultiplier)))  
-- main = print (discardNonMultiples  ( discardFalse (zip (map palindromes ( (map digits [101..999] ) ) ) ([101..999]) ) ) [100..999] )

-- 1. generate all palindromes from 101 to 999999
-- 2. mod by numbers from 100 to 999, see if you get 0
-- note: go backwards from 999999 to 101
-- nah, this means you have to factor stuff, don't do this


-- discardNonMultiples :: [Int] -> [Int] -> [Int]
-- discardNonMultiples candidates divisors = 
--     [ a | b <- divisors, a <- candidates, mod a b == 0 ]

-------------------------------------------------------------------------------
-- Old method, I think it was super inefficient because it took forever to run
-- Only terminated for input of [1..10]
-------------------------------------------------------------------------------
--main = print (discardFalse (zip (map palindromes ( (map digits (removeDuplicates ( listMultiplier[100..999] [100..999]) ) ) ) ) (removeDuplicates (listMultiplier[100..999] [100..999])) ) )
-- main = print ( [2, 3, 1]  !!  ((length [2, 3, 1]) - 1) )

-- multiply everything in x by everything in y
-- does generate duplicates though
listMultiplier :: [Int]
listMultiplier = [x * y | x <- [999,998..100], y <- [x-1,x-2..100]]
-- listMultiplier :: [Int] -> [Int] -> [Int]
-- listMultiplier [] [] = []
-- listMultiplier [] y = y
-- listMultiplier x [] = x
-- listMultiplier (x:xs) (y:ys) = [(x * y)] ++ (listMultiplier ([x]++xs) ys) ++ (listMultiplier xs ([y]++ys))  

-- remove duplicates in list
-- https://stackoverflow.com/questions/16108714/removing-duplicates-from-a-list-in-haskell
-- removeDuplicates :: [Int] -> [Int]
-- removeDuplicates [] = []
-- removeDuplicates (x:xs) 
--     | elem x xs = removeDuplicates xs -- x is a duplicate
--     | otherwise = x : removeDuplicates xs -- x is not duplicate

-- -- convert number to list digits
-- digits :: Int -> [Int]
-- digits x = digitsHelper x [] 

-- digitsHelper :: Int -> [Int] -> [Int]
-- digitsHelper x digitsList = 
--     if x == 0 then digitsList
--     else digitsHelper (div x 10) ((mod x 10) : digitsList )

-- -- palindrome detection, takes in list of digits
palindromes :: Int -> (Bool, Int)
palindromes x = (show x == reverse (show x), x)
-- palindromes :: [Int] -> Bool
-- palindromes digits = 
--     -- base case
--     if (length digits == 0) || (length digits == 1) 
--         then True
--     -- still valid  
--     else if (head digits) == (last digits) 
--         then True && palindromes (tail (init digits))
--     -- no longer valid
--     else False

-- discard all the tuples with FALSE since they aren't palindromes
discardFalse :: [(Bool, Int)] -> [Int]
discardFalse list = [(snd x) | x <- list, (fst x) == True]

-- -- find max value from list
-- max :: [Int] -> [Int]
-- max [x] = x
-- max ()
-- max (x:xs) | (max xs) > x = max xs
--            | otherwise        = x











