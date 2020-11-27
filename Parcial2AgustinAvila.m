%% Metodos numericos
%% Parcial 2
%% Autor: Juan Agustin Avila
%% Fecha: 30/10/2020
%% 4to semestre ELO UNSJ
%% Realizado en MatLab r2020b


%% Punto 1:
%punto 1.a teorico
disp("Punto 1:")
disp("b:")
%funcion 1:
x=0:.01:15;
f1=@(x) (cos(x).*cosh(x))+1;
figure(1);plot(x,f1(x)); grid minor;title("Funcion 1 del punto 1b");
ylim([-1 1]);
a=ginput();
disp("Por el metodo grafico:");
disp("Hay un cero en "+a(:,1));
hold on;
for i = 1:length(a)
    [r n]=NR1(f1,a(i,1)-.2);                    %Toma como punto d epartida valores cercanos a las raices encontradas graficamente
    if ~isnan(r)&r>=x(1)&r<=x(end)              %Comprueba que de un valor numerico dentro del rango
        disp("Con el metodo de NR hay una raiz en "+r);
        plot(r,0,'o')
    end
end
for i = 1:length(a)
    [r n]=secante(f1,[a(i,1)-.3 a(i,1)-.2]);    %Selecciona puntos en base a cada una de las raices encontradas graficamente
    if ~isnan(r)&&r>=x(1)&&r<=x(end)              %Comprueba que de un valor numerico dentro del rango
        disp("Con el metodo de la secante hay una raiz en "+r);
    end
end
ylim auto;

disp("funcion 2:")
f2=@(x)((log(x+1)/((x.^2)+1))-(x.^2)+(8.*x)-6);
figure(2);plot(x,f2(x)); grid minor;title("Funcion 2 del punto 1b");
ylim([-1 1]);
a=ginput();
disp("Por el metodo grafico:");
disp("Hay un cero en "+a(:,1));
hold on;
for i = 1:length(a)
    [r n]=NR1(f2,a(i,1)-.2);                    %Toma como punto d epartida valores cercanos a las raices encontradas graficamente
    if ~isnan(r)&&r>=x(1)&&r<=x(end)              %Comprueba que de un valor numerico dentro del rango
        disp("Con el metodo de NR hay una raiz en "+r);
        plot(r,0,'o')
    end
end
for i = 1:length(a)
    [r n]=secante(f2,[a(i,1)-.3 a(i,1)-.2]);    %Selecciona puntos en base a cada una de las raices encontradas graficamente
    if ~isnan(r)&&r>=x(1)&&r<=x(end)              %Comprueba que de un valor numerico dentro del rango
        disp("Con el metodo de la secante hay una raiz en "+r);
    end
end
xlim auto; ylim auto;


%% Punto 2:
disp("Punto 2:")
a=-pi;b=pi;h=pi/12;n=(b-a)/h;
x=a:h:b;
f=@(x)(2.*sin(x).*cos(x).*cos(x));
%plot(x,f(x))
I=abs(simpson(f,a,0,n/2))+abs(simpson(f,0,b,n/2));
disp("El area bajo la curva es "+I);


%% Punto 3:
disp("Punto 3:")
x=0:.75:6;
y=[0 .866025 1.22474 1.5 1.7321 1.9365 2.1213 2.2913 2.4495];
plot(x,y)
i=simpson2(x,y);
disp("La integral de la funcion entre 0 y 6 es aproximadamente "+i);

%% Punto 4:
disp("Punto 4:")
disp("sistema 1")
x=0:.1:10;
y=-5:.1:5;
[x1,x2]=meshgrid(x,y);
f=((x1.^2)+(x2.^2)+8)./(x1);
figure;
[C1,f1]=contour(x1,x2,f,[10 10]);
clabel(C1);
hold on
g=((x1.*x2.^2)+x1+8)./x2;
[C2,g2] = contour(x1,x2,g,[10 10]);
clabel(C2)
title("Punto 4 Sistema 1")
a=ginput();
disp("Por el metodo grafico:");
for i =1:length(a)
disp("Hay un cruce en x1="+a(i,1)+" y x2="+a(i,2));
end
hold on;
%No logre hacer andar el NR
% for i = 1:length(a)
%     [xx yy]=nolineales(f,g,a(i,1),a(i,2));                    %Toma como punto d epartida valores cercanos a las raices encontradas graficamente
%     %if ~isnan(r)&r>=x(1)&r<=x(end)              %Comprueba que de un valor numerico dentro del rango
%         disp("Con el metodo de NR hay una raiz en x1="+xx+" y x2="+yy);
%         plot(r,0,'o')
%     %end
% end

disp("sistema 2")
x=-5:.1:5;
y=-5:.1:5;
[x1,x2]=meshgrid(x,y);
f=(log((x1.^2)+(x2.^2))-sin(x1.*x2));
figure;
[C1,f1]=contour(x1,x2,f,[log(2)+log(pi) log(2)+log(pi)]);
clabel(C1);
hold on
g=(exp(x1-x2)+cos(x1.*x2));
[C2,g2] = contour(x1,x2,g,[0 0]);
clabel(C2)
title("Punto 4 Sistema 2")
a=ginput();
disp("Por el metodo grafico:");
for i =1:length(a)
disp("Hay un cruce en x1="+a(i,1)+" y x2="+a(i,2));
end
hold on;
% for i = 1:length(a)
%     [r y]=nolineales(f,g,a(i,1),a(i,2));                    %Toma como punto d epartida valores cercanos a las raices encontradas graficamente
%     %if ~isnan(r)&r>=x(1)&r<=x(end)              %Comprueba que de un valor numerico dentro del rango
%         disp("Con el metodo de NR hay una raiz en x1="+r+" y x2="+y);
%         plot(r,0,'o')
%     %end
% end


%% funciones auxiliares:
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

function [ I ] = simpson(f,a,b,n)
%esta funcion calcula integrales
%usando el metodo de simpson

n=2*fix(n/2);
h=(b-a)/n;
x=a:h:b;
y=f(x);
I=h/3*(y(1)+y(n)+2*sum(y(3:2:n-2))+4*sum(y(2:2:n-1)));
end

function [ I ] = simpson2(x,y)
%esta funcion calcula integrales
%usando el metodo de simpson
h=(x(end)-x(1))/(length(x)-1);
n=length(x);
I0=0;
if ~rem(n,2) %Intervalo par
    I0=(y(n)+y(n-1))*(h/2); %metodo del trapecio
    n=n-1;
end
I=h/3*(y(1)+y(n)+2*sum(y(3:2:n-2))+4*sum(y(2:2:n-1)))+I0;
end

function [ x y ] = nolineales( f,g,a,b )
n=0;
tol=10;
dx=.00001;
dy=dx;
while tol>.0001 && n<50
    dfx=(f(a+dx,b)-f(a,b))/dx;
    dgx=(g(a+dx,b)-g(a,b))/dx;
    dfy=(f(a,b+dy)-f(a,b))/dy;
    dgy=(g(a,b+dy)-g(a,b))/dy;
    J=[dfx dfy; dgx dgy];
    D=J\[-f(a,b); -g(a,b)];
    a=a+D(1);
    b=b+D(2);
    tol=norm(D);
    n=n+1;
end
x=a;
y=b;
end
