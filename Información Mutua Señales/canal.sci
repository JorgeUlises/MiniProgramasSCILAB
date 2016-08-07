function y=canal(x,pc,pe)
    [M,N]=size(x);
    y=x;
    for i=1:N
        r=rand();
        if r<=pc then
            y(i)=x(i);
        elseif r<=pc+pe then
            y(i)=~x(i);
        else
            y(i)=0.5;
        end
    end
endfunction
