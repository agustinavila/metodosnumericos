function S=solucion1(A,b)
b=b(:);r=rank(A);AA=[A,b];ra=rank(AA);
if ra>r S='no tiene solucion'; else S=A\b;end