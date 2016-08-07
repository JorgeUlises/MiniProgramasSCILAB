function sal=generador(N, p1)
  cont=0;
  x=zeros(1,N);
  p0=1-p1;
  for i = 1:N
      r=rand();
      if r > p0 then
          x(i)=0;
          cont=cont+1;
      else
          x(i)=1;
      end
  end
  Pm1=(N-cont)/N;
  Pm0=1-Pm1;
  disp("Porcentaje de 0: "+string(Pm0));
  disp("Porcentaje de 1: "+string(Pm1));
  sal=x;
endfunction
