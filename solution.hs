{-# LANGUAGE CPP, TemplateHaskell #-}

module Main (
    main
) where

import Control.Monad (unless)
import Data.List (stripPrefix)
import System.Exit (exitFailure)



main = do
    [w] <- (map read . words) `fmap` getLine
    putStr (w)


