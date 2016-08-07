close all; 
clear all; clc;
%TRANSFORMACIÓN GEOMÉTRICA DE PERSPECTIVA

im1 = imread('placasdelamadre.png');

y = [1,1,160,160]';
x = [1,330,330,1]';
z = [0,0,0,0]';

% yp = [63,20,132,252]';
% xp = [84,295,310,129]';
yp = [1,1,160,160]';
xp = [30,330,330,1]';
zp = [1,2,5,1]';

Mp = [xp,yp,zp,ones(4,1)];
ap = Mp^(-1)*x;
bp = Mp^(-1)*y;
cp = Mp^(-1)*z;

%escala=1;
%cz = [0,0,0,escala]';
% for m=63:132
%     for n=84:310
%         im2(m,n)=im1(round(b'*[1;n;m;n*m]), round(a'*[1;n;m;n*m])); 
%     end; 
% end;

dx=0;
dy=0;
dz=0;
escala=1;
cz = [dx,dx,dz,escala]';

im2=uint8(zeros(288,384));
for m=1:288
    for n=1:384
        %sobre el plano z=1
        za = 0;
        zt = cz'*[n;m;za;1];
        v = round(bp'*[n;m;za;1]/zt);
        u = round(ap'*[n;m;za;1]/zt);
        if(v>=1 && v<=160 && u>=1 && u<=330)
            im2(m,n)=im1(v,u);
        else
            im2(m,n)=uint8(0);
        end
    end
end

figure, imshow(im2);

