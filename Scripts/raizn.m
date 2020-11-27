function [r] = raizn(n,a)
%programa que calcula la raiz enesima de un numero
% utilizando el metodo de NR
d=1; delta=0,000001;n=1
while(d>delta)&(n<100)
    p(1)=[1];
    p(n+1)=[-a];
    f1=feval(F,x+delta);
    dF=(f1-f)*delta;%derivada
    x=x-f/dF;%encuentra un nuevo x por NR
    d=abs(f/dF);%modifica d para cortar while
    n=n+1;%contador por si nunca se cumple la condicion




end

