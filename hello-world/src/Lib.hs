module Lib
    ( someFunc
    ) where

import Acme.Missiles

someFunc :: IO ()
-- someFunc = putStrLn "someFunc"
someFunc = launchMissiles
