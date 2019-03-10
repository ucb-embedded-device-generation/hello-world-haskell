module Main where

import Lib

main :: IO ()
main = print ( digits 123456789 [] )

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
digits :: Int -> [Int] -> [Int]
digits x digitsList = 
    if x == 0 then digitsList
    else digits (div x 10) ((mod x 10) : digitsList )

-- palindrome detection, takes in list of digits
-- palindromes :: [Int] -> Bool
-- palindromes = False
