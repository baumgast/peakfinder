#master file for the peakfinder. hands all necessary parameters to the actual script and runs it.
#
#-----------------------------------------------------------------------------------------------
#working directory windows
#setwd("C:/Users/baumgast/Dropbox/R/data")
#working directory mac
setwd("~/Dropbox/R/data")

# paths & neck coords, select only one
source('fast_imaging/yJC5919/yJC5919_paths.R')
#source('fast_imaging/Kar9/Kar9_paths.R')
#source('fast_imaging/Num1/Num1_paths.R')

#parameters
#select which cell, cell 2 for Kar9 is no working due to invisible neck.
j = 9
#size of the sliding window in minutes
deltaT = 0.3
#maximal time (min) between two found spikes to be considered to belong together
dt = 13/60
#height treshold of pulling events in microns
height = 0.45
#maximal duration of one event in minutes
duration = 4

#run the peakfinder script
source('~/Desktop/peakfinder/peakFinder.R')
#run the sorting script
source('~/Desktop/peakfinder/sortingPeaks.R')
