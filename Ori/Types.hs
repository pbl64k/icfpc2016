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

mkSegs :: Integer -> [Seg] -> Segs
mkSegs = (,)

type Poly = (Integer, [Pt])

mkPoly :: Integer -> [Pt] -> Poly
mkPoly = (,)

polyN :: Poly -> Integer
polyN (n, _) = n

polyPolys :: Poly -> [Pt]
polyPolys (_, polys) = polys

type Polys = (Integer, [Poly])

mkPolys :: Integer -> [Poly] -> Polys
mkPolys = (,)

