clear all;
//clc;
//TRANSFORMACIÓN GEOMÉTRICA BILINEAL

im1 = imread('placasdelamadre.png');
y = [1,1,160,160]';
x = [1,330,330,1]';
yp = [63,20,132,252]';
xp = [84,295,310,129]';

Mp = [xp,yp,xp.*yp,ones(4,1)];
ap = Mp^(-1)*x;
bp = Mp^(-1)*y;


im2=zeros(288,384);
for m=1:288
    for n=1:384
        yt = round(bp'*[n;m;n*m;1]);
        xt = round(ap'*[n;m;n*m;1]);
        if yt>=1 & yt<=160 & xt>=1 & xt<=330 then
            im2(m,n)=im1(yt,xt);
        else
            im2(m,n)=0;
        end
    end
end
im2=uint8(im2);
imshow(im2);

