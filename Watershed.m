close all;
I=imread('10.jpg');
I1=imtophat(I,strel('octagon',201));
figure,imshow(I1);
grayscale=rgb2gray(I1);
I2=imadjust(grayscale);
level=graythresh(I2);
BW=im2bw(I2,level);
C=~BW;
D=~bwdist(C);
D(C)=-Inf;
L=watershed(D);
Wi=label2rgb(L,'spring','c');
im=I;
im(L==0)=0;
figure,imshow(im);

