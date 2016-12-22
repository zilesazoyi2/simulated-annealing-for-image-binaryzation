im=imread('5.bmp'); %文件名为1.jpg的图像，放在c盘底下，当然路径都可以自己改
histimg=imhist(im); %计算直方图
bar(histimg);%画直方图

yuzhi=150;
w0=0;
for i=1: yuzhi
    w0=w0+histimg(i)/(256*256);
end

w0  % 前景区域所占像素点的比例

w1=1-w0  % 背景区域所占像素点的比例


n0=0;
for  v=1:yuzhi

n0=n0+histimg(v);

end  

n0 % 前景区域所占像素点的个数



u0=0;
for i0=1: yuzhi
    u0=u0+i0*histimg(i0);
end
u0=u0/n0   % 前景区域像素的平均灰度值



n1=0;
for  v2=(yuzhi+1):256

n1=n1+histimg(v2);

end  

n1    % 背景区域所占像素点的个数





u1=0;
for j=(yuzhi+1):256
    u1=u1+j*histimg(j);
end
u1=u1/n1   % 背景景区域像素的平均灰度值


 uimg=0;
for s=1:256
    
uimg=uimg+s*histimg(s);
end 
uimg=uimg/(256*256)

%计算类间方差
var=w0*(u0-uimg)*(u0-uimg)+w1*(u1-uimg)*(u1-uimg)


