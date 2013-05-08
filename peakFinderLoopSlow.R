#loop over all cells of all three strains to calculate the events and all associated numbers
#Input:only the file paths and the filter criteria
#Output:  A list per strain containing lists for each single cell
#         reported are the data frame with all the single events and
#         mean values + sd and total number of events and events per time
#-------------------------------------------------------------------------------
#set working directory
setwd('~/Dropbox/R/data/')

#size of the sliding window in minutes
deltaT = 0.5
#maximal time (min) between two found spikes to be considered to belong together
dt = 0.4
#height treshold of pulling events in microns
height = 0.4
#maximal duration of one event in minutes
duration = 6
#maximal average velocity during the event in µm/min
avg = 3

# paths & neck coords wild type
source('slow_imaging/yJC5919/yJC5919_paths.R')
#run the looping script
source('~/Desktop/peakfinder/peakFinderLoopFunctionSlow.R')
UpAll -> UpAllyJC5919
DownAll -> DownAllyJC5919

UpAllyJC5919Mean = apply(UpAllyJC5919,2,mean,na.rm = T)
nyJC5919 = length(which(!is.na(UpAllyJC5919[,2])))
eventsyJC5919 = nyJC5919/UpAllyJC5919Mean[1]

#kar9 mutant
source('slow_imaging/Kar9/Kar9_paths.R')
#run the looping script
source('~/Desktop/peakfinder/peakFinderLoopFunctionSlow.R')
UpAll -> UpAllKar9
DownAll -> DownAllKar9

UpAllKar9Mean = apply(UpAllKar9,2,mean,na.rm = T)
nKar9 = length(which(!is.na(UpAllKar9[,2])))
eventsKar9 = nKar9/UpAllKar9Mean[1]

#num1 mutant
source('slow_imaging/Num1/Num1_paths.R')
#run the looping script
source('~/Desktop/peakfinder/peakFinderLoopFunctionSlow.R')
UpAll -> UpAllNum1
DownAll -> DownAllNum1

UpAllNum1Mean = apply(UpAllNum1,2,mean,na.rm = T)
nNum1 = length(which(!is.na(UpAllNum1[,2])))
eventsNum1 = nNum1/UpAllNum1Mean[1]

