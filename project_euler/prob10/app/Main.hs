module Main where

import Lib

-- test to see if num is prime
-- take list of primes up to sqrt(candidate)
    -- if none of them divide candidate, then we are good 
isPrime :: [Integer] -> Integer -> Bool
isPrime (p:ps) candidate = p * p > candidate || (candidate `mod` p /= 0 && isPrime ps candidate)  

-- filter the list of evens for prime using our test
primes = 2 : filter (isPrime primes) [3, 5 ..]

main :: IO ()
main = print (foldr (+) 0 (takeWhile (<= 2000000) primes))

