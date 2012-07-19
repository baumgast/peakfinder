# paths & neck coords, select only one
#source('fast_imaging/yJC5919/yJC5919_paths.R')
source('fast_imaging/Kar9/Kar9_paths.R')
#source('fast_imaging/Num1/Num1_paths.R')

#parameters
#select which cell, cell 2 for Kar9 is no working due to invisible neck.
j = 5
#size of the slideing window in minutes
deltaT = 0.4
#height treshold of pulling events
height = 0.5
#maximal time between two found spikes to be considered to belong together
dt = 15/60

#working directory windows
#setwd("C:/Users/baumgast/Dropbox/R/data")
#working directory mac
setwd("~/Dropbox/R/data")