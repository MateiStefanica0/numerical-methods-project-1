% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values variances] = estimate_gaussian(X)
  [m n] = size(X);
  % am aflat dimensiunile matricei si am initializat variabilele pe care trebuie
  % sa le returnez cu 0
  mean_values = zeros(1, n);
  variances = zeros(n);

  for i = 1 : n
    aux = 0;
    % aux e variabila in care se face suma pe componente a lui mean values
    for k = 1 : m
      aux = aux + X(k, i);
    endfor
    % pentru fiecare component, impart suma la m
    mean_values(i) = 1 / m * aux;
  endfor

  for i = 1 : m
    variances = variances + ((X(i, :) - mean_values)' * (X(i, :) - mean_values));
  endfor
  variances = (1 / m) * variances;
endfunction

