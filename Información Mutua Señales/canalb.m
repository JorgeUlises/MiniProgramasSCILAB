function [y,Im,I]=canalb(x,pb0,pb1,p10,p01,p0,n1)
b=0.5;
n=length(x);
n01=0;
n0b=0;
n10=0;
n1b=0;
y=x;
p11 = 1 - p10 - pb1;
p00 = 1 - p01 - pb0;
n0 = n - n1;
p1 = 1 - p0;
p1m = n1/n;
p0m = n0/n;
for i=1:n
    r=rand;
    if x(i) == 0
        if r>p00
            if r<(p00+p10)
                y(i)=~x(i);
                n01=n01+1;
            else
                y(i)=b;
                n0b=n0b+1;
            end
        end
    else
        if r>p11
            if r<(p11+p0)
                y(i)=~x(i);
                n10=n10+1;
            else
                y(i)=b;
                n1b=n1b+1;
            end
        end
    end
end
pm00 = (n0 - n01 - n0b)/n0; %Probabilidades de salida versus entrada medidas.
pm10 = n01/n0;
pm11 = (n1 - n10 - n1b)/n1;
pm01 = n10/n1;
pmb1 = n1b/n1;
pmb0 = n0b/n1;

py0 = p1*p01 + p0*p00;   %probabilidades de la salida teoricas
py1 = p1*p11 + p0*p10;
pyb = p0*pb0 + p1*pb1;

pmy0 = p1m*pm01 + p0m*pm00; %probabilidades de la salida medidas
pmy1 = p1m*pm11 + p0m*pm10;
pmyb = p0m*pmb0 + p1m*pmb1;

Hm=p1m*log2(1/p1m)+ p0m*log2(1/p0m); %entropia entrada medida
H =p1*log2(1/p1)+ p0*log(1/p0); %entropia entrada teorica

%La linea siguiente representa el calculo de la entropia entrada-salida
%teorica
Hxy = p0*p10*log2(py1/(p0*p10))+ p1*p01*log2(py0/(p1*p01)) + p0*p00*log2(py0/(p0*p00)) + p1*p11*log2(py1/(p1*p11)) + p0*pb0*log2(pyb/(p0*pb0)) + p1*pb1*log2(pyb/(p1*pb1));
%La linea siguiente representa el calculo de la entropia entrada-salida
%medida
Hxym = p0m*pm10*log2(pmy1/(p0m*pm10))+ p1m*pm01*log2(pmy0/(p1m*pm01)) + p0m*pm00*log2(pmy0/(p0m*pm00)) + p1m*pm11*log2(pmy1/(p1m*pm11)) + p0m*pmb0*log2(pmyb/(p0m*pmb0)) + p1m*pmb1*log2(pmyb/(p1m*pmb1));

%Información mutua, medida y teorica respectivamente 
Im = Hm - Hxym;
I = H - Hxy;

    
                
        
                
                