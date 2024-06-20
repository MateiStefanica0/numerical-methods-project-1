function [P] = get_lower_inverse (L)
  # TO DO: Determinati printr-o metoda matriceala neiterativa inversa
  # unei matrici de tipul lower
  % am folosit algoritmul de eliminare gaussiana cu pivotare partiala de la curs
  [m m] = size(L);
  P = eye(m); % asta va fi inversa
  L = [L P];
  for i = 1 : m
    L(i, :) = 1 / L(i, i) * L(i, :); 
    for j =  i + 1 : m
      L(j, :) = L(j, :) - L(j, i) * L(i, :);
    endfor
  endfor
 
   P = L(:, m + 1 : 2 * m);
endfunction
