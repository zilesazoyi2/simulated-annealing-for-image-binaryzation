close all;

clear all;

clc;
tic;
global im;
[filename, pathname] = uigetfile({'*.bmp'},'请选择测试样本文件夹中的一张图片');
str = [pathname, filename];
img = imread(str);
figure;
imshow(img);
title('原图');

newimg=img;

mimg=mean(mean(img))
%------------
temperature=10;

iter=10;
yuzhi=ceil(mimg);

%yuzhi=150;
k=1;
%模拟退火过程
while temperature>0
    for i=1:iter
        e1=energy2(yuzhi,img)
        
        newyuzhi=updateyuzhi(yuzhi)
       
        e2=energy2(newyuzhi,img)
        
        delta_e=e1-e2;   
        if delta_e<0       
            yuzhi=newyuzhi;
            
        else                        %温度越低，越不太可能接受新解；新老能量差值越大，越不太可能接受新解
            if exp(-delta_e/temperature)>rand() %以概率选择是否接受新解
                yuzhi=newyuzhi;      
            end
        end  
        yuzhi
    end
    k=k+1;

    temperature=temperature-1;   %温度不断下降
  
end  

disp(['程序运行总时间为：']);
toc;

disp(['外循环次数为：']);
k

disp(['图像分割的初始阈值为：']);

ceil(mimg)



disp(['模拟退火计算出的阈值为：']);
 yuzhi

for i=1:256
    for j=1:256
        if newimg(i,j)>yuzhi
            newimg(i,j)=256;
        else
            newimg(i,j)=1;
        end
    end
end
figure;
imshow(newimg);
title('二值化后图像');

            
 I =  img;     

 level = graythresh(I); %也就是原理中循环查找使得类间方差最大化的阈值步骤    

disp(['ostu法计算出的阈值为：']);
ostuyuzhi=ceil(level*256)
BW = im2bw(I,level);   
imwrite(BW, 'ostuimg.bmp', 'bmp');

imwrite(uint8(newimg), 'fireimg.bmp', 'bmp');
