#iterate over all cells of given paths to summarize the

start      = vector()
end        = vector()
Duration   = vector()
startDist  = vector()
endDist    = vector()
Height     = vector()
avgVelo    = vector()
corrCoeff1 = vector()
corrCoeff2 = vector()
aMTlength1 = vector()
aMTlength2 = vector()
distaMT1start = vector()
distaMT1end   = vector()
distaMT2start = vector()
distaMT2end   = vector()

TIME       = vector()

INDEX = which(!is.na(necks$x1Neck))
#iterate over all cells
for (j in INDEX) {
  source('~/Desktop/peakfinder/peakFinder.R')
  source('~/Desktop/peakfinder/sortingPeaks.R')
  #source('~/Desktop/peakfinder/peakFinderPlot.R')
  TIME = c(TIME,max(t))
  start = c(start,Up$start)
  end = c(end,Up$end)
  Duration = c(Duration,Up$duration)
  startDist = c(startDist,Up$startDist)
  endDist = c(endDist,Up$endDist)
  Height = c(Height,Up$height)
  avgVelo = c(avgVelo,Up$avgVelo)
  corrCoeff1 = c(corrCoeff1,Up$corrCoeff1)
  corrCoeff2 = c(corrCoeff2,Up$corrCoeff2)
  aMTlength1 = c(aMTlength1,Up$aMTlength1)
  aMTlength2 = c(aMTlength2,Up$aMTlength2)
  distaMT1start = c(distaMT1start,Up$distaMT1start)
  distaMT1end   = c(distaMT1end,Up$distaMT1end)
  distaMT2start = c(distaMT2start,Up$distaMT2start)
  distaMT2end   = c(distaMT2end,Up$distaMT2end)
  
}

obsTime = vector(length = length(start))+sum(TIME)
UpAll = data.frame(obsTime,start,end,Duration,startDist,endDist,Height,avgVelo,corrCoeff1,corrCoeff2,
                   aMTlength1,aMTlength2,distaMT1start,distaMT1end,distaMT2start,distaMT2end)

#------------------------------------------------------------------------------
#down events
start      = vector()
end        = vector()
Duration   = vector()
startDist  = vector()
endDist    = vector()
Height     = vector()
avgVelo    = vector()
corrCoeff1 = vector()
corrCoeff2 = vector()
aMTlength1 = vector()
aMTlength2 = vector()
distaMT1start = vector()
distaMT1end   = vector()
distaMT2start = vector()
distaMT2end   = vector()

TIME       = vector()
#iterate over all cells
for (j in INDEX) {
  source('~/Desktop/peakfinder/peakFinder.R')
  source('~/Desktop/peakfinder/sortingPeaks.R')
  #source('~/Desktop/peakfinder/peakFinderPlot.R')
  TIME = c(TIME,max(t))
  start = c(start,Down$start)
  end = c(end,Down$end)
  Duration = c(Duration,Down$duration)
  startDist = c(startDist,Down$startDist)
  endDist = c(endDist,Down$endDist)
  Height = c(Height,Down$height)
  avgVelo = c(avgVelo,Down$avgVelo)
  corrCoeff1 = c(corrCoeff1,Down$corrCoeff1)
  corrCoeff2 = c(corrCoeff2,Down$corrCoeff2)
  aMTlength1 = c(aMTlength1,Down$aMTlength1)
  aMTlength2 = c(aMTlength2,Down$aMTlength2)
  distaMT1start = c(distaMT1start,Down$distaMT1start)
  distaMT1end   = c(distaMT1end,Down$distaMT1end)
  distaMT2start = c(distaMT2start,Down$distaMT2start)
  distaMT2end   = c(distaMT2end,Down$distaMT2end)
}

obsTime = vector(length = length(start))+sum(TIME)
DownAll = data.frame(obsTime,start,end,Duration,startDist,endDist,Height,avgVelo,corrCoeff1,corrCoeff2,
                     aMTlength1,aMTlength2,distaMT1start,distaMT1end,distaMT2start,distaMT2end)
