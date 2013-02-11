#plotting script for peakfinder
#pdf('~/Dropbox/spindle manuscript LibreOffice/firgures submission/raw plots:images/figure 4/pullingKar9.pdf', height = 4.5, width = 10)
par(mfrow = c(1,1), mai = c(1.3,1.3,1,1), cex = 1.0, las = 1, xaxs = 'i', yaxs = 'i')

xlim = range(t)
ylim = c(min(DistD, na.rm = T),max(DistD, na.rm = T))

plot.new()
plot.window(xlim,ylim)
axis(1)
axis(2)
#grid() 
box()
title(#main = as.character(necks$cellName[j]),
    main = cellNames[j],
    xlab = 'Time (min)',
    ylab = expression('Distance ('*mu*'m)'))
points(t,DistD, type = 'l', lwd = 1.5)

points(TimeMax,Peaks, pch = 15, col = 'cyan')
points(TimeMin,Troughs,pch = 17, col = 'magenta')

segments(Down$start,Down$endDist,Down$end,Down$startDist, col = 'darkblue', lwd = 4)
segments(Up$start,Up$startDist,Up$end,Up$endDist, col = 'springgreen4', lwd = 4)

#legend('topleft', c('dSPB','daMT1','daMT2','down spikes','up spikes', 'forward events','backward events'),lwd = c(2,2,2,0,0,3,3), 
#       pch = c(NA,NA,NA,15,17,NA,NA), col = c('black','grey','peru','cyan','magenta','darkseagreen','darkblue'), bty = 'n')

legend('topleft',c('spindle pole','forward event','backward event'), lwd = c(2,3,3), 
       col = c('black','darkseagreen','darkblue'), bty = 'n')
#dev.off()