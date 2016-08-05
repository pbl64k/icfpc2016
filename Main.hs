module Main where

import Ori
import System.IO

--main = do
--    inp <- hGetContents stdin
--    let rps = parse parseProblem inp
--    putStrLn $ show rps

main = do
    putStrLn $ showPoly True initPoly
    putStrLn $ showFacets initFacets
    putStrLn $ showPoly False initPoly

