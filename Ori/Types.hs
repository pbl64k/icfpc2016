module Ori.Types (
    module Ori.Types,
    module Data.Ratio,
    module Linear.V2
    ) where

import Data.Ratio
import Linear.V2

type Rat = Ratio Integer

type Pt = V2 Rat

data Seg = Seg !Pt !Pt

type Segs = (Int, [Seg])

mkSegs :: Int -> [Seg] -> Segs
mkSegs = (,)

type Poly = (Int, [Pt])

mkPoly :: Int -> [Pt] -> Poly
mkPoly = (,)

polyN :: Poly -> Int
polyN = fst

polyPts :: Poly -> [Pt]
polyPts = snd

type Polys = (Int, [Poly])

mkPolys :: Int -> [Poly] -> Polys
mkPolys = (,)

type Facet = (Int, [Int])

mkFacet :: Int -> [Int] -> Facet
mkFacet = (,)

facetN :: Facet -> Int
facetN = fst

facetVertices :: Facet -> [Int]
facetVertices = snd

type Facets = (Int, [Facet])

mkFacets :: Int -> [Facet] -> Facets
mkFacets = (,)

facetsN :: Facets -> Int
facetsN = fst

facetsFacets :: Facets -> [Facet]
facetsFacets = snd

