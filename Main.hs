module Main where

import Ori
import System.IO

--main = do
--    inp <- hGetContents stdin
--    let rps = parse parseProblem inp
--    putStrLn $ show rps

--main = do
--    putStrLn $ showOState initial

--main = do
--    mapM_ (putStrLn . showPt) (map tweak [V2 0 0, V2 0 1, V2 1 1, V2 1 0])

main = do
    inp <- hGetContents stdin
    let rps = parse parseProblem inp
    let (xmin, ymin, xmax, ymax) = bBox (fst (head rps))
    let xc = (xmax - xmin) / 2 + xmin
    let yc = (ymax - ymin) / 2 + ymin
    let xax = (xc - 1%2) / 2 + 1%2
    let yax = (yc - 1%2) / 2 + 1%2
    let s1 = reflEnd (Seg (V2 xax 0) (V2 xax 1)) initial
    let s2 = reflEnd (Seg (V2 0 yax) (V2 1 yax)) s1
    putStrLn $ showOState s2

