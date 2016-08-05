module Ori.Parser (
    module Ori.Parser
    ) where

import Ori.Types

import Text.ParserCombinators.ReadP

parse :: ReadP a -> ReadS a
parse = readP_to_S

parseInteger :: ReadP Integer
parseInteger = readS_to_P (readsPrec 10)

parseRat :: ReadP Rat
parseRat = do
    num <- parseInteger
    skipSpaces
    den <- option 1 (char '/' >> skipSpaces >> parseInteger)
    if den /= 0
        then return (num % den)
        else pfail

parsePt :: ReadP Pt
parsePt = do
    x <- parseRat
    skipSpaces
    char ','
    skipSpaces
    y <- parseRat
    return (V2 x y)

parseSeg :: ReadP Seg
parseSeg = do
    p0 <- parsePt
    char ' '
    skipSpaces
    p1 <- parsePt
    return (Seg p0 p1)

parsePoly :: ReadP Poly
parsePoly = do
    n <- parseInteger
    pts <- count (fromIntegral n) (skipSpaces >> parsePt)
    return (mkPoly n pts)

parsePolys :: ReadP Polys
parsePolys = do
    n <- parseInteger
    polys <- count (fromIntegral n) (skipSpaces >> parsePoly)
    return (mkPolys n polys)


