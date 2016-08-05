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

