%======================================
%Implementação Método de Newton-Raphson
%Autora: Juliana Lima Garça
%======================================

clear
clc

x = sym('x');

fprintf('----> Método de Newton-Raphson <----\n');

f = @(x)((x-1)^2)*(x-1.5);
x0 = 1.501953;
e1 = 10^-7;
e2 = 10^-7;

h = char(diff(f(x)));
temp = strcat('@(x)', h);
df = str2func(temp);

if abs(f(x0)) < e1
    x = x0;
    return
end
k = 0;
kmax = 25;
while (k < kmax)
    k = k+1;
    x = x0 - f(x0)/df(x0);
    if (abs(f(x)) < e1) || (abs(x - x0) < e2)
        fprintf('Após %d iterações:\nx = %e\nf(x) = %e\n', k, x, f(x));
        return
    else
        x0 = x;
    end
    fprintf('%d -> |f(x)| = %e |x-x0| = %e\n', k, abs(f(x)), abs(x-x0));
end