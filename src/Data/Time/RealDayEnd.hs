module Data.Time.RealDayEnd where

import Data.Time

-- | Consider you are falling a sleep at 2:00am, so next day for you
-- starts from 2:00, not from 0:00. So, if now is 2017-10-10T01:00 and
-- you did not sleept yet, then this is still 2017-10-09 for you.
realDay
  :: TimeOfDay
  -- ^ Time when user's day ends.
  -> ZonedTime
  -- ^ Time to calculate date from
  -> Day
  -- ^ Real date of given time
realDay eod' zt =
  let
    u = zonedTimeToUTC zt
    shift = if timeOfDayToTime midnight <= eod && eod < timeOfDayToTime midday
      then owlShift
      else larkShift
    shifted = addUTCTime shift u
    shiftedZ = utcToZonedTime (zonedTimeZone zt) shifted
  in localDay $ zonedTimeToLocalTime shiftedZ
  where
    owlShift = negate $ realToFrac eod
    larkShift = realToFrac $ posixDayLength - eod
    eod = timeOfDayToTime eod'
    posixDayLength :: DiffTime
    posixDayLength = fromInteger 86400
