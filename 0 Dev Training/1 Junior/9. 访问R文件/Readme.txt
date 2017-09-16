. 将R语言部分集中写在一个文件中，然后在R环境中进行调用。

   参见:

         http://m.blog.csdn.net/blog/u012543538/13774477

例如我们写下下面的函数

matchar  <- function(name) {

  name = unlist(name)

  name = as.character(name)

  return(name)

  }

将它保存为matchar.r

如果他的保存路径为C:\pa

那么下次调用这个函数时，不必重新定义

只要

  path="C:/pa" #声明matchar.r所在位置

setwd(path)  #把工作路径设置到path

source('matchar.r')  #“预装“函数

这时候如果你输入matchar

R工作台就成显示matchar函数的代码，说明预装成功，可以使用了。


source("d:/R script/test.r")

  


