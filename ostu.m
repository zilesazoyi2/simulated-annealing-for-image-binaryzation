 I = imread('2.bmp');       

 level = graythresh(I) %也就是原理中循环查找使得类间方差最大化的阈值步骤    

BW = im2bw(I,level);     %找到阈值二值化即可

figure, imshow(BW)

yuzhi=level*256



