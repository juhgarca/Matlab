%Implementação da Interpolação Polinomial de Newton para o exemplo 9
%(página 249) do livro texto da disciplina.

clear
clc

x = [0.2 0.34 0.4 0.52 0.6 0.72];
y = [0.16 0.22 0.27 0.29 0.32 0.37];
x2 = 0.47;

n = size(x, 2)-1;
A = zeros(n+1, n+1);

for i=1:n+1
    A(i, 1) = y(i);
end

for i=2:n+1
    for j=1:n-i
        A(j, i) = (A(j+1, i-1) - A(j, i-1)) / (x(i+j)-x(j));
    end
end

p = 1;
y2 = A(1, 1);

for i=2:n+1
    p = (x2 - x(i-1)) * p;
    y2 = y2 + p*A(1, i);
end

disp(A);