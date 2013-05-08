#loop over all cells of all three strains to calculate the events and all associated numbers
#Input:only the file paths and the filter criteria
#Output:  A list per strain containing lists for each single cell
#         reported are the data frame with all the single events and
#         mean values + sd and total number of events and events per time
#-------------------------------------------------------------------------------
#set working directory
setwd('~/Dropbox/R/data/')

#size of the sliding window in minutes
deltaT = 0.3
#maximal time (min) between two found spikes to be considered to belong together
dt = 10/60
#height treshold of pulling events in microns
height = 0.45
#maximal duration of one event in minutes
duration = 4
#maximal average velocity during the event in µm/min
avg = 3

# paths & neck coords wild type
source('fast_imaging/yJC5919/yJC5919_paths.R')
#run the looping script
source('~/Desktop/peakfinder/peakFinderLoopFunction.R')
UpAll -> UpAllyJC5919
DownAll -> DownAllyJC5919


#kar9 mutant
source('fast_imaging/Kar9/Kar9_paths.R')
#run the looping script
source('~/Desktop/peakfinder/peakFinderLoopFunction.R')
UpAll -> UpAllKar9
DownAll -> DownAllKar9

#num1 mutant
source('fast_imaging/Num1/Num1_paths.R')
#run the looping script
source('~/Desktop/peakfinder/peakFinderLoopFunction.R')
UpAll -> UpAllNum1
DownAll -> DownAllNum1

#-------------------------------------------------------------------------------
#histograms of distances
breaks = seq(0.45,3.45,0.2)
ylim = c(0,25)

par(mfrow = c(2,3), cex = 1)

hist(UpAllyJC5919$Height, breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Distance (µm)',
     main = 'Wild type, forward')

hist(UpAllKar9$Height, breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Distance (µm)',
     main = 'kar9, forward')

hist(UpAllNum1$Height, breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Distance (µm)',
     main = 'num1, fordward')

hist(abs(DownAllyJC5919$Height), breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Distance (µm)',
     main = 'Wild type, backward')

hist(abs(DownAllKar9$Height), breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Distance (µm)',
     main = 'kar9, backward')

hist(abs(DownAllNum1$Height), breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Distance (µm)',
     main = 'num1, backward')
#-------------------------------------------------------------------------------
#histograms of duration of events
breaks = seq(0,2,0.2)
ylim = c(0,17)

par(mfrow = c(2,3), cex = 1)

hist(UpAllyJC5919$Duration, breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Duration  (min)',
     main = 'Wild type, forward')

hist(UpAllKar9$Duration, breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Duration  (min)',
     main = 'kar9, forward')

hist(UpAllNum1$Duration, breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Duration  (min)',
     main = 'num1, fordward')

hist(abs(DownAllyJC5919$Duration), breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Duration  (min)',
     main = 'Wild type, backward')

hist(abs(DownAllKar9$Duration), breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Duration  (min)',
     main = 'kar9, backward')

hist(abs(DownAllNum1$Duration), breaks = breaks, ylim = ylim,col = 'grey', border = 'white',
     xlab = 'Duration  (min)',
     main = 'num1, backward')