module Main where

import Lib

main :: IO ()
main = print (discardFalse (zip (map palindromes ( (map digits (removeDuplicates ( listMultiplier[1..10] [1..10]) ) ) ) ) (removeDuplicates (listMultiplier[1..10] [1..10])) ) )
-- main = print ( [2, 3, 1]  !!  ((length [2, 3, 1]) - 1) )

-- multiply everything in x by everything in y
-- does generate duplicates though
listMultiplier :: [Int] -> [Int] -> [Int]
listMultiplier [] [] = []
listMultiplier [] y = y
listMultiplier x [] = x
listMultiplier (x:xs) (y:ys) = [(x * y)] ++ (listMultiplier ([x]++xs) ys) ++ (listMultiplier xs ([y]++ys))  

-- remove duplicates in list
-- https://stackoverflow.com/questions/16108714/removing-duplicates-from-a-list-in-haskell
removeDuplicates :: [Int] -> [Int]
removeDuplicates [] = []
removeDuplicates (x:xs) 
    | elem x xs = removeDuplicates xs -- x is a duplicate
    | otherwise = x : removeDuplicates xs -- x is not duplicate

-- convert number to list digits
digits :: Int -> [Int]
digits x = digitsHelper x [] 

digitsHelper :: Int -> [Int] -> [Int]
digitsHelper x digitsList = 
    if x == 0 then digitsList
    else digitsHelper (div x 10) ((mod x 10) : digitsList )

-- palindrome detection, takes in list of digits
palindromes :: [Int] -> Bool
palindromes digits = 
    -- base case
    if (length digits == 0) || (length digits == 1) 
        then True
    -- still valid  
    else if (head digits) == (last digits) 
        then True && palindromes (tail (init digits))
    -- no longer valid
    else False

-- discard all the tuples with FALSE since they aren't palindromes
discardFalse :: [(Bool, Int)] -> [(Bool, Int)]
discardFalse list = [x | x <- list, (fst x) == True]


