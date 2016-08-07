function x=generador(N, p0)
  cont=0
  x=zeros(1,N);
  for i=1:N
      r=rand;
      if r>p0 then
          x(i)=0;
      else
          x(i)=1;
      end
  end
endfunction
