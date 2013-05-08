#iterate over all cells of given paths to summarize the

start      = vector()
end        = vector()
Duration   = vector()
startDist  = vector()
endDist    = vector()
Height     = vector()
avgVelo    = vector()

TIME       = vector()

INDEX = which(!is.na(necks$x1Neck))
#iterate over all cells
for (j in INDEX) {
    source('~/Desktop/peakfinder/peakfinderSlow.R')
    source('~/Desktop/peakfinder/sortingPeaksSlow.R')
    TIME = c(TIME,max(t))
    start = c(start,Up$start)
    end = c(end,Up$end)
    Duration = c(Duration,Up$duration)
    startDist = c(startDist,Up$startDist)
    endDist = c(endDist,Up$endDist)
    Height = c(Height,Up$height)
    avgVelo = c(avgVelo,Up$avgVelo)    
}

obsTime = vector(length = length(start))+sum(TIME)
UpAll = data.frame(obsTime,start,end,Duration,startDist,endDist,Height,avgVelo)

#------------------------------------------------------------------------------
#down events
start      = vector()
end        = vector()
Duration   = vector()
startDist  = vector()
endDist    = vector()
Height     = vector()
avgVelo    = vector()

TIME       = vector()
#iterate over all cells
for (j in INDEX) {
    source('~/Desktop/peakfinder/peakfinderSlow.R')
    source('~/Desktop/peakfinder/sortingPeaksSlow.R')
    TIME = c(TIME,max(t))
    start = c(start,Down$start)
    end = c(end,Down$end)
    Duration = c(Duration,Down$duration)
    startDist = c(startDist,Down$startDist)
    endDist = c(endDist,Down$endDist)
    Height = c(Height,Down$height)
    avgVelo = c(avgVelo,Down$avgVelo)
}

obsTime = vector(length = length(start))+sum(TIME)
DownAll = data.frame(obsTime,start,end,Duration,startDist,endDist,Height,avgVelo)
