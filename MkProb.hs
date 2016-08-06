module MkProb where

import Ori
import System.IO

main = do
    let s1 = initxy' (1%7) 1
    --let s2 = reflEnd (Seg (V2 (-2%1) 0) (V2 0 (-1))) s1
    let s2 = reflEnd (Seg (V2 0 12) (V2 11 5)) s1
    putStrLn $ showOState s2 --(smallTweakEnd s2)

--main = do
--    mapM_ (putStrLn . showPt) (map tweak [V2 0 0, V2 0 1, V2 1 1, V2 1 0])

