�μ�:

    http://www.tuicool.com/articles/Aby2Qn

. ����R ������ѧ����ͼ�� �򵥡���������á�

  �ڸ��������Ͷ�����Χ��, ����curve ���Ի�����ͼ��

. ����˵��

  par(mfrow=c91��3))

  > curve(sin, -3,3,col="red")

  > curve(dnorm, -3.5, 3.5, main="Std.Normal Density", col="green")   # dnorm()����̫�ֲ�����

  > f <- function(x) exp(-abs(x)) * sin(2 * pi * x)

  > curve( f, -5, +5, main="Dampened Sine Wave", col="blue")