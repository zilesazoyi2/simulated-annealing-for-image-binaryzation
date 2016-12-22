function e = energy2( yuzhi,img)


histimg=imhist(img); %计算直方图
%bar(histimg);%画直方图

n0=0;
for i=1:yuzhi
n0=n0+histimg(i);

end



w0=n0/(256*256);% 前景区域所占像素点的比例
% w0


w1=1-w0;  % 背景区域所占像素点的比例







u0=0;
for i0=1: yuzhi
    u0=u0+i0*histimg(i0);
end
u0=u0/n0;   % 前景区域像素的平均灰度值



n1=0;
for  v2=(yuzhi+1):256

n1=n1+histimg(v2);

end  

%n1  % 背景区域所占像素点的个数





u1=0;
for j=(yuzhi+1):256
    u1=u1+j*histimg(j);
end
u1=u1/n1;   % 背景景区域像素的平均灰度值


 uimg=0;

 
 
 uimg= w0*u0+w1*u1;







%计算类间方差
var=w0*(u0-uimg)*(u0-uimg)+w1*(u1-uimg)*(u1-uimg);

e=var;


end

