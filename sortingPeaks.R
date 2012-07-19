#script to sort and further analyse the reported UpCand and DownCand events
#
#Input: UpCand
#       DownCand
#       distaMT1
#       distaMT
#       paramters for event selection
#---------------------------------------------------------------------------
#sort out the events that are interesting based on the minimal height and maximal duration given in the master file
rowsUp = which(UpCand$height >= height & UpCand$duration <= duration)
rowsDown = which(abs(DownCand$height) >=height & DownCand$duration <= duration)
nrUp = length(rowsUp)
nrDown = length(rowsDown)

Up = as.data.frame(matrix(NA, nr = nrUp, nc = length(colNames)))
colnames(Up) = colNames
Down = as.data.frame(matrix(NA, nr = nrDown, nc = length(colNames)))
colnames(Down) = colNames
#interesting events
Up = UpCand[rowsUp,]
Down = DownCand[rowsDown,]

#find the corresponding daMT distance data points
#up events
nrMax =  max(Up$duration)/(t[2] - t[1]) + 1
UpaMT1 = matrix(NA,nr = nrMax+1, nc = length(Up$duration))
UpaMT2 = matrix(NA,nr = nrMax+1, nc = length(Up$duration))
UpdSPB = matrix(NA,nr = nrMax+1, nc = length(Up$duration))

for (i in 1:nrUp) {
  index = which(t >= Up$start[i] & t <= Up$end[i])
  UpaMT1[1:length(index),i] = distDaMT1[index]
  UpaMT2[1:length(index),i] = distDaMT2[index]
  UpdSPB[1:length(index),i] = distD[index]
}
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
}