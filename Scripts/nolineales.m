function [ x y ] = nolineales( f,g,a,b )
n=0;
tol=10;
dx=exp(-5);
dy=exp(-5);
while tol>exp(-4) && n<50
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
