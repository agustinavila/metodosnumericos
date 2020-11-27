function [ I ] = trapecio(f,a,b,n)
%esta funcion calcula integrales
%usando la aproximacion del trapecio
h=(b-a)/n;
x=a:h:b;
y=f(x);
I=(h/2)*(y(1)+y(end)+2*sum(y(2:end-1)));
end

