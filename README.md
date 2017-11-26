# What?

Consider you are falling a sleep at 2:00am, so next day for you starts
from 2:00, not from 0:00. So, if now is 2017-10-10T01:00 and you did
not sleept yet, then this is still 2017-10-09 for you.

```
>>> let now = ZonedTime (LocalTime (fromGregorian 2017 10 10) (TimeOfDay 01 00 00)) utc
>>> now
2017-10-10 01:00:00 UTC
>>> realDay (TimeOfDay 0 0 0) now
2017-10-10
>>> realDay (TimeOfDay 2 0 0) now
2017-10-09

```

This function shifts day switch to the specified time. It may be
useful for some logging software and similar stuff.
