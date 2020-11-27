%% clase 4/9/20

%% punto 1:
A=[2 1; 4 0];
B=[1 sqrt(2) log(4) ; exp(-3) sin(1) tan(pi/3) ; atan(7) abs(-1) 5^3];
%punto a:
disp("A transpuesta:")
A_trasp=A'
disp("Dimension de A: ")
A_tamanio=size(A)
A_det=det(A);
disp("Determinante de A: "+A_det);
% punto b:
C=eye(2)
%punto c:
D=A_trasp+3*C
%% Punto 2
disp("Punto 2:")

%% Punto 3:
disp("Punto 3:")
v1 = 2 : 3: 12;
v2 =(10: -1: 2)';
v3 = 2:10;
v4 = [4 3 1 6];
length(v1) 
sum(v3) 
size(v4)

%% punto 4:
w1=1:2:7;
w2=4:4:19;
w3=10:-2:4;
w4=(1:100)/3;

%% punto 5:
B=[1:4;5:8;2 3 6 9]
C=eye(3);
D=[4 3 2 1 0];
b1=B(1:3,2);
b2=B(:,4:-1:1); 
b3=B([1 3],[1 2 4]); 
b4=B([1 2 3 1 3 2],[2 3]);

M=[B C]
%N=[[B C];D]
%P=[B D] 

%% Punto 6:

E = 4*rand(5,6) + 2.5;
F=fix(E)
G=ceil(E) 
K=fix(10*(rand(3,4)-0.5)) 
H=round(E)
I=floor(E)

%% Punto 7:
disp("Punto 7:")
B=[1 sqrt(2) log(4) ; exp(-3) sin(1) tan(pi/3) ; atan(7) abs(-1) 5^3]
sum(B) 
sum(B') 
sum(B')'

[v,f] = sort(B(:,1));Bo= B(f,:) %V es el valor, f el indice
[v,f] = sort(-B(:,2)) ; B1=B(f,:)

%% clase 11/9
%% punto 8:
y1=punto8(0)
y2=punto8(3)
x=0:.1:3;
n=length(x);
salida=[];
for i=1:n
    salida=[salida punto8(x(i))];
end
maximo=max(salida)
minimo=min(salida)
figure();
plot(x,salida);grid on;hold on;
f=@(x)(exp(x)-2); 
plot(x,f(x),'--')
title("Funcion punto 8");
legend('Utilizando funcion extra','de pecho');

% %% punto 9:
% disp("Punto 9")
% % punto 9a:
% x=0:.01:pi;
% n=length(x);
% salida=[];
% for i=1:n
%     salida=[salida punto9a(x(i))];
% end
% maximo=max(salida)
% minimo=min(salida)
% figure();
% plot(x,salida);grid on;hold on;
% f=@(x)(sin(x.^2)); 
% plot(x,f(x),'--')
% title("Funcion punto 9a");
% legend('Utilizando funcion extra','de pecho');
% 
% % punto 9b:
% x=-3:.01:9;
% n=length(x);
% salida=[];
% for i=1:n
%     salida=[salida punto9b(x(i))];
% end
% maximo=max(salida)
% minimo=min(salida)
% figure();
% plot(x,salida);grid on;hold on;
% f=@(x)(3*(x.^3)-20.*x+2); 
% plot(x,f(x),'--')
% title("Funcion punto 9b");
% legend('Utilizando funcion extra','de pecho');
% 
% % punto 9c:
% x=0:.01:6;
% n=length(x);
% salida=[];
% for i=1:n
%     salida=[salida punto9c(x(i))];
% end
% maximo=max(salida)
% minimo=min(salida)
% figure();
% plot(x,salida);grid on;hold on;
% f=@(x)(sin(pi*x/6)); 
% plot(x,f(x),'--')
% title("Funcion punto 9c");
% legend('Utilizando funcion extra','de pecho');
% 
% % punto 9d:
% x=0:.01:6.3;
% n=length(x);
% salida=[];
% for i=1:n
%     salida=[salida punto9d(x(i))];
% end
% maximo=max(salida)
% minimo=min(salida)
% figure();
% plot(x,salida);grid on;hold on;
% f=@(x)((.5*exp(x/3))-((x.^2).*sin(x))); 
% plot(x,f(x),'--')
% title("Funcion punto 9d");
% legend('Utilizando funcion extra','de pecho');


%% Punto 10

%% Punto 11
X1=hilbert(5);
X2=hilb(5);

%% Punto 12

%% Punto 13
B
ordene(B,1)


%% funciones usadas:
function y=punto8(x)
y=exp(x)-2;
end
function y=punto9a(x)
y=sin(x^2);
end
function y=punto9b(x)
y=3*(x^3)-20*x+2;
end
function y=punto9c(x)
y=sin(pi*x/6);
end
function y=punto9d(x)
y=.5*exp(x/3)-(x^2)*sin(x);
end

function y=raices(x)
    
end

function X=hilbert(n)
    X=[]
    for i=1:n
        for j=1:n
            X(i,j)=1/(i+j-1);
        end
    end
end

function a=angulo(u,v)

end

function X=ordene(A,n)
    if(n>size(A,2))
        error("Columna fuera de rango")
    end
    [v,f]=sort(A(:,1));
    X= A(f,:)
end