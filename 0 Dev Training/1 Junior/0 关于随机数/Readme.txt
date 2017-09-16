参见：

     http://blog.sina.com.cn/s/blog_9f23a8da0101cskv.html

.  使用R 语言的 random 包，就可以获得真随机数。

   也可以用 http://www.random.org

. 安装 random 包的步骤如下:

  程序包->安装程序包->在弹出的对话框中，选择你要安装的包random，然后确定。

    由于random 包需要使用curl 包， 所以同时会安装curl 包

 查看 random 包和 curl 包的帮助信息

  > help(package="random")     ##### 可以发现 random 包中的函数结构其实也都是从random.org 中获取的真随机数

  > library(help="random")    获取包的基本信息

  测试：

  >library("random")
  >

  
. 通过 www.random.org 获取真随机数

  