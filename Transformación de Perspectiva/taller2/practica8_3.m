close all; clear all; clc;
%TRANSFORMACIÓN GEOMÉTRICA BILINEAL

im1 = imread('placasdelamadre.png');
y = [1,1,160,160]';
x = [1,330,330,1]';
yp = [63,20,132,252]';
xp = [84,295,310,129]';
M = [ones(4,1),x,y,x.*y];
a = M^(-1)*xp;
b = M^(-1)*yp;
% Mp = [ones(4,1),xp,yp,xp.*yp];
% ap = Mp^(-1)*x;
% bp = Mp^(-1)*y;
im2=zeros(288,384);

for i=1:160
    for j=1:330
        xt = [1 i j i*j]*a;
        yt = [1 i j i*j]*b;
        im3(round(xt),round(yt)) = im1(i,j);
        %im2(m,n)=im1(round(b'*[1;n;m;n*m]), round(a'*[1;n;m;n*m])); 
    end; 
end;

% for m=1:160
%     for n=1:330
%         im2(m,n)=im1(round(bp'*[1;n;m;n*m]), round(ap'*[1;n;m;n*m])); 
%     end;
% end;

figure, imshow(im2);
figure, imshow(im3);


