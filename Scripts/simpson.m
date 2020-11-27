function [ I ] = simpson(f,a,b,n)
%esta funcion calcula integrales
%usando el metodo de simpson
 if nargin ==3
     n=5000;
 end
 
n=2*fix(n/2)
h=(b-a)/n;
x=a:h:b;
y=f(x);
I0=0;
if ~rem(n,2) %Intervalo par
    I0=((y(n)+y(n-1))*h/2; %metodo del trapecio
    n=n-1;
I=h/3*(y(1)+y(n)+2*sum(y(3:2:n-2))+4*sum(y(2:2:n-1)))+I0;
end

