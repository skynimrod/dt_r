参见:

    http://www.tuicool.com/articles/Aby2Qn

. 利用R 绘制数学函数图象， 简单、方便和易用。

  在给定函数和定义域范围内, 函数curve 可以画函数图象。

. 举例说明

  par(mfrow=c91，3))

  > curve(sin, -3,3,col="red")

  > curve(dnorm, -3.5, 3.5, main="Std.Normal Density", col="green")   # dnorm()是正太分布函数

  > f <- function(x) exp(-abs(x)) * sin(2 * pi * x)

  > curve( f, -5, +5, main="Dampened Sine Wave", col="blue")