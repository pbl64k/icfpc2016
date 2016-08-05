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

type Segs = (Integer, [Seg])

mkSeg :: Integer -> [Seg] -> Segs
mkSeg = (,)

type Poly = (Integer, [Pt])

mkPoly :: Integer -> [Pt] -> Poly
mkPoly = (,)

type Polys = (Integer, [Poly])

mkPolys :: Integer -> [Poly] -> Polys
mkPolys = (,)

