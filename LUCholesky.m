clear
clc

A = rand(3);
B = A;
n = size(A, 2);
for k = 1:n
    A(k+1:n, k) = 0;
end
C = A'*B;
G = chol(C);

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

fprintf('Resultado\n');
result = norm(x - xb);
disp(norm(x-xb));

fprintf('Fatoração de Cholesky\n');

y = zeros(n, 1);
b = C * x;
xb = zeros(n, 1);

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

fprintf('Resultado\n');
disp(norm(x-xb));
