module Ori.Random (
    module Ori.Random
    ) where

import Ori.Types
import System.Random

doubles :: Int -> [Double]
doubles seed = randomRs (0, 1) (mkStdGen seed)

rats :: Int -> [Rat]
rats seed = map (\x -> approxRational x 1e-30) (doubles seed)

