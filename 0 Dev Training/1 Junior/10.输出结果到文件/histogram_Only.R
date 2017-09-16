#dev.new()

dev.new(png("C:/histogram.png"))

set.seed(10086)
n <- 200
df <- 6
X <- rchisq(n,df)
xllim = 0
xrlim = round(max(X))+2
x = seq(xllim, xrlim, length=400)
y <- dchisq(x, df)
z <- pchisq(x, df)

#windows()    #  如果使用了png() 来指定输出设备， 则这个设备就不应该使用

par(mfrow=c(2,2),oma = c(0, 0, 3, 0))
hist(X, breaks=40, freq=FALSE, main = "Histogram of X", xlab = "X")
lines(x, y, type="l", col = "red", lwd=2)
arrows(10, 0.06, 13, 0.12, code=1, length=0.1, angle=30, col="red", lwd=1.5)
text(13, 0.14, "True Density", col="red")

mtext("Statistical Plots of Chisquared Random Variable (D.F.=6, sample size=200)", font = 2, outer=TRUE)

dev.off()