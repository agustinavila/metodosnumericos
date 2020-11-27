function d = funmin(c)
    global x y norma;
    x=x(:);
    y=y(:);
    z=c(1)*sin(c(2)*x+c(3))+c(4);
    d=norm(z-y,norma);
end