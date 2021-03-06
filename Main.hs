module Main where

import Ori
import System.IO

main = do
    inp <- hGetContents stdin
    let rps = parse parseProblem inp
    let (xmin, ymin, xmax, ymax) = bBox (fst (head rps))
    let xw = xmax - xmin
    let yh = ymax - ymin
    let xc = xw / 2 + xmin
    let yc = yh / 2 + ymin
    let xw'2 = (min xw 1) / 2
    let yh'2 = (min yh 1) / 2
    let xax = (xc - xw'2) / 2 + xw'2
    let yax = (yc - yh'2) / 2 + yh'2
    --hPutStrLn stderr $ show xw'2
    --hPutStrLn stderr $ show yh'2
    --hPutStrLn stderr $ show xw
    --hPutStrLn stderr $ show yh
    --hPutStrLn stderr $ showOState (initxy' xw yh)
    --hPutStrLn stderr "end debug output."
    let s1 = reflEnd (Seg (V2 xax 0) (V2 xax 1)) (initxy' xw yh)
    let s2 = reflEnd (Seg (V2 0 yax) (V2 1 yax)) s1
    putStrLn $ showOState s2

