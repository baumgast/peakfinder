#plotting script for peakfinder
par(mfrow = c(1,1), mai = c(1.3,1.3,1,1), cex = 1.1)

xlim = range(t)
ylim = c(min(distD, na.rm = T),max(distDaMT1, na.rm = T))

plot.new()
plot.window(xlim,ylim)
axis(1)
axis(2)
grid()
box()
title(main = as.character(necks$cellName[j]),
      xlab = 'Time (min)',
      ylab = expression('Distance ('*mu*'m)'))
points(t,distD, type = 'l', lwd = 1.5)
points(t,distDaMT1, type = 'l', col = 'grey')
points(t,distDaMT2, type = 'l', col = 'peru')
#points(timeMax,peaks, pch = 19, col = 'red')
#points(timeMin,troughs, pch = 19, col = 'blue')
points(TimeMax,Peaks, pch = 15, col = 'cyan')
points(TimeMin,Troughs,pch = 17, col = 'magenta')
#points(TimeMaxaMT1,PeaksaMT1, pch = 20, col = 'orange')
#points(TimeMinaMT1,TroughsaMT1, pch = 20, col = 'darkblue')
if (length(timeMaxaMT2)>0) {
  #points(TimeMaxaMT2, PeaksaMT2, pch = 20, col = 'orangered')
  #points(TimeMinaMT2, TroughsaMT2, pch = 20, col = 'purple')
}

segments(Down$start,Down$endDist,Down$end,Down$startDist, col = 'darkblue', lwd = 4)
segments(Up$start,Up$startDist,Up$end,Up$endDist, col = 'springgreen4', lwd = 4)

legend('topleft', c('dSPB','daMT1','daMT2','down spikes','up spikes', 'forward events','backward events'),lwd = c(2,2,2,0,0,3,3), 
       pch = c(NA,NA,NA,15,17,NA,NA), col = c('black','grey','peru','cyan','magenta','darkseagreen','darkblue'), bty = 'n')