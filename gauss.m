% Método da Eliminação de Gauss

clear
clc

A = [3 2 4; 1 1 2; 4 3 -2];
b = [1; 2; 3];
n = size(A, 2);
x = zeros(n, 1);

for k = 1:n-1
    for i = k+1:n
        m = A(i,k)/A(k,k);
        A(i,k) = 0;
        for j = k+1:n
            A(i,j) = A(i,j) - m*A(k,j);
        end
        b(i) = b(i) - m*b(k);
    end
end

x(n) = b(n)/A(n,n);
for k = n-1:-1:1
    s = 0;
    for j = k+1:n
        s = s+A(k,j)*x(j);
        x(k) = (b(k)-s)/A(k,k);
    end
end

fprintf('A solução deste sistema é o vetor\n');
fprintf('%f\n', x);