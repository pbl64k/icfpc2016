module Ori.Misc (
    module Ori.Misc
    ) where

import Ori.Types

initPoly :: Poly
initPoly = mkPoly 4 [V2 0 0, V2 1 0, V2 1 1, V2 0 1]

initFacets :: Facets
initFacets = mkFacets 1 [mkFacet 4 [0, 1, 2, 3]]

initial :: OState
initial = (initPoly, (initFacets, initPoly))

init' :: Rat -> Rat -> OState
init' xl yl =
    if xl < 1%1 && yl < 1%1
        then initxy xl yl
        else
            if xl < 1%1
                then initx xl
                else
                    if yl < 1%1
                        then inity yl
                        else initial

initx :: Rat -> OState
initx xl = (p, (mkFacets 2 [mkFacet 4 [0, 3, 4, 1], mkFacet 4 [1, 4, 5, 2]], p'))
    where
        p = mkPoly 6 [V2 0 0, V2 xl 0, V2 1 0, V2 0 1, V2 xl 1, V2 1 1]
        p' = mkPoly 6 [V2 0 0, V2 xl 0, V2 (2 * xl - 1) 0, V2 0 1, V2 xl 1, V2 (2 * xl - 1) 1]

inity :: Rat -> OState
inity yl = (p, (mkFacets 2 [mkFacet 4 [0, 2, 3, 1], mkFacet 4 [2, 4, 5, 3]], p'))
    where
        p = mkPoly 6 [V2 0 0, V2 1 0, V2 0 yl, V2 1 yl, V2 0 1, V2 1 1]
        p' = mkPoly 6 [V2 0 0, V2 1 0, V2 0 yl, V2 1 yl, V2 0 (2 * yl - 1), V2 1 (2 * yl - 1)]

initxy :: Rat -> Rat -> OState
initxy xl yl = (p, (mkFacets 4 [mkFacet 4 [0, 3, 4, 1], mkFacet 4 [3, 6, 7, 4], mkFacet 4 [4, 7, 8, 5], mkFacet 4 [1, 4, 5, 2]], p'))
    where
        p = mkPoly 9 [V2 0 0, V2 xl 0, V2 1 0, V2 0 yl, V2 xl yl, V2 1 yl, V2 0 1, V2 xl 1, V2 1 1]
        p' = mkPoly 9 [V2 0 0, V2 xl 0, V2 (2 * xl - 1) 0, V2 0 yl, V2 xl yl, V2 (2 * xl - 1) yl, V2 0 (2 * yl - 1), V2 xl (2 * yl - 1), V2 (2 * xl - 1) (2 * yl - 1)]

prime1 :: Integer
--prime1 = 3036778097213642195103190478643368315713063094843382010429628306506249071647
--prime1 = 73990565474352683215012157463992253223
--prime1 = 25267209622774746135892534069
--prime1 = 1175982507355577618874031
--prime1 = 872217209062834066423
--prime1 = 7494468750184990933
--prime1 = 42012923523829189
--prime1 = 197270390357783
prime1 = 10681897909304407

prime2 :: Integer
--prime2 = 21963974069798849695986806315470590742217552950948984435878934777554350320133
--prime2 = 303534997543846486096573445609329234633
--prime2 = 13838171772762106613089027627
--prime2 = 5102988548796626814061999
--prime2 = 4598457348228492701237
--prime2 = 5018966348183996779
--prime2 = 42012923523829189
--prime2 = 244689765343477
prime2 = 3308679658631953

