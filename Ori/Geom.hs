module Ori.Geom (
    module Ori.Geom
    ) where

import Ori.Types

reflectPt :: Seg -> Pt -> Pt
reflectPt (Seg p0@(V2 x0 y0) p1) (V2 x y) =
    if p0 == p1
        then error "reflectPt expects a line, got two copies of the same point instead"
    else
        let
            (V2 dx dy) = p1 - p0
            d = dx * dx + dy * dy
            a = (dx * dx - dy * dy) / d
            b = 2 * dx * dy / d
            in V2
                (a * (x - x0) + b * (y - y0) + x0)
                (b * (x - x0) - a * (y - y0) + y0)

isSym :: Seg -> Pt -> Pt -> Bool
isSym l p0 p1 = p0 == reflectPt l p1

