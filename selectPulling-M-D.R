#select pulling events for all three strains:
#               M -> M
#               M -> D
#               D -> D
#-----------------------------
#source('~/Desktop/peakfinder/peakFinderLoop.R')
dist = 0.1
#wild type
rows = which(UpAllyJC5919$startDist < dist & UpAllyJC5919$distaMT1start > -dist)
UpAllyJC5919.M.D = UpAllyJC5919[rows,]
meanUpAllyJC5919.M.D = apply(UpAllyJC5919.M.D,2,mean,na.rm = T)
sdUpAllyJC5919.M.D = apply(UpAllyJC5919.M.D,2,sd,na.rm = T)/sqrt(dim(UpAllyJC5919.M.D)[1])

#Kar9
rows = which(UpAllKar9$startDist < dist & UpAllKar9$distaMT1start > -dist)
UpAllKar9.M.D = UpAllKar9[rows,]
meanUpAllKar9.M.D = apply(UpAllKar9.M.D,2,mean,na.rm = T)
sdUpAllKar9.M.D = apply(UpAllKar9.M.D,2,sd,na.rm = T)/sqrt(dim(UpAllKar9.M.D)[1])

#Num1
rows = which(UpAllNum1$startDist < dist & UpAllNum1$distaMT1start > -dist)
UpAllNum1.M.D = UpAllNum1[rows,]
meanUpAllNum1.M.D = apply(UpAllNum1.M.D,2,mean,na.rm = T)
sdUpAllNum1.M.D = apply(UpAllNum1.M.D,2,sd,na.rm = T)/sqrt(dim(UpAllNum1.M.D)[1])

