function B = k_secv (A, k)
  % given an array [a b a b c] and k=2
  % should return [ab ba ab bc]
  % HINT: use strjoin 
  [m n] = size(A);
  C = {};
  for i = 1 : m - k + 1
    aux = {};
    for j = 0 : k - 1
     aux = [aux, A(i + j)]; 
    endfor
    a = cell2mat(A(i));
    a = strjoin(aux, ' ');
    C = [C,a];
  endfor
  B = C';
  [m n] = size(B);
  B(m) = [];
endfunction
