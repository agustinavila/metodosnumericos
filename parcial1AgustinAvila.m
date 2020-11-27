%% Parcial 1
% Metodos numericos
% Autor: Juan Agustin Avila
% Reg 26076
% 2/10/2020
clc;close all;
%% Punto 1

vectorReg= [2 6 0 7 6];
Min=min(vectorReg);         %Obtiene maximos y minimos
Max=max(vectorReg);
M = randi([-Min Max],4);    %Genera la matriz M

%eleccion de fila y columna
fila=1;columna=3;
punto1(M,fila,columna)      %Llama a la funcion donde se realizan las operaciones

%% Punto 2:
x=-10:.1:10;                %Define el invervalo de x
n=randi(40,1);
salida=punto2(Min,Max,x,n);   %Llama a la funcion
figure();                   %Grafica f(x)
plot(x,salida);grid;
title("Funcion f(x) punto 2");
xlabel("x");ylabel("f(x)");

%Punto c:
g=@(x)(cos(Max.*x));        %Declara g(x)
figure();plot(x,g(x));grid; %Grafica g(x)
title("Funcion g(x) punto 2");
xlabel("x");ylabel("f(x)");

%Punto d
cruces=[];  %Valores donde se cruzan
for i=1:length(x)               %Recorre todo el vector x
   y1=punto2(Min,Max,x(i),n);   %Calcula salida funcion f
   y2=cos(Max*x(i));            %Calcula salida funcion g
   if((abs(y1-y2))<.0001)       %Si ambas salidas son iguales
       cruces=[cruces; x(i) y1];%Agrega las coord a la matrix cruces
   end
end

cruces %No devuelve los resultados correctos

figure();                   %Grafica f(x)
plot(x,salida);grid;
hold;plot(x,g(x));%Grafica g(x)
title("Ambas funciones");
xlabel("x");ylabel("y(x)");


%% Punto 3:
disp("Punto 3:");
Ec1=[-0.22 .633 -1.105 1.547;   %Ecuaciones 1
    5.2 0 0 -3.4;
    .65 -1.95 3.25 -4.55;
    0 1.3 2.6 3.9]

Sol1=[-3.74;Max;11;10]          %Soluciones 1

Ec2=[1.5 -3.6 3.8 0;            %Ecuaciones 2
    0 5.6 -7 0;
    8.3 0 0 1.2;
    0 6.72 -8.4 0]

Sol2=[12;4.5;Min;-5.4]          %Soluciones 2

% Punto a
dr1=rank([Ec1 Sol1])-rank(Ec1)  %Compara rango de la matriz A y A ampliada
if dr1==0   %Si el rango de la matriz es igual al rango de la matriz ampliada
    disp("El sistema 1 tiene solucion")
    rref([Ec1 Sol1])
else        %Si no tienen el mismo rango, no tiene solucion
    disp("El sist 1 no tiene solucion")
end

dr2=rank([Ec2 Sol2])-rank(Ec2)
if dr2==0
    disp("El sistema 2 tiene solucion")
    rref([Ec2 Sol2])
else
    disp("El sist 2 no tiene solucion")
end

%Punto b:
x1=Ec1\Sol1                 % Obtiene la solucion del sistema 1
                            % El sistema 2 no tiene solucion
disp("Sistema 1:")
disp("y1= "+x1(1))
disp("y2= "+x1(2))
disp("y3= "+x1(3))
disp("y4= "+x1(4))

%% Funciones auxiliares:

function punto1(M,fila,columna)
    % Punto a
    disp("Punto a:")
    f=M(fila,:)
    c=M(:,columna)
    
    % Punto b
    disp("Punto b:")
    norm1=norm(f,1)
    normInf=norm(c,Inf)
    
    % Punto c
    disp("Punto c:")
    b=15*randn(4,1)
    b=ceil(b)
    x=M\b
    % Punto d
    disp("Punto d:")
    condicion1=cond(M)
    condicion2=cond(rref([M b]))
    
end

function salida=punto2(minimo,maximo,x,n) %Funcion del punto 2
    for i=1:length(x)               %Obtiene la salida para cada valor de x
        if x(i)<minimo              %Si x es menor al minimo:
            salida(i)=x(i)^2;
        elseif x(i)<maximo          %Si x es mayor o igual al minimo y menor del maximo
            salida(i)=n;
        else                        %Si x es mayor al maximo
            salida(i)=-x(i)+3;
        end
    end
end
    