a=imread('2.jpg');
subplot(2,2,1);
imshow(a);
imgray=rgb2gray(a);
subplot(2,2,2);
imshow(imgray);
thresh=graythresh(imgray);
b=im2bw(imgray,thresh);
subplot(2,2,3);
imshow(b);
s=strel('square',15);
i=imerode(b,s);
i1=imdilate(b,s);
subplot(2,2,4);
imshow(i1);
