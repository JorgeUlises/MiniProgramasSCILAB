close all; 
clear all; clc;
%TRANSFORMACIÓN GEOMÉTRICA DE PERSPECTIVA

im1 = imread('placasdelamadre.png');

y = [1,1,160]';
x = [1,330,330]';
%z = [1.7,1,1.1]';

yp = [63,20,132]';
xp = [84,295,310]';

% [ones(4,1),x,y,x.*y];
% a = M^(-1)*xp;
% b = M^(-1)*yp;
M = [x,y,ones(3,1)];

Mp = [xp,yp,ones(3,1)];
ap = Mp^(-1)*x;
bp = Mp^(-1)*y;

escala=1;
cz = [0,1/1000,escala]';
% for m=63:132
%     for n=84:310
%         im2(m,n)=im1(round(b'*[1;n;m;n*m]), round(a'*[1;n;m;n*m])); 
%     end; 
% end;

im2=uint8(zeros(288,384));
for m=1:288
    for n=1:384
        zt = cz'*[n;m;1];
        yt = round(bp'*[n;m;1]/zt);
        xt = round(ap'*[n;m;1]/zt);ym(m)=yt;xn(n)=xt;
        if(yt>=1 && yt<=160 && xt>=1 && xt<=330)
            im2(m,n)=im1(yt,xt);
        else
            im2(m,n)=uint8(0);
        end
    end
end

figure, imshow(im2);

