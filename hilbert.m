%Implementa��o das Matrizes de Hilbert
%
%Autora: Juliana Lima Gar�a
%�ltima modifica��o: 01/05/2016

clear
clc

fprintf('\n>>> Execu��o <<<\n');

v = [3, 4, 5, 6, 7, 8, 9, 10];
for i = 1:size(v,2)
    n = v(i);
    x = ones(n, 1);
    H = hilb(n);
    b = zeros(n, 1);
    for j = 1:n
        b(j) = 1/(j);
    end
    xb = H\b;


    fprintf('----- n = %d -----\n', n);
    disp(norm(x-xb));
    disp(cond(H));

end

%---------------------------------------------------

i = 0;
p = 0;
while p == 0
    i = i+1;
    H = hilb(i);
    [R, p] = chol(H);
end

fprintf('Matrizes de Hilbert s�o definidas positivas at� a ordem %d\n', i-1);