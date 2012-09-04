#script to sort and further analyse the reported UpCand and DownCand events
#
#Input: UpCand
#       DownCand
#       distaMT1
#       distaMT
#       paramters for event selection
#---------------------------------------------------------------------------
#sort out the events that are interesting based on the minimal height and maximal duration given in the master file
rowsUp = which(UpCand$height >= height & UpCand$duration <= duration & UpCand$duration > 0 & UpCand$avgVelo < avg)
rowsDown = which(abs(DownCand$height) >=height & DownCand$duration <= duration & DownCand$duration > 0 & DownCand$avgVelo < avg)
nrUp = length(rowsUp)
nrDown = length(rowsDown)

if(nrUp > 0) {
  Up   = as.data.frame(matrix(NA, nr = nrUp, nc = length(colNames)))
  colnames(Up) = colNames
  #interesting events
  Up = UpCand[rowsUp,]
  
  #find the corresponding daMT distance data points
  #up events
  nrMax  =  max(Up$duration)/(t[2] - t[1]) + 1
  UpaMT1 = matrix(NA,nr = nrMax+1, nc = length(Up$duration))
  UpaMT2 = matrix(NA,nr = nrMax+1, nc = length(Up$duration))
  UpdSPB = matrix(NA,nr = nrMax+1, nc = length(Up$duration))
  
  for (i in 1:nrUp) {
    index = which(t >= Up$start[i] & t <= Up$end[i])
    UpaMT1[1:length(index),i] = distDaMT1[index]
    UpaMT2[1:length(index),i] = distDaMT2[index]
    UpdSPB[1:length(index),i] = distD[index]
    #pearson correlation coefficient
    if (length(which(!is.na(distDaMT1[index]))) > 0) {
      corr1 = cor(distD[index],distDaMT1[index], use = 'complete.obs')
      Up$corrCoeff1[i] = corr1
    }
    if (length(which(!is.na(distDaMT2[index]))) > 0) {
      corr2 = cor(distD[index],distDaMT2[index], use = 'complete.obs')
      Up$corrCoeff2[i] = corr2
    }
    #mean aMT length
    L1 = sqrt((a$xdSPB[index] - a$xdaMT1[index])^2 + (a$ydSPB[index] - a$ydaMT1[index])^2)*pixel
    L2 = sqrt((a$xdSPB[index] - a$xdaMT2[index])^2 + (a$ydSPB[index] - a$ydaMT2[index])^2)*pixel
    Up$aMTlength1[i] = mean(L1,na.rm = T)
    Up$aMTlength2[i] = mean(L2,na.rm = T)    
    
    #sorting out events that have the same starting point
    if (i > 1) {
      if(Up$start[i] == Up$start[i-1] & !is.na(Up$start[i-1])) {
        Up[i-1,] = Up[i,]
        Up[i,]   = NA
      }
    }
  }
  UpMean = as.data.frame(matrix(NA, nr = 1, nc = 9))
  colnames(UpMean) = c('n','n.t','obsT','meanVelo','sdVelo','meanDist','sdDist','meanDur','sdDur')
  
  UpMean$n        = length(which(!is.na(Up[,1])))
  UpMean$n.t      = UpMean$n/max(t)
  UpMean$obsT     = max(t)
  UpMean$meanVelo = mean(Up$avgVelo, na.rm = T)
  UpMean$sdVelo   = sd(Up$avgVelo, na.rm = T)
  UpMean$meanDist = mean(Up$height, na.rm = T)
  UpMean$sdDist   = sd(Up$height, na.rm = T)
  UpMean$meanDur  = mean(Up$duration, na.rm = T)
  UpMean$sdDur    = sd(Up$duration, na.rm = T)
  #display results
  cat('Up \n')
  print(Up)
  cat('UpMean \n')
  print(UpMean)
}else{print('no pulling events')
      Up   = as.data.frame(matrix(NA, nr = 1, nc = length(colNames)))
      colnames(Up) = colNames
      }

#------------------------------------------------------------------------------
#backwards events
if (nrDown > 0) {
  Down = as.data.frame(matrix(NA, nr = nrDown, nc = length(colNames)))
  colnames(Down) = colNames
  #interesting events
  Down = DownCand[rowsDown,]
  
  #down events
  nrMax =  max(Down$duration)/(t[2] - t[1]) + 1
  DownaMT1 = matrix(NA,nr = nrMax+1, nc = length(Down$duration))
  DownaMT2 = matrix(NA,nr = nrMax+1, nc = length(Down$duration))
  DowndSPB = matrix(NA,nr = nrMax+1, nc = length(Down$duration))
  
  for (i in 1:nrDown) {
    index = which(t >= Down$start[i] & t <= Down$end[i])
    DownaMT1[1:length(index),i] = distDaMT1[index]
    DownaMT2[1:length(index),i] = distDaMT2[index]
    DowndSPB[1:length(index),i] = distD[index]
    #pearson correlation coefficient
    if (length(which(!is.na(distDaMT1[index]))) > 0) {
      corr1 = cor(distD[index],distDaMT1[index], use = 'complete.obs')
      Down$corrCoeff1[i] = corr1
    }
    if (length(which(!is.na(distDaMT2[index]))) > 0) {
      corr2 = cor(distD[index],distDaMT2[index], use = 'complete.obs')
      Down$corrCoeff2[i] = corr2
    }
    #mean aMT length
    L1 = sqrt((a$xdSPB[index] - a$xdaMT1[index])^2 + (a$ydSPB[index] - a$ydaMT1[index])^2)*pixel
    L2 = sqrt((a$xdSPB[index] - a$xdaMT2[index])^2 + (a$ydSPB[index] - a$ydaMT2[index])^2)*pixel
    Down$aMTlength1[i] = mean(L1,na.rm = T)
    Down$aMTlength2[i] = mean(L2,na.rm = T)
    if (i > 1) {
      if(Down$end[i] == Down$end[i-1] & !is.na(Down$end[i-1])) {
        #Down[i-1,] = Down[i,]
        Down[i,]   = NA
      }
    }
  }
  DownMean = as.data.frame(matrix(NA, nr = 1, nc = 9))
  colnames(DownMean) = c('n','n.t','obsT','meanVelo','sdVelo','meanDist','sdDist','meanDur','sdDur')
  
  DownMean$n        = length(which(!is.na(Down[,1])))
  DownMean$n.t      = DownMean$n/max(t)
  DownMean$obsT     = max(t)
  DownMean$meanVelo = mean(Down$avgVelo, na.rm = T)
  DownMean$sdVelo   = sd(Down$avgVelo, na.rm = T)
  DownMean$meanDist = mean(Down$height, na.rm = T)
  DownMean$sdDist   = sd(Down$height, na.rm = T)
  DownMean$meanDur  = mean(Down$duration, na.rm = T)
  DownMean$sdDur    = sd(Down$duration, na.rm = T)
  cat('Down \n')
  print(Down)
  cat('DownMean \n')
  print(DownMean)
}else{print('no back movements')
      Down = as.data.frame(matrix(NA, nr = 1, nc = length(colNames)))
      colnames(Down) = colNames
      }