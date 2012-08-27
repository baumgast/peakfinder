#loop over all cells of all three strains to calculate the events and all associated numbers
#Input:only the file paths and the filter criteria
#Output:  A list per strain containing lists for each single cell
#         reported are the data frame with all the single events and
#         mean values + sd and total number of events and events per time
#-------------------------------------------------------------------------------
#set working directory
setwd('~/Dropbox/R/data/')
# paths & neck coords
source('fast_imaging/yJC5919/yJC5919_paths.R')

start      = vector()
end        = vector()
duration   = vector()
startDist  = vector()
endDist    = vector()
height     = vector()
avgVelo    = vector()
corrCoeff1 = vector()
corrCoeff2 = vector()
aMTlength1 = vector()
aMTlength2 = vector()
#iterate over all cells
for (ii in 1:length(necks$cellName)){
  j = ii
  cat(j,'\n')
  source('~/Desktop/peakfinder/peakFinder.R')
  source('~/Desktop/peakfinder/sortingPeaks.R')
  
  start = c(start,Up$start) 
}









#source('fast_imaging/Kar9/Kar9_paths.R')
#source('fast_imaging/Num1/Num1_paths.R')