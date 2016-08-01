%Implementação da Fatoração LU com pivoteamento parcial e 
% fatoração de Cholesky
%
%Autora: Juliana Lima Garça
%Última modificação: 01/05/2016
%
%OBSERVAÇÃO: Em todos os testes realizados não foi possível gerar uma
% matriz definida positiva com n = 500.

clear
clc

fprintf('\n>>> Execução <<<\n');

v = [50, 100];
for o = 1:size(v,2)
    n = v(o);
    p = 1;
    while p ~= 0
        A = rand(n);
        T = triu(A);
        C = T'*A;
        [R, p] = chol(C);
    end

fprintf('\n---- n = %d ----\n', n);
%Fatoração LU com Pivoteamento Parcial
fprintf('Fatoração LU com pivoteamento parcial\n');

x = ones(n, 1);
y = zeros(n, 1);
b = C * x;
xb = zeros(n, 1);
 
[L, U, P] = lu(C);
pb = P * b;

for i = 1:n
    soma = 0;
    for j = 1:i-1
        soma = soma + L(i, j)*y(j);
    end
    y(i) = pb(i) - soma;
end        

for i = n:-1:1
    soma = 0;
    for j = i+1:n
        soma = soma + U(i, j)*xb(j);
    end
    xb(i) = (y(i) - soma)/U(i, i);
end

result = norm(x - xb);
fprintf('norm(x-xb) = %e\n', result);


%Fatoração de Cholesky
fprintf('\nFatoração de Cholesky\n');

y = zeros(n, 1);
b = C * x;
xb = zeros(n, 1);
G = chol(C);

for i = 1:n
    soma = 0;
    for j = 1:i-1
        soma = soma + G(i, j)*y(j);
    end
    y(i) = b(i) - soma;
end   

G2 = G';
for i = n:-1:1
    soma = 0;
    for j = i+1:n
        soma = soma + G2(i, j)*xb(j);
    end
    xb(i) = (y(i) - soma)/G2(i, i);
end

result = norm(x - xb);
fprintf('norm(x-xb) = %e\n', result);

end