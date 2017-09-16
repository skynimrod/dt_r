参见:

    http://blog.csdn.net/hong0220/article/details/26722841

   关于配置在RODBC 的文档最后附录中也有详细说明。

. 1. 先下载安装 MySQL 的 ODBC

    http://dev.mysql.com/downloads/connector/odbc

    windows：控制面板->管理工具->数据源（ODBC）->双击->添加->选中mysql ODBC driver一项

    填写：data source name 一项填入你要使用的名字，自己随便命名，例如：mysql_data;

    description一项随意填写，例如mydata

    TCP/IP Server 填写本机服务器IP，一般为：127.0.0.1

    user 填写你的mysql用户名

    password 填写你的mysql密码

    然后数据库里会出现你的mysql里的所有数据库，选择一个数据库。

    确定。

   #  需要注意的是， 端口设置一定要和数据库一直， 可查看 my.ini 来确认端口。 比如我将MySQL 的端口改成3307 了， 为了安全起见， 没有使用缺省的3306端口。

    这里命名的ODBC for MySQL  是:  MySQL_For_R, 是 系统DSN

. 2. R下载RODBC包，安装好

     http://mirror.bjtu.edu.cn/cran/  

     查看 Packages  中的RODBC, 这个列表中有许多有用的包

     需要注意的是 ， 包的版本与R的版本有关联， 版本不一致可能不能用， 比如: RODBC  1.3-11 就是与 R 3.2配套的， R 3.1 就不能用

     解压后将RODBC 目录整个拷贝到 R3.2 安装目录下的 library子目录中， 例如:"R-3.2.0\library"

     然后测试RODBC 是否已经工作

     >library(RODBC)
     >
     没有任何错误提示， 表示已经正常工作了

. 3. 测试 RODBC 和 MySQL 的ODBC 是否能正常工作
  
     > user<-odbcConnect("MySQL_For_R",uid="root",pwd="gPekin1")
     > sqlTables(user);

     由于在odbc数据源中新建定义的"MySQL_FOR_R" 对应的是test_db, 那么现在显示的就是test_db 下面的所有表

     >sqlFetch(user,"user")# 查看表的内容，存到数据框里

悟空！休得无礼！哦老人家，贫僧乃东土大唐而来，今日途经此地，不知老人家可否大开方便之门……老人家，请莫再辱骂，贫僧替大徒儿道歉……老人家，请莫用手杖杵贫僧……老人家请息怒……老……老家伙你再动我一下试试？……哎呀**？悟空！削他！八戒悟净你们也上，牙敲掉眼扎瞎腿打折！善了个哉的！

. 4. 在R 运行环境外执行 R 程序。

      

. 5. 数据库访问

    参见 :

        RODBC 包中的文档 RODBC.pdf

    例如：

   > mydata=sqlQuery(user,"select id,version from user")
   > boxplot(id~version,data=mydata)

   可以输出到文件中：

   >pdf(file='c:/test.pdf')   # bmp(), jpeg(), png(), TIFF()   参见: fullrefman.pdf   P732  

                                                                    "The grDevices package->png"

   > boxplot(id~version,data=mydata)
   > dev.off()
   null device 
          1 


   其他格式的文件
   grDevices::png         BMP, JPEG, PNG and TIFF graphics devices

   具体参见下面的详细说明:

==================================================

   1. 创建连接

      >library(RODBC)
      >ch <- odbcConnect("some dsn", uid = "user", pwd = "****")

      >close(ch)      # 别忘了

      >odbcClose(ch)

   2. 从数据库中读取数据

      >sqlTables(ch)       # 查看有哪些表

      >


   20. 画点状分布图

      > dotchart(VADeaths, main = "Death Rates in Virginia - 1940")

      > op <- par(xaxs = "i") # 0 -- 100%

      上面2行和下面2行有一点区别。

      > dotchart(t(VADeaths), xlim = c(0,100), main = "Death Rates in Virginia - 1940")

      > par(op)      

   21. 画箭头连线    参见: 《fullrefman.pdf》 P774

       x <- stats::runif(12); y <- stats::rnorm(12)
 
       i <- order(x, y); x <- x[i]; y <- y[i]

       plot(x,y, main = "arrows(.) and segments(.)")

       ## draw arrows from point to point :

       s <- seq(length(x)-1) # one shorter than data

       arrows(x[s], y[s], x[s+1], y[s+1], col = 1:3)

       s <- s[-length(s)]

       segments(x[s], y[s], x[s+2], y[s+2], col = "pink")

希舒美   

   22. 画柱状图

       require(grDevices)              # for colours

       tN <- table(Ni <- stats::rpois(100, lambda = 5))

       r <- barplot(tN, col = rainbow(20))

       #- type = "h" plotting *is* 'bar'plot
lines(r, tN, type = "h", col = "red", lwd = 2)
barplot(tN, space = 1.5, axisnames = FALSE,
sub = "barplot(..., space= 1.5, axisnames = FALSE)")
barplot(VADeaths, plot = FALSE)
barplot(VADeaths, plot = FALSE, beside = TRUE)
mp <- barplot(VADeaths) # default
tot <- colMeans(VADeaths)
text(mp, tot + 3, format(tot), xpd = TRUE, col = "blue")
barplot(VADeaths, beside = TRUE,
col = c("lightblue", "mistyrose", "lightcyan",
"lavender", "cornsilk"),
legend = rownames(VADeaths), ylim = c(0, 100))
title(main = "Death Rates in Virginia", font.main = 4)
hh <- t(VADeaths)[, 5:1]
mybarcol <- "gray20"
mp <- barplot(hh, beside = TRUE,
col = c("lightblue", "mistyrose",
"lightcyan", "lavender"),
legend = colnames(VADeaths), ylim = c(0,100),
main = "Death Rates in Virginia", font.main = 4,
sub = "Faked upper 2*sigma error bars", col.sub = mybarcol,
cex.names = 1.5)
segments(mp, hh, mp, hh + 2*sqrt(1000*hh/100), col = mybarcol, lwd = 1.5)
stopifnot(dim(mp) == dim(hh)) # corresponding matrices
mtext(side = 1, at = colMeans(mp), line = -2,
text = paste("Mean", formatC(colMeans(hh))), col = "red")
# Bar shading example
barplot(VADeaths, angle = 15+10*1:5, density = 20, col = "black",
legend = rownames(VADeaths))
title(main = list("Death Rates in Virginia", font = 4))
# border :
barplot(VADeaths, border = "dark blue")
# log scales (not much sense here):
barplot(tN, col = heat.colors(12), log = "y")
barplot(tN, col = gray.colors(20), log = "xy")
# args.legend
barplot(height = cbind(x = c(465, 91) / 465 * 100,
y = c(840, 200) / 840 * 100,
z = c(37, 17) / 37 * 100),
beside = FALSE,
width = c(465, 840, 37),
col = c(1, 2),
legend.text = c("A", "B"),
args.legend = list(x = "topleft"))

   
 