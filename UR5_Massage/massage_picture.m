clear;
clc;
% Img = imread('massage_picture.jpg');
% level=graythresh(Img);
% q1=length(Img(:,1,1));
% q2=length(Img(1,:,1));
% x=q1:-1:1;
% y=1:q2;
% [X,Y]=meshgrid(x,y);
% figure(1);
% plot3(X,Y,Img(:,:,1),'k');
% figure(2);%image perform in figure
% MassageImg = imresize(im2bw(Img,0.95),0.3);
% MassageImg = ~MassageImg;
% MassageImg = flipud(MassageImg);
% [col, row] = size(MassageImg);
% imshow(MassageImg);
%%
p=imread('massage_picture.jpg');
g=rgb2gray(p); % תΪ�ҽ�ͼ
gg=double(g); % תΪ��ֵ����
gg=1-gg/255; % ����ɫֵתΪ 0-1 �Ľ���ֵ
[x,y]=size(gg); % ȡԭͼ��С
[X,Y]=meshgrid(1:y,1:x); % ��ԭͼ��С��������
n=0.2;
mesh(-n*X,-n*Y,-gg); % �����ϻ���ͼ��
colormap gray; % ��Ϊ�ҽ�ͼ��