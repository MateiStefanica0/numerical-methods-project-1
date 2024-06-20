% Computes the probability density function of the multivariate gaussian distribution.
function probabilities = multivariate_gaussian(X, mean_values, variances)
  [m n] = size(X);
  probabilities = zeros(m, 1);
  % am determinat dimensiunile matricei A si am initializat probabilities cu 0
  % am folosit variabilele a si b pentru a face formula mai usor de citit
  for i = 1 : m
    a = (2 * pi) ^ (n / 2) * det(variances) ^ (1 / 2);
    b = (-1/2) * (X(i, :) - mean_values) * inv(variances) * (X(i, :) - mean_values)';
    probabilities(i) = (1 / a) * exp(b);
  endfor
endfunction
