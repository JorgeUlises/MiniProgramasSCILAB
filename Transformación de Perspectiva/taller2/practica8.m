close all; clear all; clc;
%TRANSFORMACIÓN GEOMÉTRICA BILINEAL

im1 = imread('PlacaBlancoNegro.bmp');
y = [63,20,132,252]';
x = [84,295,310,129]';
yp = [1,1,160,160]';
xp = [1,330,330,1]';
% M = [ones(4,1),x,y,x.*y];
% a = M^(-1)*xp;
% b = M^(-1)*yp;
Mp = [ones(4,1),xp,yp,xp.*yp];
ap = Mp^(-1)*x;
bp = Mp^(-1)*y;

% for m=63:132
%     for n=84:310
%         im2(m,n)=im1(round(b'*[1;n;m;n*m]), round(a'*[1;n;m;n*m])); 
%     end; 
% end;

for m=1:160
    for n=1:330
        im2(m,n)=im1(round(bp'*[1;n;m;n*m]), round(ap'*[1;n;m;n*m])); 
    end; 
end;

figure, imshow(im2);