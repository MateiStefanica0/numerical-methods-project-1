function [a] = get_prediction_params_iterative (K, y, lambda)
  # TO DO: folosind metode iterative, implementati logica
  # pentru a obtine vectorul coloana a, asa cum este descris in enuntul temei
  [m n] = size(K);
  identitate = eye(m);
  x0 = zeros(m, 1);
  matrice = lambda * identitate + K;
  y = lambda * y;
  a = conjugate_gradient(matrice, y, x0, 0.001, 1000);
endfunction
