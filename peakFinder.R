#script to detect pulling and backwards moving events in the daughter spindle pole path over time.
#within a sliding window the maximum and minimum values are detected. depending on their timedifferences this
#spikes are grouped and the maxima are connected with their nearest minima. Such a connection represents
#a candidate event and are reported in a dataframe.
#basic parameters are giving in the master file from which this script is run.
#
#Input: path to the cell of interest
#       parameters: window size, maximal spike distance
#
#Output:  dataframes for pulling and backward moving events
#         UpCand and DownCand
#-------------------------------------------------------------------------
#calculate distances of SPBs and aMTs
pixel = 0.077474

#read the jth datafile from the vector paths
a = read.table(paths[j], header = TRUE)
#time vector
t = (0:(length(a$xdSPB) - 1))*necks$deltaT[j]/60
#script to calc distances
source('fast_imaging/SPBposDPG.R')
#------------------------------------------------------------------------
#detect pulling events
frames = deltaT*60/necks[j,]$deltaT

timeMax     = vector()
peaks       = vector()
timeMin     = vector()
troughs     = vector()

timeMaxaMT1 = vector()
peaksaMT1   = vector()
timeMinaMT1 = vector()
troughsaMT1 = vector()

timeMaxaMT2 = vector()
peaksaMT2   = vector()
timeMinaMT2 = vector()
troughsaMT2 = vector()

#sliding window iterating along the distance path of the dSPB distance path
for (i in 1:(length(distD) - frames)) {
  time  = t[i:(i+frames-1)]
  d     = distD[i:(i+frames-1)]
  daMT1 = distDaMT1[i:(i+frames-1)]
  daMT2 = distDaMT2[i:(i+frames-1)]
  #peaks and troughs of the dSPB track
  if (length(which(!is.na(d)))>1) {
    peakIndex   = which(d == max(d, na.rm = T))
    
    timeMax     = c(timeMax,time[peakIndex])
    peaks       = c(peaks,d[peakIndex])
    
    troughIndex = which(d == min(d, na.rm = T))
    
    timeMin     = c(timeMin,time[troughIndex])
    troughs     = c(troughs,d[troughIndex])
  }
  #peaks and troughs of the daMT1 track
  if (length(which(!is.na(daMT1))) > 1){
    peakIndexaMT   = which(daMT1 == max(daMT1, na.rm = T))
    
    timeMaxaMT1    = c(timeMaxaMT1,time[peakIndexaMT])
    peaksaMT1      = c(peaksaMT1,daMT1[peakIndexaMT])
    
    troughIndexaMT = which(daMT1 == min(daMT1,na.rm = T))
    
    timeMinaMT1    = c(timeMinaMT1,time[troughIndexaMT])
    troughsaMT1    = c(troughsaMT1,daMT1[troughIndexaMT])
  }
  #peaks and troughs of the daMT2 track
  if (length(which(!is.na(daMT2)))>1) {
    peakIndexaMT   = which(daMT2 == max(daMT2, na.rm = T))
    
    timeMaxaMT2    = c(timeMaxaMT2,time[peakIndexaMT])
    peaksaMT2      = c(peaksaMT2,daMT2[peakIndexaMT])
    
    troughIndexaMT = which(daMT2 == min(daMT2,na.rm = T))
    
    timeMinaMT2    = c(timeMinaMT2,time[troughIndexaMT])
    troughsaMT2    = c(troughsaMT2,daMT2[troughIndexaMT])
  }
}
#sort out dublicates
#--------------------------------------------------------------------
#dSPB peaks
Peaks    = vector()
Peaks[1] = peaks[1]
TimeMax  = vector()
TimeMax  = timeMax[1]
count = 1
for (i in 2:length(peaks)) {
  if (timeMax[i] != TimeMax[count] & peaks[i] != Peaks[count]) {
    count = count + 1
    TimeMax[count] = timeMax[i]
    Peaks[count]   = peaks[i]
  }
}
#dSPB troughs
Troughs    = vector()
Troughs[1] = troughs[1]
TimeMin    = vector()
TimeMin[1] = timeMin[1]
count = 1
for (i in 2:length(troughs)){
  if (timeMin[i] != TimeMin[count] & troughs[i] != Troughs[count]) {
    count = count + 1
    TimeMin[count] = timeMin[i]
    Troughs[count] = troughs[i]
  }
}
#daMT1 peaks
PeaksaMT1      = vector()
PeaksaMT1      = peaksaMT1[1]
TimeMaxaMT1    = vector()
TimeMaxaMT1[1] = timeMaxaMT1[1]
count = 1
for (i in 2:length(peaksaMT1)) {
  if (timeMaxaMT1[i] != TimeMaxaMT1[count] & peaksaMT1[i] != PeaksaMT1[count]) {
    count = count + 1
    TimeMaxaMT1[count] = timeMaxaMT1[i]
    PeaksaMT1[count]   = peaksaMT1[i]
  }
}
#daMT1 troughs
TroughsaMT1     = vector()
TroughsaMT1[1]  = troughsaMT1[1]
TimeMinaMT1     = vector()
TimeMinaMT1[1]  = timeMinaMT1[1]
count = 1
for(i in 2:length(troughsaMT1)) {
  if (timeMinaMT1[i] != TimeMinaMT1[count] & troughsaMT1[i] != TroughsaMT1[count]) {
    count = count + 1
    TimeMinaMT1[count] = timeMinaMT1[i]
    TroughsaMT1[count] = troughsaMT1[i]
  }
}

if (length(timeMaxaMT2)>0) {
  #daMt2 peaks
  PeaksaMT2      = vector()
  PeaksaMT2      = peaksaMT2[1]
  TimeMaxaMT2    = vector()
  TimeMaxaMT2[1] = timeMaxaMT2[1]
  count = 1
  for (i in 2:length(peaksaMT2)) {
    if (timeMaxaMT2[i] != TimeMaxaMT2[count] & peaksaMT2[i] != PeaksaMT2[count]) {
      count = count + 1
      TimeMaxaMT2[count] = timeMaxaMT2[i]
      PeaksaMT2[count]   = peaksaMT2[i]
    }
  }
  #daMT2 troughs
  TroughsaMT2     = vector()
  TroughsaMT2[1]  = troughsaMT2[1]
  TimeMinaMT2     = vector()
  TimeMinaMT2[1]  = timeMinaMT2[1]
  count = 1
  for(i in 2:length(troughsaMT2)) {
    if (timeMinaMT2[i] != TimeMinaMT2[count] & troughsaMT2[i] != TroughsaMT2[count]) {
      count = count + 1
      TimeMinaMT2[count] = timeMinaMT2[i]
      TroughsaMT2[count] = troughsaMT2[i]
    }
  }
}

#-----------------------------------------------------------------------
#count consectuive steps in hight change in the same direction
diffTimeMin = diff(TimeMin)
diffTroughs = diff(Troughs)

diffTimeMax = diff(TimeMax)
diffPeaks   = diff(Peaks)

count = 1
col = 1

timesMin = matrix(NA,nr = 100,nc = 30)
distMin  = matrix(NA,nr = 100,nc = 30)
timesMax = matrix(NA,nr = 100,nc = 30)
distMax  = matrix(NA,nr = 100,nc = 30)

#sort peaks by their distance in time
for (i in 2:length(Troughs)) {
  if (TimeMin[i] - TimeMin[i-1] <= dt) {
    timesMin[count,col] = TimeMin[i-1]
    distMin[count,col]  = Troughs[i-1]
    count = count + 1
  }else{
    timesMin[count,col] = TimeMin[i-1]
    distMin[count,col]  = Troughs[i-1]
    col = col + 1
    count = 1
  }
  if (i == length(Troughs)) {
    if (TimeMin[i] - TimeMin[i-1] <= dt) {
      timesMin[count,col] = TimeMin[i]
      distMin[count,col]  = Troughs[i]
    }else{
      timesMin[1,col] = TimeMin[i]
      distMin[1,col]  = Troughs[i]
    }
  }
}
count = 1
col = 1
for (i in 2:length(Peaks)) {
  if (TimeMax[i] - TimeMax[i-1] <= dt) {
    timesMax[count,col] = TimeMax[i-1]
    distMax[count,col]  = Peaks[i-1]
    count = count + 1
  }else{
    timesMax[count,col] = TimeMax[i-1]
    distMax[count,col]  = Peaks[i-1]
    col = col + 1
    count = 1
  }
  if (i == length(Peaks)) {
    if (TimeMax[i] - TimeMax[i-1] <= dt) {
      timesMax[count,col] = TimeMax[i]
      distMax[count,col]  = Peaks[i]
    }else{
      timesMax[1,col] = TimeMax[i]
      distMax[1,col]  = Peaks[i]
    }
  }
}
#--------------------------------------------------------------------------
#determine beginning and ending of peaks
maxs     = length(which(!is.na(distMax[1,])))
NoCol    = length(timesMin)/dim(timesMin)[2]
colNames = c('start','end','duration','startDist','endDist','height','avgVelo','corrCoeff1','corrCoeff2',
             'aMTlength1','aMTlength2','distaMT1start','distaMT1end','distaMT2start','distaMT2end')
UpCand   = as.data.frame(matrix(NA,nr = 30, nc = length(colNames)))
DownCand = as.data.frame(matrix(NA,nr = 30, nc = length(colNames)))
colnames(UpCand)   = colNames
colnames(DownCand) = colNames
countUp   = 0
countDown = 0

for (i in 1:maxs) {
  dist = distMax[which(!is.na(distMax[,i])),i]
  time = timesMax[which(!is.na(timesMax[,i])),i]
  #forward movement
  lower = which(timesMin < min(time))
  if (length(lower > 0)) {
    lowerMax = max(timesMin[lower])
    tMin = min(time) - lowerMax
    if (tMin < dt) {
      countUp = countUp + 1
      index = which(timesMin == lowerMax)
      col = ceiling(index/NoCol)
      
      UpCand$start[countUp]      = timesMin[which(distMin[,col] == min(distMin[,col],na.rm = T)),col]
      UpCand$end[countUp]        = time[which(dist == max(dist))]
      UpCand$duration[countUp]   = UpCand$end[countUp] - UpCand$start[countUp]
      UpCand$startDist[countUp]  = distMin[which(distMin[,col] == min(distMin[,col],na.rm = T)),col]
      UpCand$endDist[countUp]    = max(dist)
      UpCand$height[countUp]     = max(dist) - distMin[which(distMin[,col] == min(distMin[,col],na.rm = T)),col]
      UpCand$avgVelo[countUp]    = UpCand$height[countUp]/(UpCand$end[countUp] - UpCand$start[countUp])
      indexaMTstart = which(t==UpCand$start[countUp])
      indexaMTend   = which(t==UpCand$end[countUp])
      UpCand$distaMT1start[countUp] = distDaMT1[indexaMTstart]
      UpCand$distaMT1end[countUp]   = distDaMT1[indexaMTend]  
      indexaMTstart = which(t == UpCand$start[countUp])
      indexaMTend   = which(t == UpCand$end[countUp])
      UpCand$distaMT2start[countUp] = distDaMT2[indexaMTstart]
      UpCand$distaMT2end[countUp]   = distDaMT2[indexaMTend]
      
#       segments(time[which(dist == max(dist))],max(dist),
#                timesMin[which(distMin[,col] == min(distMin[,col],na.rm = T)),col],
#                distMin[which(distMin[,col]  == min(distMin[,col],na.rm = T)),col], lwd = 3, col = 'darkseagreen')
    }
  }
  #backward movement
  upper = which(timesMin > max(time))
  if (length(upper) > 0) {
    upperMin = min(timesMin[upper])
    tMin = upperMin - max(time)
    if (tMin < dt) {
      index = which(timesMin == upperMin)
      col = ceiling(index/NoCol)
        
      if(timesMin[which(distMin[,col] == min(distMin[,col],na.rm = T)),col] > max(time)) {
        countDown = countDown + 1
        
        DownCand$start[countDown]      = time[which(dist == max(dist))]
        DownCand$end[countDown]        = timesMin[which(distMin[,col] == min(distMin[,col],na.rm = T)),col]
        DownCand$duration[countDown]   = DownCand$end[countDown] - DownCand$start[countDown]
        DownCand$startDist[countDown]  = distMin[which(distMin[,col] == min(distMin[,col],na.rm = T)),col]
        DownCand$endDist[countDown]    = max(dist)
        DownCand$height[countDown]     = DownCand$startDist[countDown] - DownCand$endDist[countDown]
        DownCand$avgVelo[countDown]    = DownCand$height[countDown]/DownCand$duration[countDown]
        indexaMTstart = which(t==DownCand$start[countDown])
        indexaMTend   = which(t==DownCand$end[countDown])
        DownCand$distaMT1start[countDown] = distDaMT1[indexaMTstart]
        DownCand$distaMT1end[countDown]   = distDaMT1[indexaMTend]  
        indexaMTstart = which(t == DownCand$start[countDown])
        indexaMTend   = which(t == DownCand$end[countDown])
        DownCand$distaMT2start[countDown] = distDaMT2[indexaMTstart]
        DownCand$distaMT2end[countDown]   = distDaMT2[indexaMTend]
          
#         segments(time[which(dist == max(dist))], max(dist),
#                  timesMin[which(distMin[,col] == min(distMin[,col],na.rm = T)),col],
#                  distMin[which(distMin[,col]  == min(distMin[,col],na.rm = T)),col], lwd = 3, col = 'darkblue')
      }
    }
  }
}