function [r n]=secante(f,x)
%calcula la raiz usando el metodo de la secante
n=0;
tol=10;
while tol>0.001 && n<50
   fx1=f(x(1));
    fx2=f(x(2));
    
    x(3)=x(2)-fx2*((x(2)-x(1))/(fx2-fx1));
    tol=abs(x(2)-x(3));
    
    x(1)=[];
 n=n+1;
end
r=x(2);
end