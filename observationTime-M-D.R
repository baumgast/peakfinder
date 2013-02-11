
setwd("~/Dropbox/R/data")

#define a function that calculates the observation time of the constellation 
# that the dSPB is in the mother cell and one aMT tip in the daughter cell.
constellationTime = function(paths,necks){
    TIME = 0
    for (j in 1:dim(necks)[1]){
        a = read.table(paths[j], header = TRUE)
        source('fast_imaging/SPBposDPG.R')
        #print(paths[j])
        
        rowsaMT1 = distDaMT1 > 0.1
        rowsaMT1[which(is.na(rowsaMT1))] = 0
        rowsaMT2 = distDaMT2 > 0.1
        rowsaMT2[which(is.na(rowsaMT2))] = 0
        rowsaMT = rowsaMT1 + rowsaMT2
    
        rowsSPB = distD < 0.1
        rowsSPB[which(is.na(rowsSPB))] = 0
        rowsFinal = rowsaMT*rowsSPB
        
        time = length(rowsFinal[which(rowsFinal>0)])*necks$deltaT[ii]/60
        print(time)
        TIME = TIME + time
    }
    return(TIME)
}

# paths & neck coords, select only one
source('fast_imaging/yJC5919/yJC5919_paths.R')
obsTimeyJC5919 = constellationTime(paths,necks)

source('fast_imaging/Kar9/Kar9_paths.R')
obsTimeKar9 = constellationTime(paths,necks)

source('fast_imaging/Num1/Num1_paths.R')
obsTimeNum1 = constellationTime(paths,necks)
