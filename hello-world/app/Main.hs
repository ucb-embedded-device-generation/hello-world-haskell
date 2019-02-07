module Main where

import Lib

main :: IO ()
main = do
	putStrLn("Not hello world!")
	putStrLn("Please enter your name.")
	name <- getLine
	putStrLn("Hello " ++ name)
