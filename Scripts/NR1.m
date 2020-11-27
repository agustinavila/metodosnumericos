function [r n]=NR1(f,x1)
%calcula raiz usando newton raphson
n=0;
tol=10;
delta=0.000001;
while tol>0.001 && n<50
    
   fx1=f(x1);%valua la funcion en x1
   df=(f(x1+delta)-f(x1))/delta;%aplica definicion de derivada
   x2=x1-fx1/df; %calcula el valor de x2
   tol=abs(x2-x1);
   x1=x2; %le da a x1 el valor de x2 para la pasada siguiente
   n=n+1;
end
r=x1(1);%retorna el valor x1
end
