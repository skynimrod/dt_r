�μ�:

    http://blog.csdn.net/hong0220/article/details/26722841

   ����������RODBC ���ĵ����¼��Ҳ����ϸ˵����

. 1. �����ذ�װ MySQL �� ODBC

    http://dev.mysql.com/downloads/connector/odbc

    windows���������->������->����Դ��ODBC��->˫��->���->ѡ��mysql ODBC driverһ��

    ��д��data source name һ��������Ҫʹ�õ����֣��Լ�������������磺mysql_data;

    descriptionһ��������д������mydata

    TCP/IP Server ��д����������IP��һ��Ϊ��127.0.0.1

    user ��д���mysql�û���

    password ��д���mysql����

    Ȼ�����ݿ����������mysql����������ݿ⣬ѡ��һ�����ݿ⡣

    ȷ����

   #  ��Ҫע����ǣ� �˿�����һ��Ҫ�����ݿ�һֱ�� �ɲ鿴 my.ini ��ȷ�϶˿ڡ� �����ҽ�MySQL �Ķ˿ڸĳ�3307 �ˣ� Ϊ�˰�ȫ����� û��ʹ��ȱʡ��3306�˿ڡ�

    ����������ODBC for MySQL  ��:  MySQL_For_R, �� ϵͳDSN

. 2. R����RODBC������װ��

     http://mirror.bjtu.edu.cn/cran/  

     �鿴 Packages  �е�RODBC, ����б�����������õİ�

     ��Ҫע����� �� ���İ汾��R�İ汾�й����� �汾��һ�¿��ܲ����ã� ����: RODBC  1.3-11 ������ R 3.2���׵ģ� R 3.1 �Ͳ�����

     ��ѹ��RODBC Ŀ¼���������� R3.2 ��װĿ¼�µ� library��Ŀ¼�У� ����:"R-3.2.0\library"

     Ȼ�����RODBC �Ƿ��Ѿ�����

     >library(RODBC)
     >
     û���κδ�����ʾ�� ��ʾ�Ѿ�����������

. 3. ���� RODBC �� MySQL ��ODBC �Ƿ�����������
  
     > user<-odbcConnect("MySQL_For_R",uid="root",pwd="gPekin1")
     > sqlTables(user);

     ������odbc����Դ���½������"MySQL_FOR_R" ��Ӧ����test_db, ��ô������ʾ�ľ���test_db ��������б�

     >sqlFetch(user,"user")# �鿴������ݣ��浽���ݿ���

��գ��ݵ�����Ŷ���˼ң�ƶɮ�˶������ƶ���������;���˵أ���֪���˼ҿɷ�󿪷���֮�š������˼ң���Ī�����ƶɮ���ͽ����Ǹ�������˼ң���Ī��������ƶɮ�������˼���Ϣŭ�����ϡ����ϼһ����ٶ���һ�����ԣ�������ѽ**����գ��������˽�������Ҳ�ϣ����õ�����Ϲ�ȴ��ۣ����˸��յģ�

. 4. ��R ���л�����ִ�� R ����

      

. 5. ���ݿ����

    �μ� :

        RODBC ���е��ĵ� RODBC.pdf

    ���磺

   > mydata=sqlQuery(user,"select id,version from user")
   > boxplot(id~version,data=mydata)

   ����������ļ��У�

   >pdf(file='c:/test.pdf')   # bmp(), jpeg(), png(), TIFF()   �μ�: fullrefman.pdf   P732  

                                                                    "The grDevices package->png"

   > boxplot(id~version,data=mydata)
   > dev.off()
   null device 
          1 


   ������ʽ���ļ�
   grDevices::png         BMP, JPEG, PNG and TIFF graphics devices

   ����μ��������ϸ˵��:

==================================================

   1. ��������

      >library(RODBC)
      >ch <- odbcConnect("some dsn", uid = "user", pwd = "****")

      >close(ch)      # ������

      >odbcClose(ch)

   2. �����ݿ��ж�ȡ����

      >sqlTables(ch)       # �鿴����Щ��

      >


   20. ����״�ֲ�ͼ

      > dotchart(VADeaths, main = "Death Rates in Virginia - 1940")

      > op <- par(xaxs = "i") # 0 -- 100%

      ����2�к�����2����һ������

      > dotchart(t(VADeaths), xlim = c(0,100), main = "Death Rates in Virginia - 1940")

      > par(op)      

   21. ����ͷ����    �μ�: ��fullrefman.pdf�� P774

       x <- stats::runif(12); y <- stats::rnorm(12)
 
       i <- order(x, y); x <- x[i]; y <- y[i]

       plot(x,y, main = "arrows(.) and segments(.)")

       ## draw arrows from point to point :

       s <- seq(length(x)-1) # one shorter than data

       arrows(x[s], y[s], x[s+1], y[s+1], col = 1:3)

       s <- s[-length(s)]

       segments(x[s], y[s], x[s+2], y[s+2], col = "pink")

ϣ����   

   22. ����״ͼ

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

   
 