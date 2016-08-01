%======================================
%Implementa��o M�todo da Secante
%Autora: Juliana Lima Gar�a
%======================================

clear
clc

fprintf('----> M�todo da Secante <----\n');

f = @(x)(x-1)^2*(x-1.5);
x0 = 2.3;
x1 = 2.7;
e1 = 10^-7;
e2 = 10^-7;

if abs(f(x0)) < e1
    x = x0;
    return
elseif (abs(f(x1)) < e1) || (x1-x0 < e2)
    x = x1;
    return
end

k = 0;
kmax = 50;
while (k < kmax)
    k = k+1;
    x = x1 - (f(x1)/(f(x1)-f(x0)))*(x1-x0);
    if (abs(f(x)) < e1) || (abs(x - x1) < e2)
        fprintf('Ap�s %d itera��es:\nx = %e\nf(x) = %e\n', k, x, f(x));
        return
    else
        x0 = x1;
        x1 = x;
    end
    fprintf('%d -> f(x) = %e |x-x1| = %e\n', k, f(x), abs(x-x1));
end