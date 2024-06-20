function [L] = cholesky (A)
    # TO DO: realizati descompunerea cholesky pentru o matrice
    # positiv definita
    [m n] = size(A);
    L = zeros(n);
     for i = 1 : n
        for j = 1 : i
            if i == j
                L(i, i) = sqrt(A(i, i) - sum(L(i, 1 : i - 1) .^ 2));
            else
                L(i, j) = (A(i, j) - L(i, 1 : j - 1) * L(j, 1 : j - 1)') / L(j, j);
            endif
        endfor
    endfor
endfunction
