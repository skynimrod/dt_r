. 参见:

      官网地址:   www.r-project.org

. 下载:

   点击 官网地址->CRAN -> China -> 北京交通大学(拼音) 

    R 3.1.0 for windows  54MB, 32/64 位通用.

    http://mirror.bjtu.edu.cn/cran/bin/windows/base/

. R 语言简介

  1980年诞生的S语言的一个分支，广泛用于统计领域。 S语言是商用语言， 后来Auckland 大学的(奥克兰多大学)的Robert Gentleman 、Ross Ikaka 以及一些其他志愿者开发了R系统，免费的，可以当作S语言的一种实现。 通常S语言编写的代码可以不做修改的在R环境下运行。   R的语法来自 Schema.

  R 语言对大小写敏感。  ";" 是语句分隔符， "#" 是注释

. 功能

  R 是一套完整的数据处理、计算和制图软件系统。 其功能包括： 数据 存储和处理 系统； 数组运算工具(其向量、矩阵运算方面功能尤其强大)；完整连贯的统计分析工具；优秀的统计制图功能；简便而强大的编程语言；可操纵数据的输入和输出，可实现分支、循环，用户可自定义功能。

  与其说R是一种统计软件， 还不如说R是一种数学计算的环境， 因为R并不是仅仅提供若干统计程序， 使用者只需 指定数据库和若干参数便可进行一个统计分析。

  R 的思想是： 它可以提供一些集成的统计工具， 但更大量的是它提供各种 数学计算、统计计算的函数， 从而使  使用者 能灵活机动的 进行数据分析， 甚至创造出符合需要的新的统计计算方法。

  该语言的语法表面上类似C, 但在语义上 是函数设计语言的变种 并且和 Lisp 以及 APL 有很强的兼容性。  特别的是, 它允许在“语言上计算”(computing on the language). 这使得它可以把表达式 作为函数的输入参数, 而这种做法对 统计模拟和绘图 非常有用。

. R 包 及其使用

  R 语言的使用, 真大程度上是借助各种各样的R包的辅助，  从某种程度上讲, R包 就是针对R的插件, 不同的插件满足不同的需求。

  安装包

  1、通过选择菜单：

     程序包->安装程序包->在弹出的对话框中，选择你要安装的包，然后确定。

     # 这个功能非常好， 可以一目了然。

  2、使用命令

     install.packages("package_name","dir")

     package_name:是指定要安装的包名，请注意大小写。

     dir:包安装的路径。默认情况下是安装在..\library 文件夹中的。可以通过本参数来进行修改，来选择安装的文件夹。

  3、本地来安装

     如果你已经下载的相应的包的压缩文件，则可以在本地来进行安装。请注意在windows、unix、macOS操作系统下安装文件的后缀名是不一样的：

     1）linux环境编译运行：tar.gz文件

     2）windows 环境编译运行 ：.zip文件

     3）MacOSg环境编译运行:.tgz文件

     注：包安装好后，并不可以直接使用，如果在使用包中相关的函数，必须每次使用前包加载到内存中。通过library(package_name)来完成。

    [4] 

  加载包

     包安装后，如果要使用包的功能。必须先把包加载到内存中（默认情况下，R启动后默认加载基本包），加载包命令：

          Library(“包名”)

          Require(“包名”)[4] 

  查看包的相关信息

    1、查看包帮忙

       library(help="package_name")

          主要内容包括：例如：包名、作者、版本、更新时间、功能描述、开源协议、存储位置、主要的函数

       help(package = "package_name")   ------------   ######      这个非常实用   !!!!

          主要内容包括：包的内置所有函数，是更为详细的帮助文档

    2、查看当前环境哪些包加载

       find.package() 或者 path.package()

    3、移除包出内存

       detach()

    4、把其它包的数据加载到内存中   --- #####

       data(dsname, package="package_name")

    5、查看这个包里的包有数据  ----------####

       data( package="package_name")

    6、列出所有安装的包   ---------- #####　很实用 

       library()[4] 

. 在R语言环境外部调用R脚本执行

  参见:

      http://www.cnblogs.com/emanlee/p/4018222.html

      http://f.dataguru.cn/thread-174642-1-1.html

  在unix、windows 外部需要调用R脚本执行, 然后又需要输入不同的参数, 类似shell脚本的命令行参数输入, 可以使用Rscript 命令实现。

  命令格式:

      Rscript [option] [-e expression] file [args]

  首先 需要在file 文件中的第一行加入:

     args <- commandArgs()

  然后按照以下格式执行

     Rscript *.r 参数1  参数2 .。。。

  在file 脚本中, 可以引用参数Args

    Args[1] = "/usr/local/lib64/R/bin/exec/R"

    Args[2]= "--slave"

    Args[3]= "--no-restore"

    Args[4]="--file=a.r"

    Args[5]="--args"

    Args[6]==参数1

    Args[7]==参数2

  可见输入的参数从第六个和第七个开始。

　＃　　需要注意的是，　通过RScript 运行R文件的时候，如果有错误(特别是相关的包没有安装等)就不会运行， 而相同的脚本在R 环境下就可以运行， 仅仅是执行到对应的语句是会提示同样的错误。

  C:\>RScript taiji.R
Error in library(plotrix) : there is no package called 'plotrix'
Execution halted

  上面的同样的脚本， 在R语言环境下运行

   。。。。
  > library(plotrix)
  Error in library(plotrix) : there is no package called ‘plotrix’
  > draw.circle(center.x, center.yt, radius2, col="black")
  Error: could not find function "draw.circle"
  > draw.circle(center.x, center.yb, radius2, col="white")

  ##  需要注意的另一个问题是， 运行R脚本的输出问题， 需要单独处理

  在开始的地方， 增加 png("c:/taiji.png")

  最后增加  dev.off()

  问题是， 如果是动画， 则好像输出有点问题。  主要是设备的管理问题， 如果使用了png() 就不要再用windows() 来打开新设备， 否则输出实际上是另一个设备。 需要注意的是应该dev.new() 一个新设备来进行输出， 使用后用dev.off() 来关闭设备。 
  
. R 的常见命令

  参见:

       http://blog.sina.com.cn/s/blog_9f23a8da010195qx.html

##################################
#运算符
##################################

数学运算：
+，-，*，/，^，%%。(加，减，乘，除，乘方，求余。)

比较运算：
>，<，>=，<=，==，!=。(大于，小于，大于等于，小于等于，等于，不等于。)

逻辑运算：
&，|，!。(与，或，非。)

##################################
#初始基本操作
##################################

> getwd()
#获取工作目录。

> setwd("F:/R/myfun")
#设定工作目录为F:/R/myfun。

> help(com)
> ?com
#获得对命令com的说明。

> example(com)
#命令com的使用实例。

> args(com)
#查看命令com的变量格式。

> library()
#列出已安装的包。

> library(AER)  #或用
> require(AER)
#载入包AER。

> library(help = AER)
#获取包AER的信息。

> detach(package:AER)
#去除载入的包AER。

> search()
#列出已载入的包。

> data()
#列出已载入的包中的所有数据集。

> data(package = .packages(all.available = TRUE))
#列出已安装的包中的所有数据集。

> try(data(package = "AER") )
#列出包AER里的所有数据集。

> data(Affairs, "BankWages")
#读入数据集Affairs和BankWages(这些数据集需已在data()中列出)。

> help(Affairs)
#获取数据集Affairs的信息。

> attach(Affairs)
#贴上数据集Affairs，其作用是可以直接对数据集里的变量进行操作。

> detach(Affairs)
#上述操作的逆操作。


##################################
#对一般对象的基本操作
##################################

>objects()
>ls()
#列出所有对象。

> mode(x)
#查看对象x的模式：空，数值，字符，逻辑，复数，列表，函数(NULL，numeric，character，logical，complex，list，function)。

> class(x)
#查看对象x的类型：除了mode里列出的几种类型外，还有整数，矩阵，因子，阵列，数据框，时间序列(integer，matrix，factor，array，data frame，ts)等其他类型。mode主要用于区别数据存放的方式，而class是一种更细微的分类方式，比如矩阵，就是一种更“有序”的数据存放方式。此命令比mode常用。

> as.matrix(x)
#把对象x转为矩阵型。

> as.numeric(x)
#把对象x转为数值型。

> str(x)
#查看对象x的结构。str是structure的缩写。

> rm(x)
#移除对象x。

> rm(list=ls(all=TRUE))
#移除所有对象。

##################################
#与向量有关的基本操作
##################################

> x = c(1,2,4)
#生成元素依次为1,2,4的向量x，这里的c是concatenate的意思。注意其类型是数值，不是矩阵。

> x = c("a","b","cd")
#生成元素依次为"a","b","cd"的字符向量x。

> x = paste("a","b","cd")
#生成"a b cd"的字符x。

> x[a:b]
#向量x的第a到b个元素。

> x[-i]
#剔除向量x第i个元素所得的向量。

> length(x)
#向量x的长度。

> x = seq(a, b, length = n)
#生成以一个n维数值型向量x，第一个元素为a，最后一个元素为b，中间元素依次等距递增。(假设a<b)

> x = seq(a, b, c)
#生成一个数值型向量x，第一个元素为a，其后元素依次加c，直到最后一个元素加c大于b。(假设a<b)

> x = seq(a)
#从1开始生成一个递增或递减数值型向量x，最后一个元素绝对值为小于等于|a|的最大整数。

> x = a:b
#生成一个从a递增(减)到b的数值型向量x。(a和b都是整数)

> x = rep(v, n)
#对向量v进行n次复制生成新的向量x。

> x = rep(v, each = n)
#依次对向量v的每个元素复制n此生成新的向量x。

> x = round(v)
#生成一个向量x，其中每个元素是v对应元素的最近整数。

> order(x)
#获得向量x第i大元素在向量中的位置。

> rank(x)
#获得向量x每个元素大小位置。

> sort(x)
#对向量x从小到大进行排序。降序：sort(x, decreasing = TRUE)。

> tapply(x,f,g)
#根据因子f对向量x分类执行函数g。

> split(x,f)
#向量x按因子f分类。

> diff(x)
#返回向量x的差分向量。

> cumsum(x)
#返回向量x的累加向量。

##################################
#与矩阵有关的基本操作
##################################

> M = matrix(0,c(m,n))
#生成m行n列的0矩阵。

> M = rbind(X,Y)
#按行合并矩阵X和Y形成新矩阵M。(X和Y列数需相同）

> M = cbind(X,Y)
#按列合并矩阵X和Y形成新矩阵M。(X和Y行数需相同）

> colnames(M)
#矩阵M的列名。

> rownames(M)
#矩阵M的行名。

> nrow(M)
#矩阵M的行数。

> ncol(M)
#矩阵M的列数。

> diag(M)
#矩阵M的对角线元素形成的向量

> M = diag(x)
#生成以向量x为对角线元素，其他位置元素为0的矩阵M。

> dim(M)
#矩阵M的维度。

> M[i,]
#矩阵M第i行。(数值型)

> M[i,,drop = FALSE]
#矩阵M第i行。(矩阵型)

> M = M[-i,]
#删除矩阵M第i行。

> M[,j]
#矩阵M第j列。

> M[i,j]
#矩阵M第i行j列元素。

> t(M)
#矩阵M的转置。若M为数值型向量，则t(M)为矩阵型行向量。

> X%*%Y
#矩阵X乘矩阵Y。若Y是数值型的向量，R会自动判断其为行向量还是列向量。若X与Y为维度匹配的数值型向量，则返回的是矩阵型向量的内积。

> x%o%y
#数值型向量x与y的外积(矩阵型)。

> X*Y
#矩阵X与矩阵Y的Hadamard乘积。加、减、除、求余的规则和乘相同，即相同位置的元素进行运算。

> eigen(M)$val
> eigen(M)$vec
#求矩阵M的特征值和特征向量。

> solve(M)
#矩阵M求逆。

> solve(A,b)
#求解线性方程Ax=b。

> apply(M, dimcode, f, fargs)
#对矩阵M的行(dimcode=1)或列(dimcode=2)依次进行函数f操作，f的变量(arguments)方正fargs里。

##################################
#与列表有关的基本操作
##################################

> L = list(a = , b = , c = ,...)
#建立列表L。

> L$a
> L[[a]]
#返回列表L里的对象a。

> L$a = NULL
#去除列表L里的对象a。

> names(L)
#列出列表L里的对象名。

> unname(L)
#去掉列表L里的对象名。

> lapply(...)
#list apply。功能与apply类似(参考上面的apply)，用于列表型数据。

> sapply(...)
#simplified apply。功能与lapply类似，区别在于函数结果的类型不是列表(list)。

 
##################################
#与数据框有关的基本操作
##################################
#数据框是一种特殊的列表，所以对列表适用的函数往往对数据框也适用。此外，数据框也有矩阵型数据的特征，所以一些适用于矩阵型数据的函数，不如rbind，cbind，apply等也可以作用在数据框上。

> Data = data.frame(...)
#创建数据框Data。

> fix(Data)
#编辑数据框Data。

> head(Data)
#显示数据框Data的前几行。

> attribute(Data)
#列出数据框Data的组成部分。

> names(Data)
#显示数据框Data的变量名。

> row.names(Data)
#显示数据框Data的行名。

> Data$name1
#数据框Data中名为name1的变量。

> Data[i]
#数据框Data中第i个变量形成的数据框。

> merge(D1,D2)
#合并数据框D1和D2，需要D1和D2中有至少一个相同的变量。

##################################
#与逻辑型数据有关的基本操作
##################################

> is.data.frame(x)
#判断是否对象x是数据框。类似命令有is.ts(x)，is.numeric(x)等。

> all(x>a)
#判断是否对象x的每个元素都大于a。

> any(x>a)
#判断对象x的元素中是否存在一个大于a。

> x>y
#判断x的每个元素是否大于y的每个元素。

> x[x>a]
#向量x中大于a的元素组成的新向量。

> subset(x, x>a)
#向量x中大于a的元素组成的新向量。与上面例子的区别在于若向量元素里有NA，上面的例子会保留在结果中，而subset命令会剔除掉。

> which(x, x>a)
#返回向量中大于a的元素的位置。

> x = ifelse(b, u, v)
#生成一个与b(逻辑向量)维度相同的数值向量，若b[i]为TRUE，则x[i]为u，反之为v。
