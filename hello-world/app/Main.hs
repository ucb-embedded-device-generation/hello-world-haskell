module Main where

import Lib

main :: IO ()
main = do
	putStrLn("Not hello world!")
	putStrLn("Please enter your name.")
	name <- getLine
	putStrLn("Hello " ++ name)


-- Some useful stack commands
-- 1. stack new: create a new project
-- 2. stack build: build your project
-- 3. stack exec: run your executable
-- 4. stack test: run your test suites
-- 5. 
