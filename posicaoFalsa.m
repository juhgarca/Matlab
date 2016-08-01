%======================================
%Implementação Método da Posição Falsa
%Autora: Juliana Lima Garça
%======================================

clear
clc

fprintf('----> Método da Posição Falsa <----\n');

f = @(x)(x-1)^2*(x-1.5);
a = 2;
b = 3;
e1 = 10^-7;
e2 = 10^-7;

if b - a < e1
    x = (a*f(b) - b*f(a))/(f(b)-f(a));
    fprintf('x = %f\n', x);
    return
elseif abs(f(a)) < e2
    x = a;
    fprintf('x = %f\n', x);
    return
elseif abs(f(b)) < e2
    x = b;
    fprintf('x = %f\n', x);
    return
end

k = 0;
kmax = 50;
x = (a*f(b) - b*f(a))/(f(b)-f(a));
while (abs(f(x)) > e2) && (b-a > e1) && (k < kmax)
   k = k+1;
   x = (a*f(b) - b*f(a))/(f(b)-f(a));
   if f(a)*f(x) > 0
       a = x;
   else
       b = x;
   end
   fprintf('%d -> b-a = %e |f(x)| = %e\n', k, (b-a), abs(f(x)));
end

fprintf('Após %d iterações:\nx = %e\nf(x) = %e\n', k, x, f(x));