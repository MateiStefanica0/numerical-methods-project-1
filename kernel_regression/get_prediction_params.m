function [a] = get_prediction_params (K, y, lambda)
  # TO DO: folosind metode neiterative, implementati logica
  # pentru a obtine vectorul coloana a, asa cum este descris in enuntul temei
  [m m] = size(K);
  identitate = eye(m);
  matrice = lambda * identitate + K;
  L = cholesky(matrice);
  L_inv = get_lower_inverse(L);
  matrice_inversa = L_inv' * L_inv;
  a = lambda * matrice_inversa * y;
endfunction
