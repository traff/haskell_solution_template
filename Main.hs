{-# LANGUAGE CPP, TemplateHaskell #-}

module Main (
    main,
    passed
) where

import Control.Monad (unless)
import Data.List (stripPrefix)
import System.Exit (exitFailure)

#ifdef MAIN_FUNCTION
import Test.Framework.TH
import Test.Framework
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2

import Test.QuickCheck
import Test.HUnit

import Data.List
#endif


passed ::  [Int] -> Int -> Int
passed scores k 
    | k == 0 
                    = 0
    | (scores !! (k-1)) == 0 
                    = passed scores (k-1)
	| k-1 >= (length scores)-1 
					= k 

    | (scores !! (k-1)) == (scores !! k) 
    				= passed scores (k+1)


	| otherwise  = k

exeMain = do
    [n, k] <- (map read . words) `fmap` getLine
    scores <- (map read . words) `fmap` getLine
    print (passed scores k)

-- Tests --

#ifdef MAIN_FUNCTION
testMain = $(defaultMainGenerator)

case_1 = passed [10, 9, 8, 7, 7, 7, 5, 5] 5 @?= 6 

case_2 = passed [0, 0, 0, 0] 2 @?= 0

case_3 = passed [0] 1 @?= 0


#endif

#ifndef MAIN_FUNCTION
#define MAIN_FUNCTION exeMain
#endif
main = MAIN_FUNCTION