module Ori.Outp (
    module Ori.Outp
    ) where

import Ori.Types
import Data.List

showRat :: Rat -> String
showRat n =
    let
        d = denominator n
        ns = show (numerator n)
        in
            if d == 1
                then ns
                else ns ++ "/" ++ show d

showPt :: Pt -> String
showPt (V2 x y) = showRat x ++ "," ++ showRat y

showPoly :: Poly -> String
showPoly p = show (polyN p) ++ "\n" ++ intercalate "\n" (map showPt (polyPts p))

showFacet :: Facet -> String
showFacet f = show (facetN f) ++ " " ++ intercalate " " (map show (facetVertices f))

showFacets :: Facets -> String
showFacets fs = show (facetsN fs) ++ "\n" ++ intercalate "\n" (map showFacet (facetsFacets fs))

