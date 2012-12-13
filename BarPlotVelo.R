
forw = c(0.5,0.14,0.33)
errforw = c(0.08,0.04,0.05)

backw = c(-0.4,-0.18,-0.31)
errbackw = c(0.07,0.05,0.06)

all = matrix(c(forw,backw), nr = 3, nc = 2)
allerr = matrix(c(errforw,errbackw),nr = 3, nc = 2)

pdf('~/Desktop/peakfinder/plots/VeloBar1.pdf', width = 5,height = 10)
par(mfrow = c(2,1), cex = 1.2)
 
mf = barplot(forw, horiz = F, col = 'grey', border = 'white',ylim = c(0,0.6),
             main = 'Forward events',
             names.arg = c('WT','kar9','num1'),
             ylab = expression('Velocity ('*mu*'m/s)'))
segments(mf,forw - errforw,mf,forw + errforw, lwd = 3)
mb = barplot(backw, horiz = F, col = 'grey', border = 'white',, ylim = c(-0.6,0),
             main = 'Backward events',
             names.arg = c('WT','kar9','num1'),
             ylab = expression('Velocity ('*mu*'m/s)'))
segments(mb,backw - errbackw,mb,backw + errbackw, lwd = 3)
dev.off()


pdf('~/Desktop/peakfinder/plots/VeloBar.pdf', width = 6,height = 7)
par(mfrow = c(1,1), cex = 1.2)
m = barplot(all, beside = T, col = 'grey', border = 'white', ylim = c(-0.6,0.6),
            main = 'Forward events           backward events',
            names.arg = c('WT','kar9','num1','WT','kar9','num1'),
            ylab = expression('Velocity ('*mu*'m/s)'))
segments(m,all - allerr,m,all + allerr, col = 'black', lwd = 3)
abline(0,0, lty = 2, lwd = 2)
dev.off()
