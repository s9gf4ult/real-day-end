module Main where

import Data.Time
import Data.Time.RealDayEnd
import Test.QuickCheck.Instances ()
import Test.Tasty
import Test.Tasty.QuickCheck

propLocalDay :: ZonedTime -> Bool
propLocalDay zt
  = (localDay $ zonedTimeToLocalTime zt)
  == realDay (TimeOfDay 0 0 0) zt

main :: IO ()
main = defaultMain $ testProperty "00:00 works as localDay" propLocalDay
