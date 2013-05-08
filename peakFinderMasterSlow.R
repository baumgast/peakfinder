#master file for the peakfinder. hands all necessary parameters to the actual script and runs it.
#for single cells
# adopted for slow imaged movies
#--------------------------------------

setwd('~/Dropbox/R/data/')

# paths to coords, select only one
source('slow_imaging/yJC5919/yJC5919_paths.R')
#source('slow_imaging/Kar9/Kar9_paths.R')
#source('slow_imaging/Num1/Num1_paths.R')

#parameters
#select which cell, cell 2 for Kar9 is no working due to invisible neck.
j = 6
#size of the sliding window in minutes
deltaT = 0.5
#maximal time (min) between two found spikes to be considered to belong together
dt = 0.5
#height treshold of pulling events in microns
height = 0.5
#maximal duration of one event in minutes
duration = 5
#maximal average velocity during the event in µm/min
avg = 3

#run the peakfinder script
source('~/Desktop/peakfinder/peakfinderSlow.R')
#sort/select the found event
source('~/Desktop/peakfinder/sortingPeaksSlow.R')
#plot the results
source('~/Desktop/peakfinder/peakFinderPlotSlow.R')