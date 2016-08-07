function[x,p0m,Hm,H,p1m,n1] = fuentebin(p0,n)
x=zeros(1,n);
n1=0;
p1 = 1 - p0;
for i=1:n
    r=rand;
    if r>=p0
        x(i)=1;
        n1=n1+1;
    end;
end
p1m=n1/n;
p0m=(n-n1)/n;
Hm=p1m*log2(1/p1m)+ p0m*log2(1/p0m);
H =p1*log2(1/p1)+ p0*log(1/p0);
         