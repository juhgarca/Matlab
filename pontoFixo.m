%======================================
%Implementação Método do Ponto Fixo
%Autora: Juliana Lima Garça
%======================================

clear
clc

fprintf('----> Método do Ponto Fixo <----\n');

f = @(x)(x-1)^2*(x-1.5);
phi = @(x)x-1.3*(x*log(x)-1);
x0 = 2.5;
e1 = 10^-7;
e2 = 10^-7;

if abs(f(x0)) < e1
    fprintf('x = %f\n', x0);
    return
end
k = 0;
kmax = 50;
while (k < kmax)
    k = k+1;
    x = phi(x0);
    if (abs(f(x)) < e1) || (abs(x - x0) < e2)
        fprintf('Após %d iterações:\nx = %e\nf(x) = %e\n', k, x, f(x));
        return
    else
        x0 = x;
    end
    fprintf('%d -> |f(x)| = %e |x-x0| = %e\n', k, abs(f(x)), x-x0);
end