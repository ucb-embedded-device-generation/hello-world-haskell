module Main where

import Lib

main :: IO ()
main = print (divisibleByFive [1..999] + divisibleByThree [1..999] - divisibleByBoth [1..999])

-- returns sum of list of nums that is divisible by 5
divisibleByFive :: [Int] -> Int
divisibleByFive nums = sum [x | x <- nums, mod x 5 == 0]

-- same for divisible by 3
divisibleByThree :: [Int] -> Int
divisibleByThree nums = sum [x | x <- nums, mod x 3 == 0]

-- the duplicates
divisibleByBoth :: [Int] -> Int
divisibleByBoth nums = sum [x | x <- nums, mod x 3 == 0 && mod x 5 == 0]
