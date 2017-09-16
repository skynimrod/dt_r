png("c:/taiji.png")

#cycle.y is used to calculate the y-coordinates
cycle.y <- function(center.x, center.y, radius, x){
if (max(x)>(center.x+radius)||min(x)<(center.x-radius)){
stop("The range of x is too wide!!\n")} else {
cycle.y.top <- sqrt(radius^2 - (x - center.x)^2) + center.y
cycle.y.bottom <- center.y - sqrt(radius^2 - (x - center.x)^2)
cycle.y <- matrix(c(cycle.y.top,cycle.y.bottom),2,length(x),byrow=TRUE)
}
}

xllim <- 0
xrlim <- xllim+8
center.x <- (xllim + xrlim)/2
center.y <- 4
radius <- 4

x <- seq(xllim,xrlim,length=401)
xl <- x[x<=median(x)]
xr <- x[x>=median(x)]
y <- cycle.y(center.x, center.y, radius, x)
yl <- y[,1:round((ncol(y)+1)/2)]
yr <- y[,round((ncol(y)+1)/2):ncol(y)]

windows()
par(bg=colors()[657])
plot(c(center.x-radius,center.x+radius), c(center.y-radius,center.y+radius), 
type="n", bty="n", xlab="", ylab="", xaxt="n", yaxt="n")
title(main = "Tai Chi", cex.main =3)
polygon(c(xl,rev(xl)), c(yl[1,],rev(yl[2,])), col="white", border = "transparent")
polygon(c(xr,rev(xr)), c(yr[1,],rev(yr[2,])), col="black", border = "transparent")

center.yt <- center.y+center.y/2
center.yb <- center.y-center.y/2
radius1 <- radius/2
xl1 <- xl[xl>=median(xl)]
xr1 <- xr[xr<=median(xr)]
yl1 <- cycle.y(center.x, center.yb, radius1, xl1)
yr1 <- cycle.y(center.x, center.yt, radius1, xr1)
polygon(c(xl1,rev(xl1)), c(yl1[1,],rev(yl1[2,])), col="black", border = "transparent")
polygon(c(xr1,rev(xr1)), c(yr1[1,],rev(yr1[2,])), col="white", border = "transparent")

radius2 <- radius1/4
library(plotrix)
draw.circle(center.x, center.yt, radius2, col="black")
draw.circle(center.x, center.yb, radius2, col="white")

dev.off()