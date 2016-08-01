%======================================
%Implementação Método da Bissecção
%Autora: Juliana Lima Garça
%======================================

clear
clc

fprintf('----> Método da Bissecção <----\n');

f = @(x)(x-1)^2*(x-1.5);
a = 0.5;
b = 2;
e = 10^-2;

if b - a < e
    x = (a+b)/2;
    fprintf('x = %f\n', x);
    return
end
k = 0;
kmax = 50;
while (b-a > e) && (k < kmax)
    k = k+1;
    x = (a+b)/2;
    if f(a)*f(x) > 0
        a = x;
    else
        b = x;
    end
    fprintf('%d -> b-a = %e\n', k, b-a);
end

fprintf('Após %d iterações:\nx = %e\nf(x) = %e\n', k, x, f(x));
