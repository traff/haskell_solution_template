{-# LANGUAGE TemplateHaskell #-}
import Test.Framework.TH
import Test.Framework
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2

import Test.QuickCheck
import Test.HUnit

import Data.List


main = $(defaultMainGenerator)

prop_sort1 xs = sort xs == sortBy compare xs
  where types = (xs :: [Int])

case_sort7 = sort [8, 7, 2, 5, 4, 9, 6, 1, 0, 3] @?= [0..9]

test_sort8 = error "This test deliberately contains a user error"
