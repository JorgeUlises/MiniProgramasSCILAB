close all; clear all; clc;
%TRANSFORMACIÓN GEOMÉTRICA BILINEAL

im1 = imread('placasdelamadre.png');
y = [1,1,160,160]';
x = [1,330,330,1]';
yp = [63,20,132,252]';
xp = [84,295,310,129]';

% M = [ones(4,1),x,y,x.*y];
% a = M^(-1)*xp;
% b = M^(-1)*yp;

Mp = [xp,yp,xp.*yp,ones(4,1)];
ap = Mp^(-1)*x;
bp = Mp^(-1)*y;

% for m=63:132
%     for n=84:310
%         im2(m,n)=im1(round(b'*[1;n;m;n*m]), round(a'*[1;n;m;n*m])); 
%     end; 
% end;

im2=uint8(zeros(288,384));
for m=1:288
    for n=1:384
        yt = round(bp'*[n;m;n*m;1]);
        xt = round(ap'*[n;m;n*m;1]);ym(m)=yt;xn(n)=xt;
        if(yt>=1 && yt<=160 && xt>=1 && xt<=330)
            im2(m,n)=im1(yt,xt);
        else
            im2(m,n)=uint8(0);
        end
    end
end

figure, imshow(im2);

