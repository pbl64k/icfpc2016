module Main where

import Ori
import System.IO

--main = do
--    inp <- hGetContents stdin
--    let rps = parse parseProblem inp
--    putStrLn $ show rps

--main = do
--    putStrLn $ showOState initial

main = do
    mapM_ (putStrLn . showPt) (map tweak [V2 0 0, V2 0 1, V2 1 1, V2 1 0])

