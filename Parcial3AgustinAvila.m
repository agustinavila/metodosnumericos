%% parcial 3
% Métodos numericos
% Juan Agustin Avila
% Reg 26076
% 27/11/2020
% matlab r2020b

%% Punto 1
disp("Punto 1: ");
intervalo=[0 3];
condiniciales=[2 1 -1];
[x,y]=ode23('funcion1',intervalo,condiniciales);
figure(1);
plot(x,y);grid on;
title("Solucion al ODE");
legend("y(t)","y'(t)","y''(t)")
saveas(1,"Punto1.png");
y=y(:,2);%Para correr el punto 2 varias veces seguidas


%% Punto 2
disp("Punto 2: ");
p=polyfit(x,y,3);
z=polyval(p,x);
figure(2);
plot(x,y);hold on;plot(x,z);grid on;
title("Grafica original vs aproximacion con un polinomio de orden 3");
legend("Funcion original","Aproximacion");
saveas(2,"punto2.png");
error=norm(z-y);
disp("El error cometido es "+error);


%% Punto 3
disp("Punto 3: ");
global x y
x=[.5 1.6 2.1 3.5 4.8 5.6 6];
y=[3 4.86 5.95 3.75 1.76 0.24 1.88];
%punto3a
figure(3);
plot(x,y,'ob');grid on; title("Punto 3: datos originales");
xlim([0 7]);
saveas(3,"punto3a.png");
%punto3b
%Observando los puntos, se asume que es una funcion seno
c0=[3 2*pi/6 0 3];
%c1 amplitud, c2 frecuencia, c3 desfasaje y c4 desplazamiento
global norma;
norma=1;
c(1,:)=fminsearch('funmin',c0);
disp("Los coef para norma 1 son: ");c(1,:)
norma=2;
c(2,:)=fminsearch('funmin',c0);
disp("Los coef para norma 2 son: ");c(2,:)
norma="inf";
c(3,:)=fminsearch('funmin',c0);
disp("Los coef para norma infinito son: ");c(3,:)
hold on;
xx=0:.01:7;
for i=1:3
    z=c(i,1)*sin(c(i,2)*xx+c(i,3))+c(i,4);
    zerr=c(i,1)*sin(c(i,2)*x+c(i,3))+c(i,4);%solo para calcular el error
    plot(xx,z);
    error(i)=norm(zerr-y);
end
legend("datos originales","aprox con norma 1","aprox con norma 2","aprox con norma inf");
title("Comparacion de aproximaciones con distintas normas")
saveas(3,"punto3b.png");
%punto 3c
disp("El error con norma 1 es "+error(1));
disp("El error con norma 2 es "+error(2));
disp("El error con norma infinito es "+error(3));
%punto 3d
ygraf=ginput()
disp("graficamente y vale "+ygraf(2));
yanalitico=c(2,1)*sin(c(2,2)*3.5+c(2,3))+c(2,4);
disp("Calculandolo con norma 2, y vale "+yanalitico);

%% Punto 4:
x=0:10;
y=sin(x);
y(5)=y(5)+1;    %Generando un outlier
figure(4)
plot(x,y,'+');grid on;
c=[1 1 0 0];
%c1 amplitud, c2 frecuencia, c3 desfasaje y c4 desplazamiento
global norma;
norma=1;
c(1,:)=fminsearch('funmin',c0);
norma=2;
c(2,:)=fminsearch('funmin',c0);
norma="inf";
c(3,:)=fminsearch('funmin',c0);
hold on;
xx=0:.01:10;
for i=1:3
    z=c(i,1)*sin(c(i,2)*xx+c(i,3))+c(i,4);
    plot(xx,z);
end
z=sin(xx);  %calculando la original
plot(xx,z);
legend("datos con outlier","aprox con norma 1","aprox con norma 2","aprox con norma inf","Funcion original",'Location','SouthEast');
saveas(4,"punto4.png");



%% Funciones auxiliares

function dy = funcion1(t,y)
    dy=zeros(3,1);
    dy(1)=y(2);
    dy(2)=y(3);
    dy(3)=3*exp(t)-3*y(3)+4*y(2)-9*y(1);
end

function d = funmin(c)
    global x y norma;
    x=x(:);
    y=y(:);
    z=c(1)*sin(c(2)*x+c(3))+c(4);
    d=norm(z-y,norma);
end