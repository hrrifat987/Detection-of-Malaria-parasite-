clc
clear all
close all
[fname path]=uigetfile('*.*','Enter an Image');
fname=strcat(path,fname);
im=imread(fname);
figure;
imshow(im);
hsv1=rgb2hsv(im);
figure;
imshow(hsv1);
hueimg=hsv1(:,:,1);
saturationimg=hsv1(:,:,2);
valueimg=hsv1(:,:,3);
bluePixels=hueimg>0.3 & hueimg<0.8 & valueimg<0.8;
saturationimg(bluePixels)=saturationimg(bluePixels)*9.5;
i1=im2bw(saturationimg,0.97);
figure;
imshow(i1);