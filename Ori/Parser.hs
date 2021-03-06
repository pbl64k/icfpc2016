module Ori.Parser (
    module Ori.Parser
    ) where

import Ori.Types

import Text.ParserCombinators.ReadP

parse :: ReadP a -> ReadS a
parse = readP_to_S

parseInt :: ReadP Int
parseInt = readS_to_P (readsPrec 10)

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
    skipSpaces
    p1 <- parsePt
    return (Seg p0 p1)

parseSegs :: ReadP Segs
parseSegs = do
    n <- parseInt
    segs <- count n (skipSpaces >> parseSeg)
    return (mkSegs n segs)

parsePolyN :: Int -> ReadP Poly
parsePolyN n = do
    pts <- count n (skipSpaces >> parsePt)
    return (mkPoly n pts)

parsePoly :: ReadP Poly
parsePoly = do
    n <- parseInt
    parsePolyN n

parsePolys :: ReadP Polys
parsePolys = do
    n <- parseInt
    polys <- count n (skipSpaces >> parsePoly)
    return (mkPolys n polys)

parseProblem :: ReadP RawProblem
parseProblem = do
    polys <- parsePolys
    skipSpaces
    segs <- parseSegs
    skipSpaces
    eof
    return (mkRp polys segs)

parseOState :: ReadP OState
parseOState = do
    a <- parsePoly
    skipSpaces
    nf <- parseInt
    fs <- count nf (skipSpaces >> parseInt >>= (\n -> count n (skipSpaces >> parseInt) >>= (\xs -> return $ mkFacet n xs)))
    skipSpaces
    b <- parsePolyN (polyN a)
    skipSpaces
    eof
    return (a, (mkFacets nf fs, b))

